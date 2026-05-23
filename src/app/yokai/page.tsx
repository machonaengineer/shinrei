import Link from 'next/link';
import type { Metadata } from 'next';
import { YOKAI_LIST, YOKAI_CLASSIFICATIONS } from '@/content/yokai';
import { buildMetadata } from '@/lib/seo';

export const metadata: Metadata = buildMetadata({
  title: '妖怪図鑑',
  description: '日本と世界の妖怪・怪異・伝承上の存在を分類別に紹介する妖怪図鑑です。河童・座敷童・天狗から、口裂け女・八尺様などの現代妖怪、海外のバンシー・吸血鬼まで。',
  path: '/yokai',
});

export const dynamic = 'force-static';

export default function YokaiIndexPage() {
  return (
    <div className="mx-auto max-w-4xl px-4 py-8 space-y-8">
      <header>
        <h1 className="text-2xl md:text-3xl font-bold text-ink">👹 妖怪図鑑</h1>
        <p className="text-sm text-ink-dim mt-1">
          日本と世界の妖怪・怪異・伝承上の存在を、分類別に紹介します。掲載内容は民俗・伝承情報を基にしたもので、内容の真偽を保証するものではありません。
        </p>
      </header>

      {YOKAI_CLASSIFICATIONS.map((cls) => {
        const items = YOKAI_LIST.filter((y) => y.classification === cls.slug);
        if (items.length === 0) return null;
        return (
          <section key={cls.slug}>
            <h2 className="text-lg font-semibold text-ink mb-1">
              {cls.emoji} {cls.name}
              <span className="ml-2 text-xs text-ink-muted">{items.length}件</span>
            </h2>
            <p className="text-xs text-ink-muted mb-3">{cls.description}</p>
            <ul className="grid gap-3 sm:grid-cols-2 lg:grid-cols-3">
              {items.map((y) => (
                <li key={y.slug}>
                  <Link
                    href={`/yokai/${y.slug}`}
                    className="surface-card block p-3 hover:border-accent h-full"
                  >
                    <div className="flex items-baseline justify-between">
                      <span className="text-ink font-medium">{y.name}</span>
                      <span className="text-xs text-ink-muted">{y.reading}</span>
                    </div>
                    <div className="text-xs text-ink-dim mt-1 line-clamp-2">{y.appearance}</div>
                    <div className="text-[10px] text-ink-muted mt-2">{y.region.join(' / ')}</div>
                  </Link>
                </li>
              ))}
            </ul>
          </section>
        );
      })}
    </div>
  );
}
