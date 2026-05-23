# Advanced — per-platform tuning + at-scale patterns

You're past the obvious moves. You optimize sites for AI search at scale, across multiple subdomains or properties, and you want repeatable patterns that survive changes to the underlying platforms.

## What's in this tier

- Per-platform tuning (Google AI Overviews, ChatGPT, Perplexity, Gemini, Bing Copilot)
- Multi-subdomain llms.txt strategy
- Schema graphs that maintain consistency across hundreds of pages
- A/B-testing AI cite rates
- Tracking cite-rate drift over time

## Per-platform tuning

The five major AI search engines have different preferences. The bundle's `geo-platform-optimizer` measures and tunes per-platform.

```
/geo-platform-optimizer https://your-site.com --platform all
```

Output: per-platform readiness scores + per-platform action plans.

### Google AI Overviews

- **Heavy weight on**: structured data (JSON-LD), original research, expert authorship
- **Penalizes**: thin content, manipulative anchor text, low-trust outbound links
- **Tactic**: First-paragraph factual density. The AI Overview engine often pulls the first 1-2 sentences of an article as the quote. Make those sentences earn the cite.

### ChatGPT web search

- **Heavy weight on**: Bing's index (ChatGPT uses Bing under the hood), site authority, recency
- **Penalizes**: cloaking, AI-generated thin content (detected via classifier)
- **Tactic**: Maintain Bing webmaster registration. Bing-specific schema (e.g., `IPTC` for news) helps.

### Perplexity

- **Heavy weight on**: page directly answers the user's question, source diversity
- **Penalizes**: paywalls (Perplexity surfaces "open" sources preferentially)
- **Tactic**: One question, one answer, in the first 200 words. Perplexity rewards direct.

### Gemini

- **Heavy weight on**: Google index integration, Google Knowledge Graph entities
- **Penalizes**: same as Google AI Overviews + reduced weight for sites with thin entity surface
- **Tactic**: Build out your Knowledge Graph entity. `sameAs` links to Wikipedia / Wikidata / Crunchbase carry weight.

### Bing Copilot

- **Heavy weight on**: Bing's classic index, structured data (Bing supports more schemas than Google)
- **Penalizes**: poor Core Web Vitals (Bing weighs INP)
- **Tactic**: Run Lighthouse against Bing's CWV thresholds, not just Google's.

## Multi-subdomain llms.txt

For a domain hierarchy like:

```
example.com
├── blog.example.com
├── docs.example.com
├── api.example.com
└── shop.example.com
```

Don't deploy one `llms.txt` at the apex covering everything. Deploy one per subdomain, each scoped to that subdomain's high-value content. The skill supports this:

```
/geo-llmstxt https://blog.example.com --generate --scope subdomain
/geo-llmstxt https://docs.example.com --generate --scope subdomain
```

Generated files reference the apex domain's `llms.txt` so an AI crawler arriving at any subdomain finds the right scope.

## Schema graphs at scale

A site with > 100 pages should maintain a **schema graph** — a coherent set of JSON-LD blocks that reference each other across pages.

```
/geo-schema https://your-site.com --build-graph
```

This audits all pages, identifies entity overlaps (same author across articles, same organization across pages), and generates a JSON-LD graph where each entity is defined once and referenced via `@id` elsewhere.

Manual schema across 100 pages drifts — author names misspell, dates inconsistent, `sameAs` URLs go stale. A schema graph keeps the entities canonical.

## A/B testing AI cite rates

Causality is hard in AI search. Did the schema fix move the cite rate, or did Google update its ranker?

Two patterns:

1. **Time-window comparison**: Run a baseline cite-rate measurement before the fix, wait 4 weeks, re-measure. Subtract baseline. Coarse but workable.
2. **Per-page testing**: Apply the fix to half the site, leave the other half untouched. Compare cite rates across the two cohorts after 4 weeks. Requires a script to track citations.

The bundle ships a `track-cites.sh` helper (in `resources/`) that queries ChatGPT + Perplexity for sample queries and records which pages were cited. Run it pre- and post-change.

## Cite-rate drift tracking

Stand up a monthly cron that:

1. Runs `/geo-audit` against the site
2. Logs the composite score + per-axis scores
3. Runs the `track-cites.sh` helper to sample actual AI citations
4. Charts both over time

When the score moves but cites don't (or vice versa), you've found a measurement-gap to investigate.

## Anti-patterns at this tier

- **Optimizing for one AI platform at the expense of others.** ChatGPT-optimized prose can underperform on Perplexity. The platform-optimizer flags conflicts.
- **Excessive schema.** Adding `Course`, `Event`, `Recipe`, `Product` etc. to pages that aren't those things is detected and penalized. Schema only for what the page actually is.
- **llms.txt cargo-culting.** Some sites copy-paste another company's `llms.txt`. The standard discourages this; specificity to your site's actual high-value content is the point.

## Open research questions

The AI-search landscape is changing fast. Things this kit doesn't cover yet but should:

- **Multi-modal cite optimization** (images, video — AI assistants are starting to surface non-text answers)
- **Regional AI search** (Baidu, Yandex, Naver — each has its own GEO landscape, currently English-centric)
- **Authority signal weighting** (how much does a Wikipedia mention actually move the cite rate?)

PRs welcome. See [CONTRIBUTING.md](../CONTRIBUTING.md).

## Where to go from here

The advanced patterns above are 80% mechanical, 20% judgment. The judgment compounds the longer you operate. The bundle gives you the mechanics; the patterns give you a starting point; your accumulated cite-rate data is what makes you good at this over time.
