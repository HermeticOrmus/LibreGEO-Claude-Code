# GEO client report template

Fill each section with audit data. Output as **GEO-CLIENT-REPORT.md**.

---

## Section 1: Executive summary

One paragraph (4-6 sentences) covering:
- What was analyzed (domain, page count, date)
- Overall GEO Readiness Score with context ("XX/100, which places [brand] in the [label] tier")
- Single most impactful finding (positive or negative)
- Top 3 priority recommendations in one sentence
- Business impact ("Addressing these recommendations could increase AI-driven traffic by an estimated XX%, representing approximately $X,XXX/month based on current traffic patterns")

Tone: confident, direct, professional. No jargon. No hedging. Consultant delivering findings, not tool generating output.

## Section 2: GEO readiness score

```
## GEO Readiness Score: XX/100 — [Label]
```

```markdown
| Component | Score | Weight | Weighted Score |
|---|---|---|---|
| AI Platform Readiness | XX/100 | 25% | XX |
| Content Quality & E-E-A-T | XX/100 | 25% | XX |
| Technical Foundation | XX/100 | 20% | XX |
| Schema & Structured Data | XX/100 | 15% | XX |
| Brand Authority | XX/100 | 15% | XX |
| **Overall** | | | **XX/100** |
```

## Section 3: AI visibility dashboard

```markdown
## AI Visibility Dashboard

| AI Platform | Readiness Score | Key Gap | Priority Action |
|---|---|---|---|
| Google AI Overviews | XX/100 | [One-line gap] | [One-line action] |
| ChatGPT Web Search | XX/100 | [One-line gap] | [One-line action] |
| Perplexity AI | XX/100 | [One-line gap] | [One-line action] |
| Google Gemini | XX/100 | [One-line gap] | [One-line action] |
| Bing Copilot | XX/100 | [One-line gap] | [One-line action] |
```

Follow with: "These scores reflect how likely your content is to be cited by each AI search platform. A score below 50 indicates significant barriers to citation on that platform."

## Section 4: AI crawler access status

```markdown
## AI Crawler Access

| AI Crawler | Platform | Status | Impact | Recommendation |
|---|---|---|---|---|
| Googlebot | Google Search + AIO | Allowed/Blocked | Critical | [Action] |
| GPTBot | ChatGPT / OpenAI | Allowed/Blocked | High | [Action] |
| Bingbot | Bing + Copilot + ChatGPT | Allowed/Blocked | High | [Action] |
| PerplexityBot | Perplexity AI | Allowed/Blocked | Medium | [Action] |
| Google-Extended | Gemini Training | Allowed/Blocked | Medium | [Action] |
| ClaudeBot | Anthropic Claude | Allowed/Blocked | Medium | [Action] |
| Applebot-Extended | Apple Intelligence | Allowed/Blocked | Medium | [Action] |
```

Client translation: "Blocking AI crawlers is like closing your store during business hours. If a crawler cannot access your site, the AI platform it powers cannot cite your content. We recommend allowing all major AI crawlers unless you have a specific data licensing concern."

## Section 5: Brand authority analysis

```markdown
## Brand Authority

| Platform | Presence | Status | Impact on AI Visibility |
|---|---|---|---|
| Wikipedia | Yes/No | [Detail] | Very High — 47.9% of ChatGPT citations are Wikipedia |
| Wikidata | Yes/No | [Detail] | High — machine-readable entity data |
| LinkedIn | Yes/No | [Detail] | High — Bing Copilot and ChatGPT signal |
| YouTube | Yes/No | [Detail] | High — Gemini and Perplexity signal |
| Reddit | Yes/No | [Detail] | Very High — 46.7% of Perplexity citations are Reddit |
| Google Knowledge Panel | Yes/No | [Detail] | High — Gemini entity recognition |
| Crunchbase | Yes/No | [Detail] | Medium — entity validation |
| GitHub | Yes/No | [Detail] | Medium — tech brand signal |
```

