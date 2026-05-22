'use server';

import { redirect } from 'next/navigation';
import { supabaseServer } from '@/lib/supabase';

export async function loginAction(formData: FormData) {
  const email = String(formData.get('email') ?? '').trim();
  const password = String(formData.get('password') ?? '');
  const next = String(formData.get('next') ?? '/admin');

  if (!email || !password) {
    redirect('/login?error=missing');
  }

  const supabase = supabaseServer();
  const { error } = await supabase.auth.signInWithPassword({ email, password });
  if (error) {
    redirect(`/login?error=${encodeURIComponent(error.message)}`);
  }
  redirect(next);
}

export async function logoutAction() {
  const supabase = supabaseServer();
  await supabase.auth.signOut();
  redirect('/');
}
