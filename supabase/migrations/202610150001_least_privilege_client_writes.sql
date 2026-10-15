-- Lessoner: least-privilege browser write access.
-- RLS policies remain responsible for row-level authorization.

GRANT UPDATE (read) ON TABLE public.mails TO authenticated;
GRANT UPDATE (name, addr, sig) ON TABLE public.schools TO authenticated;
GRANT UPDATE (must_change_password) ON TABLE public.profiles TO authenticated;
GRANT INSERT (school_id, teacher_id, f, status) ON TABLE public.plans TO authenticated;
GRANT UPDATE (f, status, reason) ON TABLE public.plans TO authenticated;
