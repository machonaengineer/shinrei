import { detectPlatform, toEmbedUrl } from '@/lib/video';
import type { SpotVideo } from '@/types/spot';

export function VideoEmbed({ video }: { video: SpotVideo }) {
  const platform = video.platform;
  const embedUrl = video.embed_url ?? toEmbedUrl(video.video_url, platform);

  if (!embedUrl) {
    return (
      <a
        href={video.video_url}
        target="_blank"
        rel="noopener noreferrer"
        className="surface-card block p-3 hover:border-accent transition-colors"
      >
        <div className="text-xs text-ink-muted uppercase">{platform}</div>
        <div className="text-sm text-ink mt-1 break-all">{video.title ?? video.video_url}</div>
        <div className="mt-2 text-xs text-accent">外部サイトで開く →</div>
      </a>
    );
  }

  const aspect = platform === 'tiktok' ? 'pt-[177.78%]' : 'pt-[56.25%]';
  return (
    <div className="surface-card overflow-hidden">
      <div className={`relative ${aspect}`}>
        <iframe
          src={embedUrl}
          title={video.title ?? 'video'}
          loading="lazy"
          allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
          allowFullScreen
          referrerPolicy="strict-origin-when-cross-origin"
          className="absolute inset-0 h-full w-full border-0"
        />
      </div>
      {video.title && (
        <div className="px-3 py-2 text-xs text-ink-dim border-t border-bg-border">
          {video.title}
          <span className="ml-2 text-ink-muted uppercase">{platform}</span>
        </div>
      )}
    </div>
  );
}

export function VideoSearchLinks({ spotName }: { spotName: string }) {
  const yt = `https://www.youtube.com/results?search_query=${encodeURIComponent(spotName + ' 心霊')}`;
  const tt = `https://www.tiktok.com/search?q=${encodeURIComponent(spotName + ' 心霊')}`;
  return (
    <div className="flex flex-wrap gap-2 text-sm">
      <a href={yt} target="_blank" rel="noopener noreferrer" className="btn-secondary">
        YouTubeで「{spotName}」を探す
      </a>
      <a href={tt} target="_blank" rel="noopener noreferrer" className="btn-secondary">
        TikTokで「{spotName}」を探す
      </a>
    </div>
  );
}

export { detectPlatform };
