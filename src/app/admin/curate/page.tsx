import Link from 'next/link';
import { supabaseAdmin } from '@/lib/supabase';
import { CATEGORY_BY_SLUG } from '@/lib/constants';
import { addEditorialReviewAction } from '@/app/actions/admin-curation';

export const dynamic = 'force-dynamic';

/**
 * Fast curation tool: lists imported spots (= currently noindex, no UGC)
 * with a tiny inline form to attach a short editorial blurb. Adding one
 * review "promotes" the spot to index-worthy.
 *
 * Pick the spots smartly:
 *  - imported (has wikipedia/community-site source)
 *  - has NO published review
 *  - prefer ones with higher review_count or scary_score (more famous)
 */
export default async function CurationPage({ searchParams }: { searchParams: { page?: string } }) {
  const admin = supabaseAdmin();
  const page = Math.max(0, Number(searchParams.page ?? 0));
  const PAGE = 20;

  // 1) get all spots that have an editorial review or any published review
  const { data: reviewedRows } = await admin
    .from('reviews')
    .select('spot_id')
    .eq('status', 'published')
    .limit(50000);
  const reviewed = new Set<string>((reviewedRows ?? []).map((r) => r.spot_id));

  // 2) get spot_ids for imported spots
  const { data: importedRows } = await admin
    .from('sources')
    .select('spot_id')
    .in('source_type', ['wikipedia', 'community-site'])
    .limit(50000);
  const importedIds = Array.from(
    new Set((importedRows ?? []).map((s) => s.spot_id).filter((x): x is string => Boolean(x))),
  );

  // 3) fetch spot details for the page slice, ordered by scary_score then review_count
  const targetIds = importedIds.slice(page * PAGE * 4, page * PAGE * 4 + PAGE * 4);
  const { data: spots } = await admin
    .from('spots')
    .select('id, name, slug, prefecture, category, category_slug, scary_score, review_count, description')
    .in('id', targetIds.length ? targetIds : ['00000000-0000-0000-0000-000000000000'])
    .eq('status', 'published')
    .order('scary_score', { ascending: false })
    .order('review_count', { ascending: false });

  const queue = (spots ?? []).filter((s) => !reviewed.has(s.id)).slice(0, PAGE);

  return (
    <div className="space-y-6">
      <header>
        <h2 className="text-xl font-bold text-ink">⚡ 編集部解説の高速追加</h2>
        <p className="text-xs text-ink-muted mt-1 leading-relaxed">
          インポート由来でUGC無し（=現在noindex）のスポットに、編集部としての短い解説を付けます。
          1件付けるとそのスポットは「価値あるページ」に昇格し、検索エンジンとAdSenseの評価対象になります。
          短くて構いません（20文字以上）。地域の文化背景・カテゴリ的な説明・伝承の概要など、独自の視点を1〜3文で。
        </p>
        <p className="text-[10px] text-ink-muted mt-1">
          ※ 嘘や断定（事件・死亡など）は絶対に書かないこと。「噂が語られる」「と伝えられる」など伝承トーンで。
        </p>
      </header>

      <div className="flex items-center gap-2 text-sm">
        <Link
          href={`/admin/curate?page=${Math.max(0, page - 1)}`}
          className="btn-secondary text-xs"
        >
          ← 前へ
        </Link>
        <span className="text-ink-dim">ページ {page + 1}</span>
        <Link
          href={`/admin/curate?page=${page + 1}`}
          className="btn-secondary text-xs"
        >
          次へ →
        </Link>
        <span className="ml-2 text-xs text-ink-muted">残り対象: 約 {importedIds.length - reviewed.size} 件</span>
      </div>

      {queue.length === 0 ? (
        <div className="surface-card p-6 text-center text-ink-dim">
          このページに対象スポットがありません。「次へ」を押すか、ページ番号を変えてください。
        </div>
      ) : (
        <ul className="space-y-3">
          {queue.map((s) => {
            const cat = CATEGORY_BY_SLUG[s.category_slug];
            const placeholder = buildPlaceholder(s.name, s.prefecture, cat?.name ?? '');
            return (
              <li key={s.id} className="surface-card p-3">
                <div className="flex items-start justify-between gap-3 mb-2">
                  <div className="flex-1">
                    <Link href={`/spots/${encodeURIComponent(s.slug)}`} target="_blank" className="text-ink hover:text-accent font-medium">
                      {s.name}
                    </Link>
                    <div className="text-xs text-ink-muted">
                      {s.prefecture} · {cat ? `${cat.emoji} ${cat.name}` : s.category}
                    </div>
                  </div>
                </div>
                <form action={addEditorialReviewAction} className="space-y-2">
                  <input type="hidden" name="spotId" value={s.id} />
                  <textarea
                    name="body"
                    rows={2}
                    minLength={20}
                    maxLength={400}
                    required
                    placeholder={placeholder}
                    className="input w-full text-sm"
                  />
                  <div className="flex items-center gap-2 text-xs">
                    <label className="text-ink-dim">
                      怖さ:
                      <select name="scary" defaultValue="3" className="input py-0.5 ml-1 text-xs">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                      </select>
                    </label>
                    <button type="submit" className="btn-primary text-xs ml-auto">
                      編集部解説として保存（即公開）
                    </button>
                  </div>
                </form>
              </li>
            );
          })}
        </ul>
      )}
    </div>
  );
}

function buildPlaceholder(name: string, pref: string, cat: string): string {
  return `例：${name}は、${pref}で古くから怪談や噂が語られることがある${cat || 'スポット'}です。地元では${'…'} という伝承が知られているとされます。真偽は定かではありません。`;
}
