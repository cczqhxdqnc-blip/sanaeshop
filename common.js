const sb = supabase.createClient(CONFIG.SUPABASE_URL, CONFIG.SUPABASE_KEY);
const CATS = {
  clothes: { fr: "Vêtements", ar: "ملابس" },
  shoes_bags: { fr: "Chaussures & sacs", ar: "أحذية وحقائب" },
  appliances: { fr: "Électroménager", ar: "أجهزة منزلية" },
  electronics: { fr: "Électronique", ar: "إلكترونيات" },
  home: { fr: "Maison & déco", ar: "المنزل والديكور" },
  other: { fr: "Autre", ar: "أخرى" }
};
const esc = s => String(s ?? "").replace(/[&<>"']/g, c => ({ "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#39;" }[c]));
