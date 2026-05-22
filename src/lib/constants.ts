export const SITE_NAME = '心霊マップ';
export const SITE_TAGLINE = '全国の心霊スポット、怪談、都市伝説を地図で探す';
export const SITE_DESCRIPTION =
  '掲載情報はユーザー投稿に基づく体験談・噂・都市伝説です。真偽を保証するものではありません。';

export const DISCLAIMER_TEXT =
  '本ページの情報は、ユーザー投稿に基づく心霊・怪談・都市伝説に関する口コミ情報です。掲載内容の真偽を保証するものではありません。事件・事故・死亡事実等を断定する目的ではなく、娯楽・地域伝承・体験談の共有を目的としています。私有地、立入禁止区域、危険区域への侵入を推奨するものではありません。権利侵害、個人情報、誤情報、削除希望がある場合は、削除依頼フォームよりご連絡ください。';

export const VISIT_WARNING =
  '私有地、立入禁止区域、危険区域への侵入は絶対に行わないでください。本サイトは現地訪問や探索を推奨するものではありません。';

export const POSTING_RULES_PROHIBITED: string[] = [
  '個人名、住所、電話番号、SNSアカウントなどの個人情報',
  '現住の個人宅、マンション部屋番号、アパート部屋番号',
  '事件、事故、自殺、殺人などを断定する表現',
  '被害者名、関係者名、所有者名',
  '特定個人や法人の名誉を傷つける表現',
  '「この物件に住むと死ぬ」など不安を煽る断定表現',
  '私有地や立入禁止区域への侵入を促す表現',
  '無断侵入して撮影した写真',
  '差別的表現、脅迫、嫌がらせ',
  '虚偽情報の断定',
];

export const POSTING_RULES_ALLOWED: string[] = [
  '心霊の噂がある',
  '目撃談が投稿されている',
  '地元で怪談として語られている',
  '真偽不明の都市伝説',
  '投稿者本人の体験談',
  '怖い雰囲気を感じた',
  '写真に影のようなものが写った',
];

export type CategoryDef = {
  slug: string;
  name: string;
  color: string; // tailwind-safe hex
  emoji: string;
};

export const CATEGORIES: CategoryDef[] = [
  { slug: 'tunnel', name: 'トンネル', color: '#9d4edd', emoji: '🚇' },
  { slug: 'bridge', name: '橋', color: '#5a189a', emoji: '🌉' },
  { slug: 'haikyo', name: '廃墟', color: '#3a0ca3', emoji: '🏚️' },
  { slug: 'hotel', name: 'ホテル跡', color: '#7209b7', emoji: '🏨' },
  { slug: 'hospital', name: '病院跡', color: '#b5179e', emoji: '🏥' },
  { slug: 'school', name: '学校跡', color: '#560bad', emoji: '🏫' },
  { slug: 'park', name: '公園', color: '#06d6a0', emoji: '🌳' },
  { slug: 'shrine-temple', name: '神社・寺', color: '#ef476f', emoji: '⛩️' },
  { slug: 'mountain-pass', name: '山・峠', color: '#118ab2', emoji: '⛰️' },
  { slug: 'water', name: '水辺・ダム', color: '#0077b6', emoji: '🌊' },
  { slug: 'road', name: '道路', color: '#6c757d', emoji: '🛣️' },
  { slug: 'station', name: '駅・線路周辺', color: '#f4a261', emoji: '🚉' },
  { slug: 'urban-legend', name: '都市伝説', color: '#d62828', emoji: '👁️' },
  { slug: 'other', name: 'その他', color: '#adb5bd', emoji: '❓' },
];

export const CATEGORY_BY_SLUG = Object.fromEntries(
  CATEGORIES.map((c) => [c.slug, c]),
) as Record<string, CategoryDef>;

export type PrefectureDef = {
  slug: string;
  name: string;
  region: string;
};

