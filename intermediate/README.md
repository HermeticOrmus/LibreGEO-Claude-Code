# Intermediate — optimize a deployed site

You ran the beginner audit, scored somewhere in the 40-70 band, and want to know what to fix first. This tier walks the five highest-ROI moves in order, with worked examples.

## The five moves (in priority order)

| # | Move | Typical score lift | Effort |
|---|---|---|---|
| 1 | Add `Organization` + `Article` JSON-LD | +5 to +15 | hour |
| 2 | Generate + ship `llms.txt` | +3 to +8 | hour |
| 3 | Fix robots.txt to allow AI crawlers | +2 to +6 | minutes |
| 4 | E-E-A-T copy pass (author bylines, dated content, expertise signals) | +5 to +12 | day |
| 5 | SSR migration (if JS-rendered) | +10 to +25 | engineering project |

The first four are achievable in a working day. The fifth is the heavy lift; sequence it last.

## Move 1 — Schema (Organization + Article)

The single highest-leverage GEO move on most non-optimized sites.

```
/geo-schema https://your-site.com --audit
```

Read the audit. If you see "no JSON-LD detected," generate:

```
/geo-schema https://your-site.com --generate organization
/geo-schema https://your-site.com/blog/your-article --generate article
```

The skill writes JSON-LD blocks. Paste into the `<head>` of the relevant pages.

**Why this works**: AI systems extract structured facts from JSON-LD. Without it, they parse prose, which is lossy and they hedge by not citing.

**Validate**: After deploying, run [Google's Rich Results Test](https://search.google.com/test/rich-results) on the same URL. If it shows the schema, AI crawlers see it too.

## Move 2 — llms.txt

The emerging standard for AI-friendly content disclosure. Faster to ship than schema, smaller score impact, but the trajectory is up — llms.txt support across AI assistants is growing.

```
/geo-llmstxt https://your-site.com --generate
```

This crawls your site, identifies the highest-value pages, writes an `llms.txt` and (optionally) an `llms-full.txt`. Deploy both to the site root.

Verify accessibility:

```
curl https://your-site.com/llms.txt
```

Should return a Markdown file with sections naming your highest-value pages.

## Move 3 — Robots access for AI bots

The cheapest move on the list. AI crawlers respect `robots.txt`; if you're blocking them, fix the lines.

```
/geo-crawlers https://your-site.com
```

Audit checks for: GPTBot, ClaudeBot, PerplexityBot, Google-Extended, CCBot, Bytespider, anthropic-ai. The report says which are blocked and proposes a corrected `robots.txt`.

Don't blanket-allow if you have a reason to block (e.g., paywalled content, training-data concerns). The audit names each bot's purpose so you can decide per-bot.

## Move 4 — E-E-A-T copy pass

The first three moves are mechanical. This one needs judgment.

Run:

```
/geo-content https://your-site.com/blog
```

Read each finding. Common patterns:

- **Missing author bylines** → add `<a rel="author">` + an author page with credentials
- **Undated content** → add visible publication + last-updated dates (also add `dateModified` to the Article schema)
- **No expertise signals** → add "About the author" blurb with relevant credentials
- **No external sources cited** → add hyperlinks to authoritative external sources you reference

These are content edits, not engineering. Allow a day for a 10-article site, a week for a 100-article site.

## Move 5 — SSR migration

If `geo-technical` flagged "JS-rendered, crawler sees empty shell," the score ceiling is around 60 until SSR is in place.

Migration paths:

- **Next.js, Nuxt, SvelteKit**: turn on SSR (often a one-line config change)
- **Astro**: already SSG by default; verify
- **CRA / Vite SPA**: you need an alternative (Astro migration, Remix, or prerendering proxy)

This is the engineering project on the list. Sequence it last because:

1. The other 4 moves can ship in 1-2 days and may get you to 70/100 without SSR.
2. The SSR migration risk is higher (full-stack changes).
3. Many sites tolerate the 60-65/100 ceiling fine for their use case.

## What "done" looks like at this tier

- Score in the 70-85 band
- All quick wins applied
- Audit findings list is short and concentrated on advanced / structural items
- You can re-run the audit on a monthly cadence and see drift (positive or negative)

## What's next

- **[Advanced](../advanced/)** — per-platform tuning, schema graphs at scale, multi-subdomain llms.txt, A/B testing AI citation rates

## Watch-outs

- **Don't game the citability score.** Some sites stuff facts into the first paragraph to look citation-ready. AI systems detect this. Keep prose natural.
- **Don't add schema you can't back up.** Faking a `Person` schema with credentials you don't have is detected and downranks the site.
- **Don't over-optimize llms.txt.** The standard explicitly discourages excessive promotional content. Keep it factual.
