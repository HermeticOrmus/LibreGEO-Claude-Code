# Contributing

Bug reports, new platform support, schema additions, and regional GEO patterns are all welcome. The AI-search landscape moves fast; this repo will move with it.

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
