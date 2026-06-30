"use strict";

(function () {
  // ============================================================
  // CONFIGURATION — Update these with your Supabase project values
  // ============================================================
  var config = window.SUPABASE_CONFIG || {};
  var supabaseUrl = config.url || "";
  var supabaseAnonKey = config.anonKey || "";

  if (!supabaseUrl || !supabaseAnonKey) {
    console.warn(
      "adminHMD Supabase: Missing configuration. Set window.SUPABASE_CONFIG = { url: '...', anonKey: '...' } before loading supabase.js"
    );
    return;
  }

  // Initialize Supabase client
  var client = window.supabase.createClient(supabaseUrl, supabaseAnonKey, {
    auth: {
      autoRefreshToken: true,
      persistSession: true,
    },
  });

  // Namespace
  window.adminHMD = window.adminHMD || {};

  // Expose the raw client (advanced use)
  window.adminHMD.supabase = client;

  // ============================================================
  // Auth API
  // ============================================================
  window.adminHMD.auth = {
    signUp: function (email, password, name) {
      return client.auth.signUp({
        email: email,
        password: password,
        options: { data: { full_name: name } },
      });
    },

    signIn: function (email, password) {
      return client.auth.signInWithPassword({
        email: email,
        password: password,
      });
    },

    signOut: function () {
      return client.auth.signOut();
    },

    resetPassword: function (email) {
      return client.auth.resetPasswordForEmail(email, {
        redirectTo: window.location.origin + "/html/login.html",
      });
    },

    getUser: function () {
      return client.auth.getUser();
    },

    getSession: function () {
      return client.auth.getSession();
    },

    onAuthChange: function (callback) {
      return client.auth.onAuthStateChange(callback);
    },
  };

  // ============================================================
  // Database API
  // ============================================================
  window.adminHMD.db = {
    users: {
      list: function () {
        return client
          .from("app_users")
          .select("*")
          .order("created_at", { ascending: false });
      },
      get: function (id) {
        return client.from("app_users").select("*").eq("id", id).single();
      },
      create: function (data) {
        return client.from("app_users").insert([data]).select();
      },
      update: function (id, data) {
        return client.from("app_users").update(data).eq("id", id).select();
      },
      remove: function (id) {
        return client.from("app_users").delete().eq("id", id);
      },
    },

    agents: {
      list: function () {
        return client
          .from("agents")
          .select("*")
          .order("created_at", { ascending: false });
      },
      create: function (data) {
        return client.from("agents").insert([data]).select();
      },
    },

    contacts: {
      create: function (data) {
        return client.from("contacts").insert([data]).select();
      },
    },

    settings: {
      get: function () {
        return client.from("settings").select("*").maybeSingle();
      },
      upsert: function (data) {
        return client.from("settings").upsert([data]).select();
      },
    },
  };

  // ============================================================
  // Auth Guard — protect admin pages
  // ============================================================
  var publicPaths = [
    "login",
    "register",
    "forgot-password",
    "contact",
    "index",
    "404",
    "500",
  ];
  var currentPage = window.location.pathname.split("/").pop().replace(/\.html$/, "");

  // Guard admin pages (not on public path) — requires authentication
  if (publicPaths.indexOf(currentPage) === -1) {
    var bodyEl = document.body;
    if (bodyEl) bodyEl.classList.add("auth-checking");

    client.auth.getSession().then(function (result) {
      var session = result.data ? result.data.session : null;
      if (bodyEl) bodyEl.classList.remove("auth-checking");
      if (!session) {
        window.location.href = "login.html";
      }
    });
  }

  // ============================================================
  // Sign-out handler
  // ============================================================
  document.addEventListener("click", function (e) {
    var target = e.target.closest("[data-action='signout']");
    if (target) {
      e.preventDefault();
      window.adminHMD.auth.signOut().then(function () {
        window.location.href = "login.html";
      });
    }
  });
})();
