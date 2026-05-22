import type { Config } from 'tailwindcss';

const config: Config = {
  content: ['./src/**/*.{ts,tsx}'],
  darkMode: 'class',
  theme: {
    extend: {
      colors: {
        bg: {
          DEFAULT: '#0a0a0f',
          soft: '#11121a',
          card: '#161823',
          border: '#23253a',
        },
        ink: {
          DEFAULT: '#e7e7ee',
          dim: '#a0a0b5',
          muted: '#6c6f88',
        },
        accent: {
          DEFAULT: '#9d4edd',
          soft: '#7b2cbf',
          red: '#d62828',
          gold: '#ffba08',
        },
        status: {
          published: '#22c55e',
          pending: '#eab308',
          rejected: '#ef4444',
          hidden: '#6b7280',
          draft: '#94a3b8',
        },
      },
      fontFamily: {
        sans: [
          'ui-sans-serif',
          'system-ui',
          '"Hiragino Kaku Gothic ProN"',
          '"Noto Sans JP"',
          'sans-serif',
        ],
        serif: [
          '"Noto Serif JP"',
          '"Hiragino Mincho ProN"',
          'serif',
        ],
      },
      boxShadow: {
        glow: '0 0 0 1px rgba(157, 78, 221, 0.4), 0 8px 30px rgba(157, 78, 221, 0.15)',
      },
    },
  },
  plugins: [],
};

export default config;
