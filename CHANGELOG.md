# Changelog

All notable changes to LibreGEO-Claude-Code.

## [0.1.0] — 2026-05-23

Initial release.

### Added
- 12 GEO skills covering the full AI-search optimization surface
  - `geo` — master orchestrator
  - `geo-audit` — full-website audit with parallel subagent delegation
  - `geo-citability` — AI citability scoring
  - `geo-content` — E-E-A-T content quality evaluation
  - `geo-crawlers` — AI crawler access analysis
  - `geo-llmstxt` — llms.txt validation + generation
  - `geo-platform-optimizer` — per-platform optimization (Google AI Overviews, ChatGPT, Perplexity, Gemini, Bing Copilot)
  - `geo-report` — Markdown report assembly
  - `geo-report-pdf` — ReportLab PDF generation
  - `geo-schema` — Schema.org JSON-LD audit + generation
  - `geo-technical` — Technical SEO + GEO checks
  - `geo-brand-mentions` — Brand presence across AI-cited platforms
- `setup.sh` installer
- README, QUICK_START, CONTRIBUTING, TROUBLESHOOTING
- Beginner / intermediate / advanced docs skeleton

### Pending
- Demo audits on real public sites (ormus.solutions + benchmark)
- Per-skill worked example documentation
- Tests for shell + Python skills
- VOICE_GUIDE on the report tone the bundle uses by default
