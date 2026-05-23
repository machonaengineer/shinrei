export type Json =
  | string
  | number
  | boolean
  | null
  | { [key: string]: Json | undefined }
  | Json[];

export type SpotStatus =
  | 'draft'
  | 'pending_review'
  | 'published'
  | 'rejected'
  | 'hidden'
  | 'deleted';

export type ReviewStatus =
  | 'pending_review'
  | 'published'
  | 'rejected'
  | 'hidden'
  | 'deleted';

export type ReportStatus = 'open' | 'reviewing' | 'resolved' | 'rejected';

export type Role = 'user' | 'admin';

export type LocationPrecision = 'exact' | 'approximate' | 'area_only';

type ProfileRow = {
  id: string;
  display_name: string | null;
  role: Role;
  created_at: string;
};

type SpotRow = {
  id: string;
  name: string;
  slug: string;
  description: string | null;
  country: string;
  country_slug: string;
  prefecture: string;
  prefecture_slug: string;
  city: string | null;
  address_public: string | null;
  lat: number;
  lng: number;
  location_precision: LocationPrecision;
  category: string;
  category_slug: string;
  danger_level: number;
  scary_score: number;
  review_count: number;
  is_private_property: boolean;
  is_entry_prohibited: boolean;
  status: SpotStatus;
  created_by: string | null;
  created_at: string;
  updated_at: string;
};

export type VideoPlatform = 'youtube' | 'tiktok' | 'other';

type SpotVideoRow = {
  id: string;
  spot_id: string;
  platform: VideoPlatform;
  video_url: string;
  embed_url: string | null;
  title: string | null;
  status: ReviewStatus;
  source_type: string | null;
  submitted_by_name: string | null;
  moderation_note: string | null;
  created_at: string;
  updated_at: string;
};

type ReviewRow = {
  id: string;
  spot_id: string;
  user_name: string | null;
  body: string;
  scary_score: number;
  visited_at: string | null;
  image_url: string | null;
  status: ReviewStatus;
  ip_hash: string | null;
  created_at: string;
  updated_at: string;
};

type ReportRow = {
  id: string;
  target_type: string;
  target_id: string | null;
  reason: string;
  email: string | null;
  body: string | null;
  status: ReportStatus;
  created_at: string;
  updated_at: string;
};

type RemovalRequestRow = {
  id: string;
  target_url: string;
  reason: string;
  is_rights_holder: boolean;
  email: string;
  body: string;
  status: ReportStatus;
  created_at: string;
  updated_at: string;
};

type SpotImageRow = {
  id: string;
  spot_id: string | null;
  review_id: string | null;
  image_url: string;
  status: ReviewStatus;
  caption: string | null;
  uploaded_by_name: string | null;
  source_type: string | null;
  moderation_note: string | null;
  is_ai_generated: boolean;
  is_sensitive: boolean;
  report_count: number;
  created_at: string;
  updated_at: string;
};

type SourceRow = {
  id: string;
  spot_id: string | null;
  source_type: string | null;
  source_url: string | null;
  memo: string | null;
  source_name: string | null;
  raw_title: string | null;
  retrieved_at: string | null;
  is_public: boolean;
  created_at: string;
};

export interface Database {
  public: {
    Tables: {
      profiles: {
        Row: ProfileRow;
        Insert: {
          id: string;
          display_name?: string | null;
          role?: Role;
          created_at?: string;
        };
        Update: Partial<ProfileRow>;
        Relationships: [];
      };
      spots: {
        Row: SpotRow;
        Insert: {
          id?: string;
          name: string;
          slug: string;
          description?: string | null;
          country?: string;
          country_slug?: string;
          prefecture: string;
          prefecture_slug: string;
          city?: string | null;
          address_public?: string | null;
          lat: number;
          lng: number;
          location_precision?: LocationPrecision;
          category: string;
          category_slug: string;
          danger_level?: number;
          scary_score?: number;
          review_count?: number;
          is_private_property?: boolean;
          is_entry_prohibited?: boolean;
          status?: SpotStatus;
          created_by?: string | null;
        };
        Update: Partial<SpotRow>;
        Relationships: [];
      };
      spot_videos: {
        Row: SpotVideoRow;
        Insert: {
          id?: string;
          spot_id: string;
          platform: VideoPlatform;
          video_url: string;
          embed_url?: string | null;
          title?: string | null;
          status?: ReviewStatus;
          source_type?: string | null;
          submitted_by_name?: string | null;
          moderation_note?: string | null;
        };
        Update: Partial<SpotVideoRow>;
        Relationships: [
          {
            foreignKeyName: 'spot_videos_spot_id_fkey';
            columns: ['spot_id'];
            referencedRelation: 'spots';
            referencedColumns: ['id'];
          },
        ];
      };
      reviews: {
        Row: ReviewRow;
        Insert: {
          id?: string;
          spot_id: string;
          user_name?: string | null;
          body: string;
          scary_score?: number;
          visited_at?: string | null;
          image_url?: string | null;
          status?: ReviewStatus;
          ip_hash?: string | null;
        };
        Update: Partial<ReviewRow>;
        Relationships: [
          {
            foreignKeyName: 'reviews_spot_id_fkey';
            columns: ['spot_id'];
            referencedRelation: 'spots';
            referencedColumns: ['id'];
          },
        ];
      };
      reports: {
        Row: ReportRow;
        Insert: {
          id?: string;
          target_type: string;
          target_id?: string | null;
          reason: string;
          email?: string | null;
          body?: string | null;
          status?: ReportStatus;
        };
        Update: Partial<ReportRow>;
        Relationships: [];
      };
      removal_requests: {
        Row: RemovalRequestRow;
        Insert: {
          id?: string;
          target_url: string;
          reason: string;
          is_rights_holder?: boolean;
          email: string;
          body: string;
          status?: ReportStatus;
        };
        Update: Partial<RemovalRequestRow>;
        Relationships: [];
      };
      spot_images: {
        Row: SpotImageRow;
        Insert: {
          id?: string;
          spot_id?: string | null;
          review_id?: string | null;
          image_url: string;
          status?: ReviewStatus;
          caption?: string | null;
          uploaded_by_name?: string | null;
          source_type?: string | null;
          moderation_note?: string | null;
          is_ai_generated?: boolean;
          is_sensitive?: boolean;
          report_count?: number;
        };
        Update: Partial<SpotImageRow>;
        Relationships: [];
      };
      sources: {
        Row: SourceRow;
        Insert: {
          id?: string;
          spot_id?: string | null;
          source_type?: string | null;
          source_url?: string | null;
          memo?: string | null;
          source_name?: string | null;
          raw_title?: string | null;
          retrieved_at?: string | null;
          is_public?: boolean;
        };
        Update: Partial<SourceRow>;
        Relationships: [];
      };
    };
    Views: { [_ in never]: never };
    Functions: { [_ in never]: never };
    Enums: { [_ in never]: never };
    CompositeTypes: { [_ in never]: never };
  };
}
