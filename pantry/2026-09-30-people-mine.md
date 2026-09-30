# People mine: LibreGEO-Claude-Code

What people who use the product said in its own public places: issues, issue comments, discussions, pull requests, and forks that changed something. Optional third pantry source; a product with no outside voices yet leaves the Hits table empty and says so.

## How this fills

1. List the product's own repos (the kitchen law names them).
2. Read what people outside the maintainers wrote since the last run: issues (the `feedback` label first), issue comments, discussions and their comments, pull requests, and forks with commits ahead of the default branch.
3. One row per voice. Quote a short snippet and link the exact issue, comment, discussion, PR or commit. Say whether they gave credit consent when the source has a consent box.
4. Tag each row with the capability it is about, in the same words as the competitor map's matrix, so the queue can cite it next to competitor and X rows.
5. Never count stars as feedback, never infer sentiment the person did not state, never paraphrase a number. Maintainers' own issues are not voices.
6. Save as `YYYY-MM-DD-people-mine.md` beside the other dated files (keep this TEMPLATE).

## Hits

No outside voices yet. Every issue, comment and pull request on the repo is by the maintainer, and the one fork has no commits ahead of `main`.

| Repo | Kind (bug/feature/question/praise/contribution) | Snippet | Link | Theme (matrix capability) | Credit consent |
|------|--------------------------------------------------|---------|------|---------------------------|----------------|
|  |  |  |  |  |  |

## Read log (what we read)

All reads on 2026-09-30 with `gh` against HermeticOrmus/LibreGEO-Claude-Code.

- Issues and pull requests, all states (`gh api "repos/HermeticOrmus/LibreGEO-Claude-Code/issues?state=all&per_page=100"`): #1 Release v1.0.0 (closed), #2 Release v1.0.0: installable libre-geo plugin (closed PR), #3 Open the kitchen (open), #4 Make /geo-audit --compare-with work, or document the real way to compare runs (open, `help wanted`). All four are by the maintainer, so none is a voice. #4 is cited in the competitor map as a known gap, not as feedback.
- Issues with the `feedback` label: none.
- Issue comments (`gh api repos/HermeticOrmus/LibreGEO-Claude-Code/issues/comments`): one, on #1, by the maintainer.
- Pull request review comments (`gh api repos/HermeticOrmus/LibreGEO-Claude-Code/pulls/comments`): none.
- Discussions: the repo has Discussions turned off (`has_discussions: false`); the GraphQL `discussions` count is 0.
- Forks (`gh api repos/HermeticOrmus/LibreGEO-Claude-Code/forks`): one, ASTRANARA/LibreGEO-Claude-Code. Compare `main...ASTRANARA:LibreGEO-Claude-Code:main` reports `ahead_by: 0`, `behind_by: 6`, so it changed nothing.
- Stars: not read as feedback.