Client translation: "AI platforms build trust by cross-referencing your brand across multiple authoritative sources. Each platform where your brand has an accurate, consistent presence increases the likelihood of being cited in AI answers."

## Section 6: Citability analysis

### Top 5 most citable pages
For each: URL · why it is citable (structure, depth, E-E-A-T) · one specific improvement.

### Top 5 least citable pages
For each: URL · why it is unlikely to be cited (thin content, poor structure, missing signals) · specific rewrite/restructure recommendation.

Business framing: "Your most citable pages are your best candidates for appearing in AI-generated answers. Improving the 5 least citable pages represents the highest-ROI content investment you can make for AI visibility."

## Section 7: Technical health summary

```markdown
## Technical Health

| Area | Status | Business Impact |
|---|---|---|
| Core Web Vitals | Good/Needs Work/Poor | [Impact on user experience and rankings] |
| Server-Side Rendering | Yes/Partial/No | [Impact on AI crawler visibility] |
| Mobile Optimization | Good/Needs Work/Poor | [Impact on Google's mobile-first indexing] |
| Security (HTTPS + Headers) | Good/Needs Work/Poor | [Impact on trust signals] |
| Page Speed | Fast/Average/Slow | [Impact on user experience and crawl budget] |
| IndexNow Protocol | Implemented/Not | [Impact on Bing/ChatGPT indexing speed] |
```

If SSR is missing or partial, callout: "Your site uses client-side rendering, which means AI crawlers see an empty page when they visit. This is the single most impactful technical issue for AI search visibility. Until this is resolved, most AI platforms cannot cite your content."

## Section 8: Schema and structured data

```markdown
## Schema & Structured Data

### Current Implementation
| Schema Type | Present | Status | AI Impact |
|---|---|---|---|
| Organization | Yes/No | [Valid/Issues] | Critical — entity recognition |
| Article + Author | Yes/No | [Valid/Issues] | High — E-E-A-T signal |
| sameAs (entity links) | Yes/No | [Count] links | Critical — cross-platform entity graph |
| [Business-specific] | Yes/No | [Valid/Issues] | [Impact] |
| WebSite + SearchAction | Yes/No | [Valid/Issues] | Medium — sitelinks |
| BreadcrumbList | Yes/No | [Valid/Issues] | Low-Medium — navigation context |
```

If schemas missing: "Ready-to-use structured data code has been prepared and is included in the technical appendix. Your development team can add this to your site with minimal effort."

## Section 9: llms.txt status

```markdown
## llms.txt — AI Content Guide

| File | Status | Recommendation |
|---|---|---|
| /llms.txt | Present/Missing | [Action] |
| /llms-full.txt | Present/Missing | [Action] |
```

Client translation: "llms.txt is an emerging standard (similar to robots.txt) that tells AI systems what your site is about and which pages are most important. While not universally adopted yet, implementing it positions your brand ahead of competitors and provides direct guidance to AI platforms."

## Section 10: Prioritized action plan

The most important section. Organize by timeline and impact.

```markdown
## Prioritized Action Plan

### Quick Wins (This Week)
*High impact, low effort — can be implemented immediately*

| # | Action | Impact | Effort | Platforms Affected |
|---|---|---|---|---|
| 1 | [Specific action] | [High/Med] | [Hours estimate] | [Which AI platforms] |
| 2 | [Specific action] | [High/Med] | [Hours estimate] | [Which AI platforms] |

### Medium-Term Improvements (This Month)
*Significant impact, moderate effort — requires content or technical changes*

| # | Action | Impact | Effort | Platforms Affected |
|---|---|---|---|---|
| 1 | [Specific action] | [High/Med] | [Days estimate] | [Which AI platforms] |

### Strategic Initiatives (This Quarter)
*Long-term competitive advantage, requires ongoing investment*

| # | Action | Impact | Effort | Platforms Affected |
|---|---|---|---|---|
| 1 | [Specific action] | [High/Med] | [Weeks estimate] | [Which AI platforms] |
```

