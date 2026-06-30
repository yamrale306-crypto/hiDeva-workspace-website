# hiDeva - AI Voice Assistant Platform

A modern, premium landing page for hiDeva - an AI-powered voice assistant platform.

## 🚀 Features

- **Modern Design**: Premium, minimal, and professional UI with smooth animations
- **Fully Responsive**: Optimized for all devices (mobile, tablet, desktop)
- **SEO Optimized**: Complete meta tags, Open Graph, Twitter Cards, and Schema.org markup
- **Analytics Ready**: Vercel Analytics and Google Analytics 4 integration
- **Performance Optimized**: Font preloading, lazy loading, and optimized assets
- **Accessibility**: WCAG compliant with proper ARIA labels and semantic HTML

## 📁 Project Structure

```
adminhmd-1.0.0/
├── html/
│   ├── index.html          # Main landing page
│   ├── privacy.html        # Privacy Policy
│   ├── terms.html          # Terms of Service
│   ├── contact.html        # Contact page with form
│   ├── security.html       # Security information
│   └── faq.html            # Frequently Asked Questions
├── assets/
│   ├── css/
│   │   ├── bootstrap.min.css
│   │   └── style.css       # Custom styles (1600+ lines)
│   ├── js/
│   │   ├── bootstrap.bundle.min.js
│   │   └── main.js         # Core functionality
│   ├── images/
│   │   ├── favicon/        # Favicon assets
│   │   ├── avatar/
│   │   ├── brand/
│   │   └── ...
│   └── vendors/
│       └── bootstrap-icons/
├── robots.txt              # Search engine directives
├── sitemap.xml             # XML sitemap
└── .env.example            # Environment variables template

```

## 🎨 Design System

### Colors
- **Primary**: #2563eb (Blue)
- **Secondary**: #0f766e (Teal)
- **Success**: #0f766e
- **Warning**: #d97706
- **Danger**: #dc2626
- **Dark**: #111827
- **Light**: #f8fafc

### Typography
- **Font Family**: Inter (Google Fonts)
- **Weights**: 400, 500, 600, 700, 800
- **Base Size**: 16px

### Components
- Consistent button styles with hover effects
- Card-based layouts with subtle shadows
- Smooth transitions and animations
- Professional navigation with scroll effects

## 📊 Analytics Integration

### Vercel Analytics
1. Sign up at [Vercel](https://vercel.com)
2. Get your Analytics ID
3. Replace `YOUR_VERCEL_ANALYTICS_ID` in `html/index.html`

### Google Analytics 4
1. Create a GA4 property at [Google Analytics](https://analytics.google.com)
2. Get your Measurement ID (format: G-XXXXXXXXXX)
3. Replace `G-XXXXXXXXXX` in `html/index.html`

### Event Tracking
The following events are automatically tracked:
- **Page Views**: All page navigation
- **CTA Clicks**: All "Get Early Access" button clicks
- **Waitlist Signups**: Form submissions with use case data
- **Contact Form Submissions**: With subject category
- **Navigation Clicks**: Internal link clicks

## 🔍 SEO Features

- ✅ Dynamic page titles and meta descriptions
- ✅ Open Graph tags for social sharing
- ✅ Twitter Card markup
- ✅ Schema.org structured data (Organization, WebSite, SoftwareApplication)
- ✅ Canonical URLs
- ✅ robots.txt with AI bot blocking
- ✅ XML sitemap
- ✅ Semantic HTML5 markup
- ✅ Optimized heading hierarchy
- ✅ Image alt texts

## 🎯 Call-to-Action Strategy

**Primary CTA**: "Get Early Access"

Consistent placement across:
- Navigation bar (all pages)
- Hero section (main page)
- Mid-page CTA section
- Footer (all pages)

## 📱 Pages Overview

### Main Pages
- **Home** (`index.html`): Hero, features, how-it-works, FAQ, waitlist
- **Contact** (`contact.html`): Contact form, company info, support details
- **FAQ** (`faq.html`): Categorized frequently asked questions

### Legal Pages
- **Privacy Policy** (`privacy.html`): Data protection and privacy practices
- **Terms of Service** (`terms.html`): Terms and conditions
- **Security** (`security.html`): Security measures and compliance

## 🚀 Performance Optimizations

- Font preloading with `preconnect` hints
- Lazy loading for below-fold images
- Optimized CSS with CSS custom properties
- Minimal JavaScript (no heavy frameworks)
- Efficient Bootstrap 5 usage
- Optimized asset loading

## 🎨 UI/UX Features

- Smooth scroll navigation
- Sticky navbar with scroll effect
- Hover animations on cards and buttons
- Responsive mobile menu
- Form validation with Bootstrap
- Loading states and transitions
- Dark mode support (inherited from admin template)

## 📝 Environment Variables

Copy `.env.example` to `.env` and configure:

```env
# Analytics
VERCEL_ANALYTICS_ID=your_vercel_analytics_id_here
GA4_MEASUREMENT_ID=G-XXXXXXXXXX

# Site Configuration
SITE_URL=https://hideva.ai
SITE_NAME=hiDeva

# Contact Information
CONTACT_EMAIL=hello@hideva.ai
SUPPORT_EMAIL=support@hideva.ai
```

## 🔧 Development

### Local Development
1. Open `html/index.html` in a browser
2. Or use a local server: `python -m http.server 8000`
3. Navigate to `http://localhost:8000/html/`

### Production Deployment
1. Update analytics IDs in `html/index.html`
2. Replace placeholder URLs with actual domain
3. Add real OG image to `assets/images/og-image.jpg`
4. Upload all files to your web server
5. Submit sitemap to Google Search Console

## 📄 License

Design and Code is Copyright © 2026 hiDeva Inc.
Licensed under MIT License.

## 👥 Author

Designed and developed by the hiDeva team.

---

**Note**: This is a static HTML/CSS/JS website. No build process or package manager is required. All dependencies are loaded via CDN or local files.