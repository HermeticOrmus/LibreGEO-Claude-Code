# Contributing

Bug reports, new platform support, schema additions, and regional GEO patterns are all welcome. The AI-search landscape moves fast; this repo will move with it.

## Ways to contribute

### Take a Menu item

[`pantry/MENU.md`](pantry/MENU.md) lists the next pieces of work, each with a Done-when anyone can check, and names one as up next. The research behind it lives in [`pantry/`](pantry/). Open items are also filed as issues with the [`menu` label](https://github.com/HermeticOrmus/LibreGEO-Claude-Code/issues?q=is%3Aopen+label%3Amenu), and smaller ones show up under [good first issues](https://github.com/HermeticOrmus/LibreGEO-Claude-Code/contribute). To claim one, comment on the issue that you are taking it, then open a pull request that says `Closes #N`.

### Report or fix a routing miss

Every skill and agent has a `description` that tells Claude when to use it. When Claude picks the wrong one, or none, for a GEO or SEO question, open a [routing miss](https://github.com/HermeticOrmus/LibreGEO-Claude-Code/issues/new?template=routing-miss.yml) with the prompt you used. The fix is usually a sharper `description` in `skills/<name>/SKILL.md` or `agents/<name>.md`, which makes it a good first pull request.

### Propose or build a skill or agent

Open a [plugin proposal](https://github.com/HermeticOrmus/LibreGEO-Claude-Code/issues/new?template=plugin-proposal.yml) first, so the job it does and its Done-when are agreed before you build. This repo is one plugin, `libre-geo`, so new work goes inside it:

```text
.claude-plugin/plugin.json      the libre-geo plugin (name, version, description); update the skill count in its description
.claude-plugin/marketplace.json the libre-geo marketplace, one entry with "source": "./"; keep its description in step with plugin.json
skills/<name>/SKILL.md          a skill; frontmatter: name, description (what it produces and when to use it)
agents/<name>.md                a subagent; frontmatter: name, description, allowed-tools
```

The skills are also the slash commands (`/geo-audit`, `/libre-geo:geo-audit`), so there is no `commands/` folder. Reference files a skill ships with through `${CLAUDE_SKILL_DIR}`, and credit anything derived from another project in `NOTICE.md`. A separate plugin with its own `plugins/<name>/.claude-plugin/plugin.json` and its own marketplace entry is a bigger change: say so in the proposal.

### Translate

The docs are English only, and AI search outside English is under-served. Translations of `QUICK_START.md` and the `beginner/`, `intermediate/` and `advanced/` guides are welcome, as `QUICK_START.<lang>.md` or `<folder>/README.<lang>.md`. Keep every command and code block identical to the English file.

### Share what you built

Audited a site, wrote a schema template, or wired LibreGEO into your own workflow? Post it in [Discussions](https://github.com/HermeticOrmus/LibreGEO-Claude-Code/discussions) under Show and tell, or send it as a [feedback issue](https://github.com/HermeticOrmus/LibreGEO-Claude-Code/issues/new?template=feedback.yml).

### Test your change locally

Load the plugin from your clone for one session, without installing it:

```bash
claude --plugin-dir .
```

Validate the marketplace and the plugin manifest:

```bash
claude plugin validate .
claude plugin validate .claude-plugin/plugin.json
```

Install it into a clean, throwaway config, the way a new user would, and check that your skill or agent is listed:

```bash
export CLAUDE_CONFIG_DIR=$(mktemp -d)
claude plugin marketplace add ./
claude plugin install libre-geo@libre-geo
claude plugin details libre-geo@libre-geo
```

CI runs the same checks on every pull request (both validations, the `SKILL.md` frontmatter check, and the clean-config install). A second `grok` job validates the plugin with `grok plugin validate`, installs it into a clean Grok Build home, and checks that no `.grok-plugin/marketplace.json` exists: the repo root is the plugin, so Grok installs it directly and needs no marketplace file. If this is your first contribution, the CI run waits until a maintainer approves it.

## What we accept

- **Bug fixes** in any of the 12 skills
- **New platform support** when a new AI search engine launches (DeepSeek search, Mistral search, etc.)
- **Schema additions** for content types the bundle doesn't cover yet
- **Regional GEO patterns** — AI-search behavior outside English is under-served; PRs from non-English-market practitioners especially welcome
- **Reproducible audit demos** of real sites under permissive license
- **Documentation improvements** including better beginner / intermediate / advanced walkthroughs

## What we don't accept

- Closed-source dependencies in the core skills (MIT-compatible only)
- Skills that require an API key without a free tier
- Black-hat tactics (cloaking, doorway pages, hallucinated authorship)
- PR with no tests or no example demonstrating the change works

## Setup

```bash
git clone https://github.com/<your-username>/LibreGEO-Claude-Code.git
cd LibreGEO-Claude-Code
./setup.sh
```

Make changes, run the affected skill against a real site to verify, then submit.

Before opening a PR, run `claude plugin validate .` and `claude plugin validate .claude-plugin/plugin.json`. CI runs both, checks that every `skills/*/SKILL.md` has `name` and `description` frontmatter, and installs the plugin into a clean config. Reference files that ship with a skill by `${CLAUDE_SKILL_DIR}` (Claude Code replaces it with the skill's folder), never by a path under `~/.claude`.

## Branch + PR workflow

```
git checkout -b feat/<slug>      # new skill / new feature
git checkout -b fix/<slug>       # bug fix
git checkout -b docs/<slug>      # docs only
```

Commit messages: `type(scope): description` — e.g., `feat(schema): add HowTo + FAQPage generators`.

PR template (filled in automatically):

```markdown
## Why
<one-line motivation>

## What changed
<bulleted list of concrete changes>

## How to test
<exact command(s) reviewers can run, including the URL to audit if applicable>

## Notes
<perf trade-offs, follow-ups, related issues>
```

## Skill-authoring conventions

Each skill lives in `skills/<name>/` with:

- `SKILL.md` — the frontmatter-headed entry document (`name:`, `description:`)
- `<runner>.sh` or `<runner>.py` — the executable
- `templates/` — any output templates the skill uses
- `examples/` — at least one worked example per skill

The frontmatter description must include **when to use the skill**, not just what it does. The skill loader reads this for auto-routing.

## Testing

For Python skills (e.g., `geo-report-pdf`):

```bash
cd skills/geo-report-pdf
python -m pytest tests/
```

For shell skills:

```bash
skills/<skill-name>/<runner>.sh <test-url>
# Inspect the output report manually.
```

## Code of conduct

Be kind. Ship value. Don't gatekeep. The AI-search landscape is changing too fast for in-fighting to be the bottleneck.

## License

By submitting a PR you agree your contribution is licensed under the same MIT license as the project. No CLA, no separate paperwork.
