# geo-technical — Detailed Checks Reference

Companion to SKILL.md. Holds expanded prose for each sub-check, fix lists, and protocol explainers. SKILL.md is the operational protocol; this file is referenced as needed during an audit.

---

## Category 1: Crawlability — Sub-Checks

### 1.1 robots.txt Validity
- Fetch `https://[domain]/robots.txt`
- Check for syntactic validity: proper `User-agent`, `Allow`, `Disallow` directives
- Common errors: missing User-agent, wildcards blocking important paths, `Disallow: /` blocking entire site
- Verify sitemap reference: `Sitemap: https://[domain]/sitemap.xml`

### 1.2 AI Crawler Access Nuance
Blocking `Google-Extended` does NOT block Googlebot. Google-Extended only controls AI training data usage, not search indexing. However, blocking Google-Extended may reduce presence in AI Overviews. Recommend allowing Google-Extended unless there is a specific data licensing concern.

**AI crawler access scoring:**
- All major AI crawlers allowed: 5 points
- Some blocked but Googlebot + Bingbot allowed: 3 points
- GPTBot or PerplexityBot blocked: 1 point (significant GEO impact)
- Googlebot blocked: 0 points (fatal)

### 1.3 XML Sitemaps
- Fetch sitemap (check robots.txt for location, or try `/sitemap.xml`, `/sitemap_index.xml`)
- Validate XML syntax
- Check for `<lastmod>` dates (should be present and accurate)
- Count URLs vs expected indexable pages
- Sitemap index if large site (50,000+ URLs per sitemap max)
- Sample-verify URLs return 200

### 1.4 Crawl Depth
- Homepage = depth 0. Important pages must be reachable within **3 clicks** (depth 3)
- Depth 4+ receives significantly less crawl budget and is less likely to be cited by AI
- Check internal linking from homepage / main nav

### 1.5 Noindex Management
- `<meta name="robots" content="noindex">` on pages that SHOULD be indexed
- `X-Robots-Tag: noindex` HTTP headers
- Common mistakes: noindex on paginated pages, category pages, key landing pages

---

## Category 2: Indexability — Sub-Checks

### 2.1 Canonical Tags
- Every indexable page needs `<link rel="canonical" href="...">`
- Self-referencing for authoritative version
- No conflicting canonicals (HTML vs HTTP header)
- No canonical chains (A→B→C should be A→C)

### 2.2 Duplicate Content
- www vs non-www (both resolve, one redirects)
- HTTP redirects to HTTPS
- Trailing slash consistency
- Parameter-based duplicates (`?sort=price`)

### 2.3 Pagination
- `rel="next"` / `rel="prev"` (Google ignores since 2019, Bing still uses)
- Preferred: `rel="canonical"` on paginated pages to view-all or first page
- Paginated pages not noindexed if unique content

### 2.4 Hreflang (international)
- `<link rel="alternate" hreflang="xx">`
- Reciprocal hreflang
- x-default fallback exists
- ISO 639-1 / ISO 3166-1 valid codes

### 2.5 Index Bloat
- Estimate indexed pages (sitemap count, `site:domain.com`)
- Compare to actual valuable content pages
- Flag if indexed significantly exceeds content (thin/duplicate/parameter pages)

---

## Category 3: Security — Header Reference

| Header | Required Value | Purpose |
|---|---|---|
| `Strict-Transport-Security` | `max-age=31536000; includeSubDomains` | Forces HTTPS |
| `Content-Security-Policy` | Appropriate policy | Prevents XSS |
| `X-Content-Type-Options` | `nosniff` | Prevents MIME sniffing |
| `X-Frame-Options` | `DENY` or `SAMEORIGIN` | Prevents clickjacking |
| `Referrer-Policy` | `strict-origin-when-cross-origin` or stricter | Controls referrer data |
| `Permissions-Policy` | Appropriate restrictions | Controls browser features |

### 3.1 HTTPS Enforcement
- Site loads over HTTPS
- HTTP redirects to HTTPS (301)
- No mixed content (HTTP resources on HTTPS pages)
- SSL/TLS cert valid and unexpired

---

## Category 4: URL Structure — Sub-Checks

### 4.1 Clean URLs
- Human-readable: `/blog/seo-guide` not `/blog?id=12345`
- No session IDs
- Lowercase only
- Hyphens (not underscores)
- No special characters / encoded spaces

### 4.2 Logical Hierarchy
- Path reflects architecture: `/category/subcategory/page`
- Flat where appropriate
- Consistent pattern

### 4.3 Redirect Chains
- Max 1 hop (A→C directly, not A→B→C)
- No redirect loops
- 301 (permanent) unless intentionally temporary

### 4.4 Parameter Handling
- Parameters must not create duplicate indexable pages
- Use canonical tags or `robots.txt` Disallow
- Configure parameter handling in Google Search Console + Bing Webmaster Tools

---

## Category 5: Mobile — Sub-Checks

### Critical Context
As of **July 2024**, Google crawls ALL sites exclusively with mobile Googlebot. No desktop crawling. If the site does not work on mobile, it does not work for Google.

### 5.1 Responsive Design
- `<meta name="viewport" content="width=device-width, initial-scale=1">`
- No horizontal scrolling on mobile
- No fixed-width layouts wider than viewport

### 5.2 Tap Targets
- Interactive elements at least 48x48 CSS pixels
- Minimum 8px spacing between tap targets

### 5.3 Font Sizes
- Base font size at least 16px
- No text requiring zoom
- WCAG AA contrast: 4.5:1 normal text, 3:1 large text

