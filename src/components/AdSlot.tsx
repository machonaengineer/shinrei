'use client';

import { useEffect, useRef } from 'react';

declare global {
  interface Window {
    adsbygoogle: unknown[];
  }
}

type Props = {
  slot?: string;
  format?: 'auto' | 'horizontal' | 'rectangle' | 'vertical' | 'fluid';
  layout?: string;
  className?: string;
  responsive?: boolean;
  testMode?: boolean;
};

/**
 * Google AdSense ad slot.
 * Renders nothing if NEXT_PUBLIC_ADSENSE_CLIENT_ID is not set.
 */
export function AdSlot({
  slot,
  format = 'auto',
  layout,
  className = '',
  responsive = true,
}: Props) {
  const client = process.env.NEXT_PUBLIC_ADSENSE_CLIENT_ID;
  const insRef = useRef<HTMLModElement>(null);

  useEffect(() => {
    if (!client) return;
    try {
      (window.adsbygoogle = window.adsbygoogle || []).push({});
    } catch {
      /* ignore - happens during dev hot reload */
    }
  }, [client]);

  if (!client) {
    return null;
  }

  return (
    <div className={`my-6 text-center ${className}`}>
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
  );
}
