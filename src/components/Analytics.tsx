import Script from 'next/script';
import { Analytics as VercelAnalytics } from '@vercel/analytics/react';
import { SpeedInsights } from '@vercel/speed-insights/next';

export function SiteAnalytics() {
  const ga = process.env.NEXT_PUBLIC_GA_MEASUREMENT_ID;
  const adsense = process.env.NEXT_PUBLIC_ADSENSE_CLIENT_ID;

  return (
    <>
      {/* Vercel Analytics (always enabled on Vercel deployments) */}
      <VercelAnalytics />
      <SpeedInsights />

      {/* Google Analytics 4 */}
      {ga && (
        <>
          <Script
            src={`https://www.googletagmanager.com/gtag/js?id=${ga}`}
            strategy="afterInteractive"
          />
          <Script id="ga-init" strategy="afterInteractive">{`
            window.dataLayer = window.dataLayer || [];
            function gtag(){dataLayer.push(arguments);}
            gtag('js', new Date());
            gtag('config', '${ga}', { anonymize_ip: true });
          `}</Script>
        </>
      )}

      {/* Google AdSense */}
      {adsense && (
        <Script
          async
          src={`https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=${adsense}`}
          crossOrigin="anonymous"
          strategy="afterInteractive"
        />
      )}
    </>
  );
}