Bucket criteria + examples in `examples.md`.

### Estimated impact
"Based on industry benchmarks and the specific gaps identified in this audit:
- **Quick Wins alone** could improve your GEO score by approximately [X-Y] points
- **Full implementation** of this action plan could improve your GEO score to approximately [XX]/100
- At current traffic levels and conversion rates, improved AI visibility represents an estimated **$X,XXX - $XX,XXX per month** in additional organic value"

Use conservative estimates. Base the dollar figure on:
- Current estimated organic traffic value (from analytics if available, or industry benchmarks)
- AI search is projected to drive 25-40% of organic discovery by end of 2026
- A 10-point GEO score improvement typically correlates with a 15-25% increase in AI citation frequency

## Section 11: Competitor comparison (if competitor URLs provided)

```markdown
## Competitor Comparison

| Metric | [Your Brand] | [Competitor 1] | [Competitor 2] |
|---|---|---|---|
| Overall GEO Score | XX/100 | XX/100 | XX/100 |
| Google AIO Readiness | XX/100 | XX/100 | XX/100 |
| ChatGPT Readiness | XX/100 | XX/100 | XX/100 |
| Perplexity Readiness | XX/100 | XX/100 | XX/100 |
| Schema Coverage | [Detail] | [Detail] | [Detail] |
| Wikipedia Presence | Yes/No | Yes/No | Yes/No |
| Reddit Authority | [Detail] | [Detail] | [Detail] |
| SSR Status | Yes/No | Yes/No | Yes/No |

### Where You Lead
[Specific areas where the brand outperforms competitors]

### Where You Trail
[Specific areas where competitors have an advantage, with actions to close the gap]
```

## Section 12: Appendix

```markdown
## Appendix

### Methodology
- **Pages analyzed**: [List of specific URLs audited]
- **Platforms assessed**: Google AI Overviews, ChatGPT, Perplexity AI, Google Gemini, Bing Copilot
- **Technical checks**: HTTP headers, robots.txt, HTML source analysis, structured data validation
- **Content assessment**: E-E-A-T framework per Google's December 2025 Quality Rater Guidelines
- **Schema validation**: JSON-LD parsing and Schema.org specification compliance
- **Date of analysis**: [Date]

### Data Sources
- Google Search Quality Rater Guidelines (December 2025 update)
- Schema.org full type hierarchy
- Industry citation studies (Zyppy, Authoritas, Semrush AI search research, 2025-2026)
- Core Web Vitals thresholds (web.dev, 2026 standards)
- AI crawler user-agent documentation (per-platform official docs)

### Glossary

| Term | Definition |
|---|---|
| GEO | Generative Engine Optimization — optimizing content to be cited by AI search platforms |
| AIO | AI Overviews — Google's AI-generated answer boxes at the top of search results |
| E-E-A-T | Experience, Expertise, Authoritativeness, Trustworthiness — Google's content quality framework |
| SSR | Server-Side Rendering — generating HTML on the server so crawlers can read content without JavaScript |
| CWV | Core Web Vitals — Google's page experience metrics (LCP, INP, CLS) |
| LCP | Largest Contentful Paint — time to render the largest visible element |
| INP | Interaction to Next Paint — responsiveness metric (replaced FID in March 2024) |
| CLS | Cumulative Layout Shift — visual stability metric |
| JSON-LD | JavaScript Object Notation for Linked Data — preferred structured data format |
| sameAs | Schema.org property linking an entity to its profiles on other platforms |
| IndexNow | Protocol for instantly notifying search engines of content changes |
| llms.txt | Proposed standard file for guiding AI systems about a site's content |
| YMYL | Your Money or Your Life — topics requiring highest E-E-A-T standards |
| SERP | Search Engine Results Page |
| Topical Authority | The depth and breadth of a site's coverage of its core topic area |
```