### 5.4 Mobile Content Parity
- All desktop content visible on mobile
- No content hidden behind toggles Googlebot cannot expand
- Images and media load on mobile

---

## Category 6: Core Web Vitals — Detail

CWV uses **75th percentile** of real user data (field data) as benchmark. Lab data debugs; field data ranks.

### Assessing Without CrUX Data
- **LCP**: Largest above-fold element. Image (size/format)? Text (web font loading)? TTFB?
- **INP**: Heavy JavaScript? Long tasks (>50ms)? Third-party scripts?
- **CLS**: Images without width/height? Dynamic content above fold? Web fonts causing FOUT/FOIT?

### Common LCP Fixes
1. Optimize hero images: WebP/AVIF, correct sizing, preload with `<link rel="preload">`
2. Reduce server response time (TTFB < 800ms)
3. Eliminate render-blocking CSS/JS
4. Preconnect to critical third-party origins

### Common INP Fixes
1. Break long tasks (>50ms) into smaller chunks using `requestIdleCallback` or `scheduler.yield()`
2. Reduce third-party JavaScript
3. Use `content-visibility: auto` for off-screen content
4. Debounce/throttle event handlers

### Common CLS Fixes
1. Always include `width` and `height` on images and videos
2. Reserve space for ads/embeds with CSS `aspect-ratio` or explicit dimensions
3. Use `font-display: swap` with size-adjusted fallback fonts
4. Avoid inserting content above existing content after load

---

## Category 7: SSR — Detail

### Why SSR Is Mandatory for AI Visibility
AI crawlers (GPTBot, PerplexityBot, ClaudeBot, etc.) do **NOT execute JavaScript**. They fetch raw HTML. If content is rendered client-side by React/Vue/Angular/etc., AI crawlers see an empty page.

Even Googlebot, which executes JavaScript, deprioritizes JS-rendered content due to crawl budget. Google processes JS rendering in a separate "rendering queue" that can delay indexing by days or weeks.

### What to Check in Raw HTML
- **Main content text**: article body / product description / page content present?
- **Headings**: H1, H2, H3 tags present?
- **Navigation**: server-rendered?
- **Structured data**: JSON-LD in raw HTML or JS-injected?
- **Meta tags**: title, description, canonical, OG tags in raw HTML?
- **Internal links**: navigation and content links in raw HTML? (critical for crawlability)

### SSR Solutions
| Framework | SSR Solution |
|---|---|
| React | Next.js (SSR/SSG), Remix, Gatsby (SSG) |
| Vue | Nuxt.js (SSR/SSG) |
| Angular | Angular Universal |
| Svelte | SvelteKit |
| Generic | Prerender.io (prerendering service), Rendertron |

### SSR Scoring Detail
- All key content server-rendered: 15 points
- Main content server-rendered but some elements JS-only: 10 points
- Critical content requires JS (product info, article text): 5 points
- Entire page client-rendered (empty body in raw HTML): 0 points

---

## Category 8: Page Speed — Sub-Checks

### 8.1 TTFB
- Target: **< 800ms** (ideally < 200ms)
- Measure: `curl -o /dev/null -s -w 'TTFB: %{time_starttransfer}s\n' [URL]`
- If > 800ms: check server location, caching, database queries, CDN usage

### 8.2 Resource Optimization
- Total page weight target: **< 2MB** (critical pages < 1MB)
- gzip/brotli compression enabled
- Minified CSS and JavaScript
- Unused CSS/JS check (can be 50%+ of bytes)

### 8.3 Image Optimization
- WebP or AVIF preferred over JPEG/PNG
- No oversized images (larger than display size)
- `loading="lazy"` on below-fold images
- Explicit width/height (prevents CLS)
- Above-fold images NOT lazy loaded (harms LCP)

### 8.4 Code Splitting & Lazy Loading
- JS code-split so each page only loads what it needs
- Large JS bundles: > 200KB compressed = warning, > 500KB = critical
- Third-party scripts `async` or `defer`
- No render-blocking resources in `<head>`

### 8.5 Caching
- `Cache-Control` on static resources
- Static assets: `max-age=31536000` (1 year) with content-hashed filenames
- HTML pages: shorter cache or `no-cache` with validation (`ETag` / `Last-Modified`)

### 8.6 CDN
- Static resources from CDN
- CDN-specific headers: `CF-Ray` (Cloudflare), `X-Cache` (AWS CloudFront), `X-Served-By` (Fastly)

---

## IndexNow Protocol

### What It Is
Open protocol allowing sites to notify search engines instantly on content create/update/delete. Supported by Bing, Yandex, Seznam, Naver. Google does NOT support IndexNow but monitors the protocol.

### Why It Matters for GEO
ChatGPT uses Bing's index. Bing Copilot uses Bing's index. Faster Bing indexing = faster AI visibility on two major platforms.

### Implementation Check
1. Check for IndexNow key file: `https://[domain]/.well-known/indexnow-key.txt` or similar
2. Check if CMS has IndexNow plugin (WordPress: IndexNow plugin; many modern CMS support natively)
3. If not implemented, recommend adding it

---

## Score Interpretation

- **90-100**: Excellent — technically sound for traditional SEO and GEO
- **70-89**: Good — minor issues, fundamentally solid
- **50-69**: Needs Work — significant technical debt impacting visibility
- **30-49**: Poor — major issues blocking crawling, indexing, or AI visibility
- **0-29**: Critical — fundamental technical failures requiring immediate attention
