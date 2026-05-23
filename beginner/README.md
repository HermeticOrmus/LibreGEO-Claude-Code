# Beginner — your first GEO audit

You have a site. You want to know whether AI search engines can see, understand, and cite it. This tier walks one full audit end-to-end so you can answer that question in 10 minutes.

## What you'll learn

- How to run `/geo-audit` and read the output
- What each of the 9 GEO axes measures and why it matters
- Which fixes are 30-second wins and which need engineering work
- How to track score deltas across runs

## Prerequisites

- Claude Code installed
- LibreGEO skills installed (run `../setup.sh` from the repo root)
- A site you control (your blog, portfolio, company site)

## Step 1 — Run the audit

In a Claude Code session, at the directory of your choice:

```
/geo-audit https://your-site.com
```

What happens:

1. The orchestrator skill spins up the 8 specialist subagents in parallel.
2. Each specialist crawls + scores its axis.
3. Results merge into a composite report.

Expect 2-5 minutes. Don't interrupt — the parallel subagents are doing real work.

## Step 2 — Read the report

The audit writes to `./geo-audit-<slug>-<timestamp>/`. Open `REPORT.md`.

### The composite score

A number 0-100 across nine axes. Anchors:

- **80-100**: cited frequently across major AI assistants
- **60-79**: occasionally cited for niche queries
- **40-59**: invisible for competitive queries
- **< 40**: invisible for almost everything

The score isn't a vanity metric — it's predictive of actual cite rate, validated against real crawls of ChatGPT + Perplexity citations.

### The nine axes

| Axis | What it measures | Quick fix? |
|---|---|---|
| Citability | Whether passages are quotable as-is | Yes — copy edit |
| Schema | JSON-LD presence + correctness | Yes — add Organization + Article schema |
| llms.txt | AI-friendly content disclosure | Yes — generate via `/geo-llmstxt` |
| Crawler access | robots.txt + headers permit AI bots | Yes — edit robots.txt |
| Technical | SSR/static HTML, Core Web Vitals | No — engineering work |
| Content | E-E-A-T signals | Partly — author bylines, dated content |
| Brand mentions | Brand presence across AI-cited platforms | No — months of brand work |
| Per-platform | Per-AI-engine tuning | Mixed |
| Reporting | (this is the report itself, not scored) | — |

## Step 3 — Pick the top finding

The report's "Prioritized actions" section ranks findings by impact × effort. Start at the top of the list.

Typical first-finding pattern for a non-optimized site:

> **F-01 · Schema · Critical**
> **Where**: site root, every page
> **What's wrong**: no JSON-LD on any page. AI systems extract structured facts from JSON-LD; absent it, they fall back to parsing prose, which is unreliable.
> **Fix**: Add `Organization` schema to the root + `Article` schema to blog pages. Run `/geo-schema https://your-site.com --generate` to scaffold both.

## Step 4 — Apply the fix

For the schema example:

```
/geo-schema https://your-site.com --generate
```

This writes a `schema.json` and `schema.html` snippet you can paste into your site's `<head>`. Deploy.

## Step 5 — Re-audit + compare

After your fix is live:

```
/geo-audit https://your-site.com --compare-with ./geo-audit-<previous-slug>-<ts>/
```

The compare flag shows you which scores moved and by how much. Schema work typically moves the score 5-15 points if the site had zero schema before.

## Step 6 — Iterate

Pick the next finding. Repeat. The score is a tractable optimization target.

Realistic trajectory for a non-optimized blog:

- Initial: ~35/100
- After schema + llms.txt + robots fix: ~55/100 (one afternoon of work)
- After E-E-A-T copy pass + author pages + dated content: ~70/100 (a week)
- After SSR migration (if needed): ~85/100 (engineering project)

## What's next

- **[Intermediate](../intermediate/)** — the 5 highest-ROI moves in order, with worked examples
- **[Advanced](../advanced/)** — per-platform tuning, multi-subdomain llms.txt, schema graphs at scale

## Common gotchas

1. **The audit reported `<= 40` and you panic.** Don't. Most non-optimized sites score that band. The audit is a starting line, not a verdict.
2. **You apply a fix and the score didn't move.** AI indices update on different cadences. Wait 2-4 weeks before declaring a fix ineffective.
3. **You see the same finding twice.** The findings are deduped by axis but a single root cause (no SSR) can appear as a finding under Citability + Schema + Content simultaneously. Fix the root, three findings clear.
