import { NextResponse } from 'next/server';
import { supabaseAdmin } from '@/lib/supabase';

export const runtime = 'nodejs';
export const dynamic = 'force-dynamic';

// POST /api/visit  — increments and returns the new total_count
export async function POST() {
  try {
    const admin = supabaseAdmin();
    // try RPC first
    const { data: rpcData, error: rpcError } = await admin.rpc('increment_visit_count' as never);
    if (!rpcError && rpcData != null) {
      return NextResponse.json({ ok: true, count: Number(rpcData) || 0 }, {
        headers: { 'Cache-Control': 'no-store' },
      });
    }
    // Fallback if migration 0003 not applied yet: do raw update via table
    const { data: row, error: selErr } = await admin
      .from('visit_counter')
      .select('total_count')
      .eq('id', 1)
      .maybeSingle();
    if (selErr) {
      // Table also doesn't exist
      return NextResponse.json(
        { ok: false, error: 'visit_counter not initialized (apply migration 0003)' },
        { status: 200 },
      );
    }
    const current = Number(row?.total_count ?? 0);
    const next = current + 1;
    await admin.from('visit_counter').upsert({ id: 1, total_count: next });
    return NextResponse.json({ ok: true, count: next }, {
      headers: { 'Cache-Control': 'no-store' },
    });
  } catch (e) {
    return NextResponse.json({ ok: false, error: (e as Error).message }, { status: 200 });
  }
}

// GET /api/visit  — just reads current total without incrementing
export async function GET() {
  try {
    const admin = supabaseAdmin();
    const { data, error } = await admin
      .from('visit_counter')
      .select('total_count')
      .eq('id', 1)
      .maybeSingle();
    if (error) {
      return NextResponse.json({ ok: false, count: 0 }, { status: 200 });
    }
    return NextResponse.json({ ok: true, count: data?.total_count ?? 0 }, {
      headers: { 'Cache-Control': 'no-store' },
    });
  } catch (e) {
    return NextResponse.json({ ok: false, error: (e as Error).message, count: 0 }, { status: 200 });
  }
}
