import { CATEGORIES, CATEGORY_BY_SLUG, type CategoryDef } from './constants';

export function getMapConfig() {
  return {
    tileUrl:
      process.env.NEXT_PUBLIC_MAP_TILE_URL ??
      'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
    attribution:
      process.env.NEXT_PUBLIC_MAP_ATTRIBUTION ?? '© OpenStreetMap contributors',
  };
}

export function pinColor(categorySlug: string): string {
  return CATEGORY_BY_SLUG[categorySlug]?.color ?? '#9d4edd';
}

export function categoryEmoji(categorySlug: string): string {
  return CATEGORY_BY_SLUG[categorySlug]?.emoji ?? '❓';
}

export function buildDivIconHtml(category: CategoryDef): string {
  return `<div style="
    background:${category.color};
    width:30px;height:30px;border-radius:50%;
    display:flex;align-items:center;justify-content:center;
    border:2px solid #11121a;
    box-shadow:0 0 0 2px ${category.color}55, 0 4px 10px rgba(0,0,0,0.6);
    font-size:14px;line-height:1;color:white;">
    ${category.emoji}
  </div>`;
}

export function categories(): CategoryDef[] {
  return CATEGORIES;
}
