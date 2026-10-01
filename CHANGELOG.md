# Changelog

All notable changes to LibreGEO-Claude-Code.

## [1.1.0] - 2026-09-30

### Added
- A public pantry in `pantry/`: a competitor map, an X mine, a people mine, and a pantry queue of Goal atoms, each with a Done-when anyone can check. `pantry/MENU.md` is generated from the queue by the kitchen's `menu.py` and names one atom as up next.
- Two issue forms: `routing-miss` (Claude picked the wrong skill or agent, or none) and `plugin-proposal` (a new skill, agent or command), with matching labels.
- A "Ways to contribute" section at the top of `CONTRIBUTING.md` (Menu items, routing misses, proposals, translations, sharing what you built, and the local test loop) and a Contribute section in the README.
- Grok Build support. Grok Build reads `.claude-plugin/plugin.json` as it is, and the repo root is the plugin, so `grok plugin install HermeticOrmus/LibreGEO-Claude-Code` installs all 12 skills and 5 agents with no marketplace file. A `grok` CI job validates the plugin with `grok plugin validate`, installs it into a clean Grok home, and runs `scripts/sync-grok-manifest.py --check`, which fails if a Grok marketplace file ever appears for this single-plugin repo.
- `./setup.sh --grok` installs through the Grok Build CLI instead of Claude Code, with the same `--only`, `--list`, and `--uninstall` options.
- `LEDGER.md`, the kintsugi ledger: every crack the 1.0.0 release found and sealed, with its evidence, and the cracks still open.

## [1.0.0] - 2026-09-30

This release makes LibreGEO a Claude Code plugin. The 12 skills install as one plugin, `libre-geo`, from Claude Code itself or from `setup.sh`, and Claude routes to them from sharper descriptions.

### Added
- `.claude-plugin/plugin.json` at the repo root (plugin `libre-geo`) and `.claude-plugin/marketplace.json` (marketplace `libre-geo`, one entry with `"source": "./"`). Install with `/plugin marketplace add HermeticOrmus/LibreGEO-Claude-Code`, then `/plugin install libre-geo@libre-geo`. Every file stays where it was.
- CI (`.github/workflows/validate.yml`) that validates the marketplace and plugin manifests, checks that every `SKILL.md` has `name` and `description` frontmatter, and installs the plugin into a clean config, on every push to main and every pull request.
- A feedback issue form and a Feedback section in the README.
- The five subagents the `geo` skill delegates to (`geo-ai-visibility`, `geo-content`, `geo-platform-analysis`, `geo-schema`, `geo-technical`) under `agents/`. The skill referenced them, but the repository did not ship them, so full audits could not fan out. They come unchanged from geo-seo-claude.
- `NOTICE.md` and an Acknowledgments section crediting geo-seo-claude by Zubair Trabzada (MIT), plus the upstream copyright line in `LICENSE`.

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
