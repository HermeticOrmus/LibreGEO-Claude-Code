# Quick start

Five minutes from clone to first audit.

## 1. Clone and install

```bash
git clone https://github.com/HermeticOrmus/LibreGEO-Claude-Code.git ~/projects/LibreGEO-Claude-Code
cd ~/projects/LibreGEO-Claude-Code
./setup.sh
```

`setup.sh` copies the 12 skills into `~/.claude/skills/` (or wherever your Claude Code config lives). Re-run anytime to refresh.

## 2. Run your first audit

In any Claude Code session:

```
/geo-audit https://your-site.com
```

The audit walks the site, scores it across nine GEO axes, and writes a report. Expect 2-5 minutes for a 50-page site.

Output: a composite GEO score (0-100), per-axis scores, a prioritized action plan.

## 3. Read the report

The audit writes to `./geo-audit-<slug>-<ts>/`:

- `REPORT.md` — the report (human-readable)
- `REPORT.pdf` — same content, polished for client delivery
- `data.json` — raw findings for downstream automation

## 4. Drill into a specific axis

The audit calls each specialist skill underneath. Re-run any one of them directly:

```
/geo-citability https://your-site.com/blog/article-1
/geo-schema https://your-site.com
/geo-llmstxt https://your-site.com
/geo-crawlers https://your-site.com
/geo-content https://your-site.com/blog
/geo-technical https://your-site.com
/geo-brand-mentions "Your Brand Name"
```

Each one writes its own report under its own folder.

## 5. Generate a client-ready deliverable

After running `/geo-audit`, package it for delivery:

```
/geo-report ./geo-audit-<slug>-<ts>/
/geo-report-pdf ./geo-audit-<slug>-<ts>/REPORT.md
```

The PDF includes score gauges, bar charts, platform readiness visualizations, and color-coded action tables.

## What "good" looks like

| Score | Read |
|---|---|
| 90-100 | Industry-leading. Cited frequently across AI assistants. |
| 75-89 | Strong. Acceptable for most categories. |
| 60-74 | Workable. Has clear gaps but no disqualifying flaws. |
| 40-59 | Visible weakness. Will be ignored by AI search for competitive queries. |
| 0-39 | Disqualifying. Page is functionally invisible to AI search. |

For context: the bundled `demo/ormus-solutions-audit/` and `demo/public-benchmark-audit/` show what scores in different bands look like in practice.

## Iterating

Run the audit again after changes. The skills track score deltas between runs so you see whether the work moved the needle.

```
/geo-audit https://your-site.com --compare-with ./geo-audit-<previous-slug>-<ts>/
```

## When the audit reports "page invisible"

Two common causes:

1. **No SSR**: The page renders client-side and the AI crawler sees an empty shell. Fix at `/geo-technical`.
2. **No schema**: The page has no JSON-LD, so AI systems can't extract structured facts. Fix at `/geo-schema`.

The audit names both explicitly in the findings section.

## What's next

- [Beginner walkthrough](beginner/) — one full audit from start to finish, narrated
- [Intermediate](intermediate/) — fix the 5 highest-ROI findings, in order
- [Advanced](advanced/) — per-platform tuning, schema graphs at scale
