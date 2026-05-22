import crypto from 'node:crypto';

export function cn(...classes: Array<string | false | null | undefined>): string {
  return classes.filter(Boolean).join(' ');
}

export function slugify(input: string): string {
  return input
    .toLowerCase()
    .normalize('NFKD')
    .replace(/[̀-ͯ]/g, '')
    .replace(/[^a-z0-9぀-ヿ㐀-鿿\-\s]/g, '')
    .trim()
    .replace(/\s+/g, '-')
    .replace(/-+/g, '-');
}

export function randomSlugSuffix(len = 6): string {
  return Math.random().toString(36).slice(2, 2 + len);
}

export function buildSpotSlug(name: string): string {
  const base = slugify(name);
  const safe = base && /[a-z0-9]/.test(base) ? base : 'spot';
  return `${safe}-${randomSlugSuffix(6)}`;
}

export function hashIp(ip: string | null | undefined): string {
  const salt = process.env.IP_HASH_SALT ?? 'dev-salt';
  const value = ip ?? 'unknown';
  return crypto.createHash('sha256').update(`${salt}:${value}`).digest('hex');
}

export function clampNumber(value: number, min: number, max: number): number {
  if (Number.isNaN(value)) return min;
  return Math.min(Math.max(value, min), max);
}

export function formatDateTime(iso: string | Date): string {
  const d = typeof iso === 'string' ? new Date(iso) : iso;
  return d.toLocaleString('ja-JP', {
    year: 'numeric',
    month: '2-digit',
    day: '2-digit',
    hour: '2-digit',
    minute: '2-digit',
  });
}

export function formatDate(iso: string | Date): string {
  const d = typeof iso === 'string' ? new Date(iso) : iso;
  return d.toLocaleDateString('ja-JP', {
    year: 'numeric',
    month: '2-digit',
    day: '2-digit',
  });
}

export function truncate(text: string, max: number): string {
  if (!text) return '';
  return text.length > max ? `${text.slice(0, max)}…` : text;
}

export function safeNumber(value: FormDataEntryValue | null, fallback: number): number {
  if (value === null) return fallback;
  const n = Number(value);
  return Number.isFinite(n) ? n : fallback;
}

export function safeString(value: FormDataEntryValue | null): string {
  return typeof value === 'string' ? value.trim() : '';
}

export function safeBoolean(value: FormDataEntryValue | null): boolean {
  return value === 'on' || value === 'true' || value === '1';
}
