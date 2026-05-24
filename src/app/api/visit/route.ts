import { NextResponse } from 'next/server';
import { supabaseAdmin } from '@/lib/supabase';

export const runtime = 'nodejs';
export const dynamic = 'force-dynamic';

// POST /api/visit  — increments and returns the new total_count
export async function POST() {
  try {
    const admin = supabaseAdmin();
    const { data, error } = await admin.rpc('increment_visit_count' as never);
    if (error) {
      return NextResponse.json({ ok: false, error: error.message }, { status: 500 });
    }
    return NextResponse.json({ ok: true, count: data ?? 0 }, {
      headers: { 'Cache-Control': 'no-store' },
    });
  } catch (e) {
    return NextResponse.json({ ok: false, error: (e as Error).message }, { status: 500 });
  }
}

// GET /api/visit  — just reads current total without incrementing (used for SSR fallback)
export async function GET() {
  try {
    const admin = supabaseAdmin();
    const { data } = await admin
      .from('visit_counter')
      .select('total_count')
      .eq('id', 1)
      .single();
    return NextResponse.json({ ok: true, count: data?.total_count ?? 0 }, {
      headers: { 'Cache-Control': 'no-store' },
    });
  } catch (e) {
    return NextResponse.json({ ok: false, error: (e as Error).message }, { status: 500 });
  }
}
