-- ============================================================
-- adminHMD: Supabase Database Schema
-- Run this SQL in your Supabase project's SQL Editor
-- ============================================================

-- 1. App Users (managed team members)
CREATE TABLE IF NOT EXISTS app_users (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  created_at TIMESTAMPTZ DEFAULT NOW(),
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  email TEXT NOT NULL UNIQUE,
  phone TEXT,
  role TEXT NOT NULL DEFAULT 'Viewer',
  team TEXT NOT NULL DEFAULT 'Operations',
  notes TEXT,
  status TEXT NOT NULL DEFAULT 'Active',
  avatar_url TEXT
);

-- 2. AI Agents
CREATE TABLE IF NOT EXISTS agents (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  created_at TIMESTAMPTZ DEFAULT NOW(),
  name TEXT NOT NULL,
  type TEXT NOT NULL,
  description TEXT NOT NULL,
  team TEXT NOT NULL,
  owner TEXT NOT NULL,
  capabilities TEXT[] DEFAULT '{}',
  status TEXT NOT NULL DEFAULT 'Draft',
  priority TEXT NOT NULL DEFAULT 'Medium',
  notes TEXT
);

-- 3. Contact form submissions
CREATE TABLE IF NOT EXISTS contacts (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  created_at TIMESTAMPTZ DEFAULT NOW(),
  name TEXT NOT NULL,
  email TEXT NOT NULL,
  company TEXT,
  subject TEXT NOT NULL,
  message TEXT NOT NULL
);

-- 4. Workspace settings
CREATE TABLE IF NOT EXISTS settings (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW(),
  workspace_name TEXT NOT NULL DEFAULT 'adminHMD Workspace',
  default_language TEXT NOT NULL DEFAULT 'English',
  email_alerts BOOLEAN DEFAULT TRUE,
  weekly_reports BOOLEAN DEFAULT TRUE,
  two_factor_auth BOOLEAN DEFAULT FALSE
);

-- ============================================================
-- Row Level Security (RLS)
-- Enable RLS on all tables
-- ============================================================
ALTER TABLE app_users ENABLE ROW LEVEL SECURITY;
ALTER TABLE agents    ENABLE ROW LEVEL SECURITY;
ALTER TABLE contacts  ENABLE ROW LEVEL SECURITY;
ALTER TABLE settings  ENABLE ROW LEVEL SECURITY;

-- Drop existing policies first (safe for re-runs)
DROP POLICY IF EXISTS "Allow all on app_users" ON app_users;
DROP POLICY IF EXISTS "Allow all on agents" ON agents;
DROP POLICY IF EXISTS "Allow all on contacts" ON contacts;
DROP POLICY IF EXISTS "Allow all on settings" ON settings;

-- For this admin dashboard, authenticated users have full access
CREATE POLICY "Allow all on app_users"
  ON app_users FOR ALL
  USING (true)
  WITH CHECK (true);

CREATE POLICY "Allow all on agents"
  ON agents FOR ALL
  USING (true)
  WITH CHECK (true);

CREATE POLICY "Allow all on contacts"
  ON contacts FOR ALL
  USING (true)
  WITH CHECK (true);

CREATE POLICY "Allow all on settings"
  ON settings FOR ALL
  USING (true)
  WITH CHECK (true);

-- ============================================================
-- Seed data: default settings row
-- ============================================================
INSERT INTO settings (workspace_name, default_language)
VALUES ('adminHMD Workspace', 'English')
ON CONFLICT (id) DO NOTHING;