export const PREFECTURES: PrefectureDef[] = [
  { slug: 'hokkaido', name: '北海道', region: '北海道' },
  { slug: 'aomori', name: '青森県', region: '東北' },
  { slug: 'iwate', name: '岩手県', region: '東北' },
  { slug: 'miyagi', name: '宮城県', region: '東北' },
  { slug: 'akita', name: '秋田県', region: '東北' },
  { slug: 'yamagata', name: '山形県', region: '東北' },
  { slug: 'fukushima', name: '福島県', region: '東北' },
  { slug: 'ibaraki', name: '茨城県', region: '関東' },
  { slug: 'tochigi', name: '栃木県', region: '関東' },
  { slug: 'gunma', name: '群馬県', region: '関東' },
  { slug: 'saitama', name: '埼玉県', region: '関東' },
  { slug: 'chiba', name: '千葉県', region: '関東' },
  { slug: 'tokyo', name: '東京都', region: '関東' },
  { slug: 'kanagawa', name: '神奈川県', region: '関東' },
  { slug: 'niigata', name: '新潟県', region: '中部' },
  { slug: 'toyama', name: '富山県', region: '中部' },
  { slug: 'ishikawa', name: '石川県', region: '中部' },
  { slug: 'fukui', name: '福井県', region: '中部' },
  { slug: 'yamanashi', name: '山梨県', region: '中部' },
  { slug: 'nagano', name: '長野県', region: '中部' },
  { slug: 'gifu', name: '岐阜県', region: '中部' },
  { slug: 'shizuoka', name: '静岡県', region: '中部' },
  { slug: 'aichi', name: '愛知県', region: '中部' },
  { slug: 'mie', name: '三重県', region: '近畿' },
  { slug: 'shiga', name: '滋賀県', region: '近畿' },
  { slug: 'kyoto', name: '京都府', region: '近畿' },
  { slug: 'osaka', name: '大阪府', region: '近畿' },
  { slug: 'hyogo', name: '兵庫県', region: '近畿' },
  { slug: 'nara', name: '奈良県', region: '近畿' },
  { slug: 'wakayama', name: '和歌山県', region: '近畿' },
  { slug: 'tottori', name: '鳥取県', region: '中国' },
  { slug: 'shimane', name: '島根県', region: '中国' },
  { slug: 'okayama', name: '岡山県', region: '中国' },
  { slug: 'hiroshima', name: '広島県', region: '中国' },
  { slug: 'yamaguchi', name: '山口県', region: '中国' },
  { slug: 'tokushima', name: '徳島県', region: '四国' },
  { slug: 'kagawa', name: '香川県', region: '四国' },
  { slug: 'ehime', name: '愛媛県', region: '四国' },
  { slug: 'kochi', name: '高知県', region: '四国' },
  { slug: 'fukuoka', name: '福岡県', region: '九州・沖縄' },
  { slug: 'saga', name: '佐賀県', region: '九州・沖縄' },
  { slug: 'nagasaki', name: '長崎県', region: '九州・沖縄' },
  { slug: 'kumamoto', name: '熊本県', region: '九州・沖縄' },
  { slug: 'oita', name: '大分県', region: '九州・沖縄' },
  { slug: 'miyazaki', name: '宮崎県', region: '九州・沖縄' },
  { slug: 'kagoshima', name: '鹿児島県', region: '九州・沖縄' },
  { slug: 'okinawa', name: '沖縄県', region: '九州・沖縄' },
];

export const PREFECTURE_BY_SLUG = Object.fromEntries(
  PREFECTURES.map((p) => [p.slug, p]),
) as Record<string, PrefectureDef>;

export const REGIONS = Array.from(new Set(PREFECTURES.map((p) => p.region)));

export const REPORT_REASONS = [
  '個人情報が含まれている',
  '事実と異なる',
  '事件事故を断定している',
  '私有地や立入禁止区域への侵入を助長している',
  '権利侵害の可能性がある',
  '不適切な表現がある',
  'その他',
] as const;

export const SPOT_STATUSES = [
  'draft',
  'pending_review',
  'published',
  'rejected',
  'hidden',
  'deleted',
] as const;

export const REVIEW_STATUSES = [
  'pending_review',
  'published',
  'rejected',
  'hidden',
  'deleted',
] as const;

export const REPORT_STATUSES = ['open', 'reviewing', 'resolved', 'rejected'] as const;

export const STATUS_LABEL: Record<string, string> = {
  draft: '下書き',
  pending_review: '審査中',
  published: '公開中',
  rejected: '却下',
  hidden: '非公開',
  deleted: '削除',
  open: '未対応',
  reviewing: '対応中',
  resolved: '解決済み',
};

export const DEFAULT_MAP_CENTER: [number, number] = [36.2048, 138.2529]; // 日本中央付近
export const DEFAULT_MAP_ZOOM = 5;
