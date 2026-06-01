import crypto from 'node:crypto';

/**
 * Server-only helpers.
 * Importing this file from a Client Component will fail at build time —
 * that's intentional. Do NOT add browser-safe helpers here; use utils.ts.
 */

export function hashIp(ip: string | null | undefined): string {
  const salt = process.env.IP_HASH_SALT ?? 'dev-salt';
  const value = ip ?? 'unknown';
  return crypto.createHash('sha256').update(`${salt}:${value}`).digest('hex');
}
