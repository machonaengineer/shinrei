'use client';

import { useEffect, useState } from 'react';
import Link from 'next/link';
import { favoritesCount, FAVORITES_CHANGED } from '@/lib/favorites';

export function FavoritesNavLink({ className }: { className?: string }) {
  const [count, setCount] = useState(0);
  const [mounted, setMounted] = useState(false);

  useEffect(() => {
    setMounted(true);
    const refresh = () => setCount(favoritesCount());
    refresh();
    window.addEventListener(FAVORITES_CHANGED, refresh);
    return () => window.removeEventListener(FAVORITES_CHANGED, refresh);
  }, []);

  return (
    <Link href="/favorites" className={className ?? 'hover:text-ink relative'}>
      ♥ お気に入り
      {mounted && count > 0 && (
        <span className="ml-1 inline-flex items-center justify-center rounded-full bg-accent-red text-white text-[10px] min-w-[16px] h-4 px-1">
          {count}
        </span>
      )}
    </Link>
  );
}
