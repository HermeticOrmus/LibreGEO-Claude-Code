# Changelog

All notable changes to LibreGEO-Claude-Code.

## [1.0.0] - 2026-09-30

This release makes LibreGEO a Claude Code plugin. The 12 skills install as one plugin, `libre-geo`, from Claude Code itself or from `setup.sh`, and Claude routes to them from sharper descriptions.

### Added
- `.claude-plugin/plugin.json` at the repo root (plugin `libre-geo`) and `.claude-plugin/marketplace.json` (marketplace `libre-geo`, one entry with `"source": "./"`). Install with `/plugin marketplace add HermeticOrmus/LibreGEO-Claude-Code`, then `/plugin install libre-geo@libre-geo`. Every file stays where it was.
- CI (`.github/workflows/validate.yml`) that validates the marketplace and plugin manifests, checks that every `SKILL.md` has `name` and `description` frontmatter, and installs the plugin into a clean config, on every push to main and every pull request.
- A feedback issue form and a Feedback section in the README.

### Changed
- `setup.sh` installs through the Claude Code CLI instead of copying folders into `~/.claude/skills`. It supports `--list`, `--scope`, and `--uninstall`, still accepts `--skills-dir` (it prints a note), and names any skill folders left by the old installer, with the command to remove them.
- Every skill description now says what the skill produces and when to use it, so the master `geo` skill takes open-ended questions and bare URLs, `geo-audit` takes whole-site audits, and each specialist names the question it answers. Only the `description` field changed.
- README, QUICK_START, TROUBLESHOOTING, and CONTRIBUTING describe the plugin install, the namespaced skill form (`/libre-geo:geo-audit`), and the Python dependencies. The sample audits section says plainly that `demo/` is not in this release.

### Fixed
- `/geo report-pdf` and `geo-report-pdf` pointed at `~/.claude/skills/geo/scripts/generate_pdf_report.py`, which only exists after the old copy install. Both now use `${CLAUDE_SKILL_DIR}`, so the script is found wherever the plugin is installed.
- TROUBLESHOOTING no longer suggests a `setup.sh --with-python-deps` flag that never existed; it points to `pip install -r skills/geo/requirements.txt`.

### Upgrading from 0.1.0
- Install the plugin (`/plugin install libre-geo@libre-geo` or `./setup.sh`), restart Claude Code, then remove the old copies in `~/.claude/skills/` so each skill loads once. `./setup.sh` prints the exact folders.
- Skill names are unchanged. If a name collides with another installed skill, call the namespaced form, for example `/libre-geo:geo-audit`.

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
