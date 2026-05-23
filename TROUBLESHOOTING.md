# Troubleshooting

## Skill not found after running `setup.sh`

The installer copies skills into `~/.claude/skills/`. Verify they landed:

```bash
ls ~/.claude/skills/ | grep '^geo'
```

You should see 12 entries. If not, re-run `setup.sh` and watch the output for `[skip]` lines indicating something pre-existing blocked the copy. Remove the conflicting directory and re-run, or run with `--skills-dir <other-path>`.

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

Or use the project-local Python via `setup.sh --with-python-deps`.

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
