'use client';

import { useEffect, useRef } from 'react';

declare global {
  interface Window {
    adsbygoogle: unknown[];
  }
}

type Props = {
  /** Specific ad slot id (created in AdSense console). Optional during ramp-up. */
  slot?: string;
  format?: 'auto' | 'horizontal' | 'rectangle' | 'vertical' | 'fluid';
  layout?: string;
  className?: string;
  responsive?: boolean;
  /** Short hint shown above the unit so users know it's an ad (AdSense policy). */
  label?: string;
};

export function AdSlot({
  slot,
  format = 'auto',
  layout,
  className = '',
  responsive = true,
  label = 'スポンサーリンク',
}: Props) {
  const client = process.env.NEXT_PUBLIC_ADSENSE_CLIENT_ID;
  const insRef = useRef<HTMLModElement>(null);

  useEffect(() => {
    if (!client) return;
    try {
      (window.adsbygoogle = window.adsbygoogle || []).push({});
    } catch {
      /* ignore */
    }
  }, [client]);

  if (!client) {
    return null;
  }

  return (
    <div className={`my-6 ${className}`}>
      <div className="text-[10px] text-ink-muted tracking-widest text-center mb-1">
        {label}
      </div>
      <div className="text-center">
        <ins
          ref={insRef}
          className="adsbygoogle"
          style={{ display: 'block' }}
          data-ad-client={client}
          data-ad-slot={slot}
          data-ad-format={format}
          data-ad-layout={layout}
          data-full-width-responsive={responsive ? 'true' : 'false'}
        />
      </div>
    </div>
  );
}
