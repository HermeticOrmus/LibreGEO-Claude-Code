# Troubleshooting

## Skill not found after installing

The skills ship as one plugin, `libre-geo`. Verify it is installed and enabled:

```bash
claude plugin list | grep 'libre-geo@libre-geo'
claude plugin details libre-geo@libre-geo   # lists the 12 skills
```

If it is missing, run `/plugin install libre-geo@libre-geo` (or `./setup.sh`) and restart Claude Code; plugins load at session start. If a skill name collides with another installed skill, call it by its namespaced form, for example `/libre-geo:geo-audit`.

## Every GEO skill shows up twice

Before v1.0.0, `setup.sh` copied each skill folder into `~/.claude/skills/`. Claude Code still loads those copies, so with the plugin installed you get two of each. `./setup.sh` lists any leftover folders with the same names and prints the `rm -rf` command for them. Remove them only if they came from the old installer.

## `/geo-audit` errors out with rate-limit / 429

The audit makes parallel requests via subagents. If you're hitting rate limits on the target site, throttle:

```
/geo-audit https://your-site.com --concurrency 2
```

The default is 8 parallel agents.

## `geo-report-pdf` fails with "ReportLab not installed"

Install the Python dependency:

```bash
pip install reportlab
```

To install every dependency the bundled scripts use: `pip install -r skills/geo/requirements.txt`.

## Audit takes forever on a large site

The audit walks every URL by default. Cap it:

```
/geo-audit https://your-site.com --max-urls 50
```

For sites with > 1000 URLs, run the audit on a representative subset (homepage + 3-5 highest-traffic pages) instead of the whole site.

## "Page renders empty for AI crawler" finding

This means the page is JS-rendered and the crawler doesn't run JS. Three fixes:

1. **Add SSR or static rendering** — Next.js `getStaticProps`, Astro, Nuxt SSR, etc. The cleanest fix.
2. **Add prerendered HTML** for AI bots via `User-Agent` detection and a CDN rule. Faster to ship, fragile.
3. **Accept the invisibility** and optimize for the discovery channel that doesn't depend on crawlers (e.g., paid AI-platform integrations).

The audit names which path applies to your stack.

## `llms.txt` generated but AI assistants still don't cite the site

llms.txt is an emerging standard. As of 2026-05, not all AI assistants honor it. The cite path goes through:

1. Public crawl (your `robots.txt` lets the right bots in)
2. Index ingestion (the bot's crawler actually visits)
3. Citation eligibility (the page meets quality + schema bars)

`llms.txt` helps step 1 + 3 but not step 2. If step 2 is failing, the gap is usually authority or backlinks — work outside this toolkit.

## Score didn't move after applying every recommended fix

Two common causes:

1. **AI search indices update on different cadences.** Google AI Overviews refreshes faster than Perplexity, which refreshes faster than ChatGPT web search. Expect 2-6 weeks for fixes to propagate.
2. **The audit measured what it could measure.** Some axes (brand authority, real-world expertise) move on timescales beyond what an audit run captures. The audit's score reflects the on-page surface; the actual cite rate also depends on signals that take months to accumulate.

If the score moves but cites don't, the gap is brand-side, not page-side.

## Issue not listed here

Open a GitHub issue with:

- Skill that failed
- Exact command run
- Full output (redact API keys / credentials)
- OS + Python version + Claude Code version

See [CONTRIBUTING.md](CONTRIBUTING.md) for the issue template.
