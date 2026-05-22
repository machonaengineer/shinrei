import type { Database } from './database';

export type Spot = Database['public']['Tables']['spots']['Row'];
export type SpotInsert = Database['public']['Tables']['spots']['Insert'];

export type SpotPin = Pick<
  Spot,
  | 'id'
  | 'slug'
  | 'name'
  | 'lat'
  | 'lng'
  | 'category'
  | 'category_slug'
  | 'prefecture'
  | 'prefecture_slug'
  | 'scary_score'
  | 'review_count'
  | 'is_entry_prohibited'
  | 'is_private_property'
>;
