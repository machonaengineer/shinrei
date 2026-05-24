'use client';

import { useState, useTransition } from 'react';
import dynamic from 'next/dynamic';
import { submitSpotAction, type SubmitSpotResult } from '@/app/actions/submit-spot';
import { CATEGORIES, COUNTRIES, PREFECTURES } from '@/lib/constants';

const SpotLocationPicker = dynamic(
  () => import('./SpotLocationPicker').then((m) => m.SpotLocationPicker),
  {
    ssr: false,
    loading: () => (
      <div className="surface-soft p-6 text-center text-sm text-ink-dim">Loading map…</div>
    ),
  },
);

export function SubmitSpotFormEn() {
  const [pending, startTransition] = useTransition();
  const [result, setResult] = useState<SubmitSpotResult | null>(null);
  const [country, setCountry] = useState<string>('');

  function onSubmit(e: React.FormEvent<HTMLFormElement>) {
    e.preventDefault();
    const fd = new FormData(e.currentTarget);
    // Map English form: when country is not Japan, fill prefectureSlug with 'tokyo' as placeholder
    // but the displayed prefecture comes from the state field.
    const stateValue = (fd.get('stateOrRegion') as string) || '';
    if (country && country !== 'japan' && stateValue) {
      fd.set('prefectureSlug', country);
    }
    startTransition(async () => {
      const res = await submitSpotAction(fd);
      setResult(res);
      if (res.ok) (e.target as HTMLFormElement).reset();
    });
  }

  if (result?.ok) {
    return (
      <div className="surface-card p-6 text-center">
        <h2 className="text-ink font-semibold text-lg">Submission received</h2>
        <p className="mt-2 text-ink-dim text-sm">
          Thank you. Your submission will be published after admin review.
        </p>
      </div>
    );
  }
  const err = result && !result.ok ? result : null;
  const fieldErrors = err?.fieldErrors ?? {};

  return (
    <form className="space-y-5" onSubmit={onSubmit}>
      <details className="surface-soft p-4 text-sm">
        <summary className="cursor-pointer text-ink font-semibold">Read before submitting (prohibited content)</summary>
        <div className="mt-3 text-ink-dim text-xs space-y-2">
          <p><strong>Do not submit:</strong></p>
          <ul className="list-disc pl-5 space-y-0.5">
            <li>Personal info (real names, addresses, phone numbers, social handles)</li>
            <li>Currently inhabited private homes, apartment unit numbers</li>
            <li>Assertions of crimes, deaths, suicides, or murders</li>
            <li>Names of victims, suspects, or property owners</li>
            <li>Content that defames a specific individual or company</li>
            <li>Photos taken while trespassing</li>
            <li>Discriminatory, threatening, or harassing content</li>
          </ul>
          <p><strong>What we welcome:</strong></p>
          <ul className="list-disc pl-5 space-y-0.5">
            <li>&ldquo;Locals say there is a ghost story about…&rdquo;</li>
            <li>Personal experience reports framed as personal experience</li>
            <li>Folklore, urban legend, or hearsay framed as such</li>
            <li>Atmospheric photos taken legally</li>
          </ul>
        </div>
      </details>

      <div>
        <label htmlFor="name" className="label">Spot name<span className="required-mark">*</span></label>
        <input id="name" name="name" required maxLength={120} className="input" placeholder="e.g. The Old Bridge of Shadows" />
        {fieldErrors.name && <p className="mt-1 text-xs text-accent-red">{fieldErrors.name}</p>}
      </div>

      <div className="grid gap-4 md:grid-cols-2">
        <div>
          <label htmlFor="country" className="label">Country<span className="required-mark">*</span></label>
          <select
            id="country"
            name="_country_marker"
            required
            className="input"
            value={country}
            onChange={(e) => setCountry(e.target.value)}
          >
            <option value="" disabled>Select country</option>
            {COUNTRIES.map((c) => (
              <option key={c.slug} value={c.slug}>{c.emoji} {c.name}</option>
            ))}
          </select>
        </div>
        <div>
          <label htmlFor="stateOrRegion" className="label">
            {country === 'japan' ? 'Prefecture' : 'State / Region'}<span className="required-mark">*</span>
          </label>
          {country === 'japan' ? (
            <select id="prefectureSlug" name="prefectureSlug" required className="input" defaultValue="">
              <option value="" disabled>Select prefecture</option>
              {PREFECTURES.map((p) => (
                <option key={p.slug} value={p.slug}>{p.name}</option>
              ))}
            </select>
          ) : (
            <input id="stateOrRegion" name="stateOrRegion" maxLength={120} className="input" placeholder="e.g. Massachusetts, Bavaria" />
          )}
        </div>
      </div>

      <div>
        <label htmlFor="city" className="label">City / Locality</label>
        <input id="city" name="city" maxLength={120} className="input" placeholder="e.g. Salem, Munich" />
      </div>

      <div>
        <label htmlFor="categorySlug" className="label">Category<span className="required-mark">*</span></label>
        <select id="categorySlug" name="categorySlug" required className="input" defaultValue="">
          <option value="" disabled>Select category</option>
          {CATEGORIES.map((c) => (
            <option key={c.slug} value={c.slug}>{c.emoji} {c.name}</option>
          ))}
        </select>
      </div>

      <div>
        <label className="label">Pick the location on the map<span className="required-mark">*</span></label>
        <SpotLocationPicker latName="lat" lngName="lng" height="40vh" />
      </div>

      <div>
        <label htmlFor="description" className="label">Description (min 20 chars; you can write in English or Japanese)<span className="required-mark">*</span></label>
        <textarea id="description" name="description" required minLength={20} maxLength={2000} rows={5} className="input" placeholder="Locals say there is a ghost story about this place… (folklore framing only)" />
        {fieldErrors.description && <p className="mt-1 text-xs text-accent-red">{fieldErrors.description}</p>}
      </div>

      <div className="grid gap-2 md:grid-cols-2">
        <label className="flex items-center gap-2 text-sm text-ink-dim">
          <input type="checkbox" name="isPrivateProperty" />
          This is private property
        </label>
        <label className="flex items-center gap-2 text-sm text-ink-dim">
          <input type="checkbox" name="isEntryProhibited" />
          Entry is prohibited
        </label>
      </div>

      <div className="grid gap-4 md:grid-cols-2">
        <div>
          <label htmlFor="submitterName" className="label">Your name (optional)</label>
          <input id="submitterName" name="submitterName" maxLength={60} className="input" />
        </div>
        <div>
          <label htmlFor="submitterEmail" className="label">Your email (optional)</label>
          <input id="submitterEmail" name="submitterEmail" type="email" maxLength={120} className="input" />
        </div>
      </div>

      <label className="flex items-start gap-2 text-sm text-ink-dim">
        <input type="checkbox" name="agreed" required className="mt-0.5" />
        <span>I understand the editorial rules above. My submission will be reviewed before going public.</span>
      </label>

      {err && (
        <div className="rounded-md border border-accent-red/40 bg-accent-red/10 px-3 py-2 text-sm text-accent-red">
          {err.error}
        </div>
      )}

      <button type="submit" disabled={pending} className="btn-primary w-full md:w-auto">
        {pending ? 'Submitting…' : 'Submit'}
      </button>
    </form>
  );
}
