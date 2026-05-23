import type { VideoPlatform } from '@/types/database';

const YT_HOSTS = ['youtube.com', 'www.youtube.com', 'm.youtube.com', 'youtu.be', 'music.youtube.com'];
const TT_HOSTS = ['tiktok.com', 'www.tiktok.com', 'm.tiktok.com', 'vm.tiktok.com'];

export function detectPlatform(url: string): VideoPlatform {
  try {
    const u = new URL(url);
    const host = u.hostname.toLowerCase();
    if (YT_HOSTS.includes(host)) return 'youtube';
    if (TT_HOSTS.some((h) => host.endsWith(h))) return 'tiktok';
    return 'other';
  } catch {
    return 'other';
  }
}

export function toYoutubeEmbed(url: string): string | null {
  try {
    const u = new URL(url);
    const host = u.hostname.toLowerCase();
    let id: string | null = null;
    if (host === 'youtu.be') {
      id = u.pathname.slice(1).split('/')[0];
    } else if (host.endsWith('youtube.com')) {
      if (u.pathname === '/watch') id = u.searchParams.get('v');
      else if (u.pathname.startsWith('/embed/')) id = u.pathname.split('/')[2];
      else if (u.pathname.startsWith('/shorts/')) id = u.pathname.split('/')[2];
    }
    if (!id || !/^[A-Za-z0-9_-]{6,20}$/.test(id)) return null;
    return `https://www.youtube-nocookie.com/embed/${encodeURIComponent(id)}`;
  } catch {
    return null;
  }
}

export function toTiktokEmbed(url: string): string | null {
  // TikTok embed widget URL format
  try {
    const u = new URL(url);
    if (!u.hostname.toLowerCase().endsWith('tiktok.com')) return null;
    // /@user/video/<id>
    const m = u.pathname.match(/\/video\/(\d+)/);
    if (!m) return null;
    return `https://www.tiktok.com/embed/v2/${m[1]}`;
  } catch {
    return null;
  }
}

export function toEmbedUrl(url: string, platform?: VideoPlatform): string | null {
  const p = platform ?? detectPlatform(url);
  if (p === 'youtube') return toYoutubeEmbed(url);
  if (p === 'tiktok') return toTiktokEmbed(url);
  return null;
}

export function youtubeSearchUrl(q: string): string {
  return `https://www.youtube.com/results?search_query=${encodeURIComponent(q + ' 心霊')}`;
}

export function tiktokSearchUrl(q: string): string {
  return `https://www.tiktok.com/search?q=${encodeURIComponent(q + ' 心霊')}`;
}
