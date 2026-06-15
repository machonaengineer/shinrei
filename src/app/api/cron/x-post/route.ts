import { NextResponse } from 'next/server';
import { ARTICLES } from '@/content/articles';
import { siteUrl } from '@/lib/seo';

export const dynamic = 'force-dynamic';
export const runtime = 'nodejs';

/**
 * Weekly X (Twitter) auto-post. Runs via Vercel Cron.
 *
 * Setup:
 *   - X Developer Portal で Free tier アプリ作成
 *   - User context: OAuth1.0a の API key/secret + Access token/secret を発行
 *   - Vercel env に X_API_KEY / X_API_SECRET / X_ACCESS_TOKEN / X_ACCESS_SECRET
 *   - Vercel env に CRON_SECRET（適当なランダム文字列）
 *
 * Rotation: ISO week number modulo article count for deterministic rotation.
 * Skip if any env is missing or if Twitter API fails (don't 500 the cron).
 */
export async function GET(req: Request) {
  // protect from unauthorized triggers
  const auth = req.headers.get('authorization');
  const cronSecret = process.env.CRON_SECRET;
  if (cronSecret && auth !== `Bearer ${cronSecret}`) {
    return NextResponse.json({ ok: false, error: 'unauthorized' }, { status: 401 });
  }

  const apiKey = process.env.X_API_KEY;
  const apiSecret = process.env.X_API_SECRET;
  const accessToken = process.env.X_ACCESS_TOKEN;
  const accessSecret = process.env.X_ACCESS_SECRET;

  if (!apiKey || !apiSecret || !accessToken || !accessSecret) {
    return NextResponse.json({ ok: false, skipped: 'x credentials missing' });
  }

  // pick article by ISO week
  const week = isoWeekNumber(new Date());
  const article = ARTICLES[week % ARTICLES.length];
  if (!article) {
    return NextResponse.json({ ok: false, error: 'no article' });
  }

  const base = siteUrl().replace(/\/$/, '');
  const url = `${base}/articles/${article.slug}`;
  const text = buildPost(article.title, article.description, url);

  try {
    const status = await postToX(text, {
      apiKey, apiSecret, accessToken, accessSecret,
    });
    return NextResponse.json({ ok: true, posted: status, slug: article.slug });
  } catch (e) {
    return NextResponse.json({
      ok: false,
      error: (e as Error).message,
      slug: article.slug,
    });
  }
}

function buildPost(title: string, description: string, url: string): string {
  // 280 char limit on X. URLs count as 23 chars.
  const HASHTAGS = '\n\n#心霊スポット #怪談 #都市伝説 #民俗学';
  const URL_AND_TAGS = `\n${url}${HASHTAGS}`;
  const remaining = 280 - URL_AND_TAGS.length - title.length - 2;
  const desc = description.length > remaining
    ? description.slice(0, remaining - 1) + '…'
    : description;
  return `${title}\n${desc}${URL_AND_TAGS}`;
}

function isoWeekNumber(d: Date): number {
  const date = new Date(Date.UTC(d.getUTCFullYear(), d.getUTCMonth(), d.getUTCDate()));
  date.setUTCDate(date.getUTCDate() + 4 - (date.getUTCDay() || 7));
  const yearStart = new Date(Date.UTC(date.getUTCFullYear(), 0, 1));
  return Math.ceil(((date.getTime() - yearStart.getTime()) / 86400000 + 1) / 7);
}

// OAuth 1.0a signing for X API v2 POST /2/tweets
async function postToX(
  text: string,
  creds: { apiKey: string; apiSecret: string; accessToken: string; accessSecret: string },
): Promise<{ id: string }> {
  const url = 'https://api.x.com/2/tweets';
  const method = 'POST';
  const oauth = await buildOAuth(method, url, '', creds);
  const res = await fetch(url, {
    method,
    headers: {
      Authorization: oauth,
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({ text }),
  });
  if (!res.ok) {
    const body = await res.text();
    throw new Error(`X API ${res.status}: ${body.slice(0, 300)}`);
  }
  const json = (await res.json()) as { data?: { id?: string } };
  return { id: json.data?.id ?? '' };
}

async function buildOAuth(
  method: string,
  url: string,
  bodyForSig: string,
  creds: { apiKey: string; apiSecret: string; accessToken: string; accessSecret: string },
): Promise<string> {
  const crypto = await import('node:crypto');
  const nonce = crypto.randomBytes(16).toString('hex');
  const timestamp = Math.floor(Date.now() / 1000).toString();
  const params: Record<string, string> = {
    oauth_consumer_key: creds.apiKey,
    oauth_nonce: nonce,
    oauth_signature_method: 'HMAC-SHA1',
    oauth_timestamp: timestamp,
    oauth_token: creds.accessToken,
    oauth_version: '1.0',
  };
  // include body params only for form-encoded; v2 JSON body is NOT included in sig
  void bodyForSig;
  const sorted = Object.keys(params).sort().map((k) =>
    `${encodeURIComponent(k)}=${encodeURIComponent(params[k])}`).join('&');
  const base = `${method}&${encodeURIComponent(url)}&${encodeURIComponent(sorted)}`;
  const signingKey = `${encodeURIComponent(creds.apiSecret)}&${encodeURIComponent(creds.accessSecret)}`;
  const sig = crypto.createHmac('sha1', signingKey).update(base).digest('base64');
  params.oauth_signature = sig;
  return 'OAuth ' + Object.keys(params)
    .sort()
    .map((k) => `${encodeURIComponent(k)}="${encodeURIComponent(params[k])}"`)
    .join(', ');
}
