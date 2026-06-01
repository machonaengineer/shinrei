'use client';

import Link from 'next/link';
import { trackEvent, Events } from '@/lib/analytics';

type Props = {
  href: string;
  label: string;
  variant?: 'primary' | 'secondary';
  source: string;
  className?: string;
};

export function SubmitCtaLink({ href, label, variant = 'primary', source, className }: Props) {
  const cls =
    className ??
    (variant === 'primary'
      ? 'btn-primary text-sm'
      : 'btn-secondary text-sm');

  return (
    <Link
      href={href}
      className={cls}
      onClick={() => trackEvent(Events.SubmitCtaClick, { source, href })}
    >
      {label}
    </Link>
  );
}
