import type { Metadata } from 'next';
import { loginAction } from '@/app/actions/auth';
import { buildMetadata } from '@/lib/seo';

export const metadata: Metadata = buildMetadata({
  title: 'ログイン',
  description: '管理者ログイン',
  path: '/login',
  noindex: true,
});

export default function LoginPage({
  searchParams,
}: {
  searchParams: { next?: string; error?: string };
}) {
  const errorMessage = decodeError(searchParams.error);
  return (
    <div className="mx-auto max-w-md px-4 py-12">
      <h1 className="text-2xl font-bold text-ink mb-2">管理者ログイン</h1>
      <p className="text-sm text-ink-dim mb-6">
        管理画面は管理者のみアクセスできます。
      </p>
      <form action={loginAction} className="space-y-4">
        <input type="hidden" name="next" value={searchParams.next ?? '/admin'} />
        <div>
          <label htmlFor="email" className="label">メールアドレス</label>
          <input id="email" name="email" type="email" required autoComplete="email" className="input" />
        </div>
        <div>
          <label htmlFor="password" className="label">パスワード</label>
          <input id="password" name="password" type="password" required autoComplete="current-password" className="input" />
        </div>
        {errorMessage && (
          <div className="rounded-md border border-accent-red/40 bg-accent-red/10 px-3 py-2 text-sm text-accent-red">
            {errorMessage}
          </div>
        )}
        <button type="submit" className="btn-primary w-full">ログイン</button>
      </form>
    </div>
  );
}

function decodeError(error?: string): string | null {
  if (!error) return null;
  if (error === 'unauthenticated') return 'ログインが必要です。';
  if (error === 'forbidden') return '管理者権限がありません。';
  if (error === 'misconfigured') return '環境変数が設定されていません。';
  if (error === 'missing') return 'メールアドレスとパスワードを入力してください。';
  return decodeURIComponent(error);
}
