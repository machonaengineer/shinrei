// Serves /ads.txt for AdSense ownership verification.
// Set NEXT_PUBLIC_ADSENSE_CLIENT_ID = "ca-pub-XXXXXXXXXXXXXXXX" in env to enable.
// AdSense will reject your account if ads.txt is missing or wrong.

export const dynamic = 'force-static';

export function GET() {
  const client = process.env.NEXT_PUBLIC_ADSENSE_CLIENT_ID;
  if (!client) {
    return new Response('# ads.txt not configured (set NEXT_PUBLIC_ADSENSE_CLIENT_ID)\n', {
      headers: { 'Content-Type': 'text/plain; charset=utf-8' },
    });
  }
  // AdSense expects: pub-XXXX (without ca- prefix)
  const pubId = client.replace(/^ca-/, '');
  const body = `google.com, ${pubId}, DIRECT, f08c47fec0942fa0\n`;
  return new Response(body, {
    headers: { 'Content-Type': 'text/plain; charset=utf-8' },
  });
}
