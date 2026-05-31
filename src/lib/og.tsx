import { ImageResponse } from 'next/og';

export const size = { width: 1200, height: 630 };
export const contentType = 'image/png';

/**
 * Shared OGP image renderer.
 * Dark night-map look without lurid horror imagery.
 *
 * Usage from /opengraph-image.tsx files:
 *   export const runtime = 'edge';
 *   export const size = ogSize;
 *   export const contentType = ogContentType;
 *   export default async function Image() {
 *     return renderOg({ title: '心霊マップ', subtitle: '...', tag: '5,680件' });
 *   }
 */
export type OgInput = {
  title: string;
  subtitle?: string;
  tag?: string;
  emoji?: string;
};

const ACCENT = '#9d4edd';
const BG = '#0a0a0f';
const BG_SOFT = '#161823';
const BORDER = '#23253a';
const INK = '#e7e7ee';
const INK_DIM = '#a0a0b5';

function MapGrid() {
  // Decorative scattered dots — Satori-safe (no CSS gradients).
  const dots: Array<{ x: number; y: number }> = [];
  for (let y = 30; y < 600; y += 60) {
    for (let x = 30; x < 1170; x += 60) dots.push({ x, y });
  }
  return (
    <>
      {dots.map((d, i) => (
        <div
          key={`g-${i}`}
          style={{
            position: 'absolute',
            top: d.y,
            left: d.x,
            width: 2,
            height: 2,
            background: '#9d4edd',
            opacity: 0.18,
          }}
        />
      ))}
    </>
  );
}

function PinDots() {
  // scattered pin dots — purely decorative
  const pins = [
    { x: 180, y: 130 },
    { x: 320, y: 250 },
    { x: 80, y: 360 },
    { x: 240, y: 460 },
    { x: 380, y: 110 },
    { x: 120, y: 510 },
    { x: 1060, y: 480 },
    { x: 980, y: 190 },
    { x: 1130, y: 320 },
    { x: 870, y: 380 },
    { x: 760, y: 80 },
    { x: 800, y: 540 },
  ];
  return (
    <>
      {pins.map((p, i) => (
        <div
          key={i}
          style={{
            position: 'absolute',
            top: p.y,
            left: p.x,
            width: 10,
            height: 10,
            borderRadius: 999,
            background: ACCENT,
            opacity: 0.6,
            border: `4px solid rgba(157,78,221,0.18)`,
          }}
        />
      ))}
    </>
  );
}

export function ogTemplate({ title, subtitle, tag, emoji = '👻' }: OgInput) {
  return (
    <div
      style={{
        width: '100%',
        height: '100%',
        background: BG,
        color: INK,
        display: 'flex',
        position: 'relative',
        fontFamily:
          '"Hiragino Sans","Noto Sans JP",ui-sans-serif,system-ui,sans-serif',
      }}
    >
      <MapGrid />
      <PinDots />

      {/* solid accent glow blob */}
      <div
        style={{
          position: 'absolute',
          left: 800,
          top: 200,
          width: 600,
          height: 600,
          borderRadius: 999,
          background: '#9d4edd',
          opacity: 0.08,
          filter: 'blur(80px)',
        }}
      />

      {/* card */}
      <div
        style={{
          position: 'absolute',
          left: 80,
          top: 80,
          right: 80,
          bottom: 80,
          background: `${BG_SOFT}cc`,
          border: `1px solid ${BORDER}`,
          borderRadius: 28,
          padding: '60px 70px',
          display: 'flex',
          flexDirection: 'column',
          justifyContent: 'space-between',
        }}
      >
        {/* header */}
        <div style={{ display: 'flex', alignItems: 'center', gap: 14 }}>
          <div
            style={{
              width: 56,
              height: 56,
              borderRadius: 14,
              background: ACCENT,
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'center',
              fontSize: 32,
              border: `2px solid rgba(255,255,255,0.08)`,
            }}
          >
            {emoji}
          </div>
          <div
            style={{
              fontSize: 28,
              color: INK,
              letterSpacing: 4,
              fontWeight: 700,
            }}
          >
            心霊マップ
          </div>
          <div
            style={{
              marginLeft: 'auto',
              fontSize: 18,
              color: INK_DIM,
              letterSpacing: 2,
            }}
          >
            shinrei.vercel.app
          </div>
        </div>

        {/* title */}
        <div style={{ display: 'flex', flexDirection: 'column', gap: 24 }}>
          {tag && (
            <div
              style={{
                alignSelf: 'flex-start',
                padding: '8px 18px',
                borderRadius: 999,
                background: `${ACCENT}1f`,
                border: `1px solid ${ACCENT}66`,
                color: INK,
                fontSize: 24,
                fontWeight: 600,
              }}
            >
              {tag}
            </div>
          )}
          <div
            style={{
              fontSize: title.length > 28 ? 56 : 72,
              fontWeight: 800,
              lineHeight: 1.15,
              color: INK,
              letterSpacing: 1,
            }}
          >
            {title}
          </div>
          {subtitle && (
            <div
              style={{
                fontSize: 26,
                color: INK_DIM,
                lineHeight: 1.5,
              }}
            >
              {subtitle}
            </div>
          )}
        </div>

        {/* footer */}
        <div
          style={{
            display: 'flex',
            justifyContent: 'space-between',
            alignItems: 'center',
            fontSize: 20,
            color: INK_DIM,
          }}
        >
          <div>全国の心霊・怪談・都市伝説スポットを地図で探す</div>
          <div style={{ color: ACCENT, fontWeight: 700 }}>SHINREI MAP</div>
        </div>
      </div>
    </div>
  );
}

export async function renderOg(input: OgInput) {
  return new ImageResponse(ogTemplate(input) as never, size);
}
