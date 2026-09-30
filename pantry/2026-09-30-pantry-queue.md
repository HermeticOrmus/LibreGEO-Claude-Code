# Pantry queue: LibreGEO-Claude-Code

## How this fills

1. Read the latest competitor map, X mine and people mine.
2. Propose 5 to 8 Goal atoms that answer their themes. The Menu needs at least 3.
3. Each atom needs a Done predicate someone else can check on this repo, a surface, the evidence rows it answers, and a confidence (high, medium or low).
4. Save as `YYYY-MM-DD-pantry-queue.md`; the Menu reads the newest one.
5. Retire an atom only with a bullet under "Explicitly not stocked" of the form `<Title>: shipped, PR #N` or `<Title>: parked, <reason>`.

## Atoms

Sources: [competitor map](2026-09-30-competitor-map.md), [X mine](2026-09-30-x-mine.md), [people mine](2026-09-30-people-mine.md) (no outside voices yet).

| # | Title | Done predicate | Surface | Evidence | Confidence |
|---|-------|----------------|---------|----------|------------|
| 1 | Docs show only options the skills read (`docs-real-flags`) | Every `--flag` written after `/geo-audit` in `QUICK_START.md`, `TROUBLESHOOTING.md` and `beginner/README.md` (today `--concurrency`, `--max-urls`) is either handled in `skills/geo-audit/SKILL.md` or replaced by the steps that work, leaving `--compare-with` to `geo-compare`; QUICK_START section 3 names the files the skills write, matching the Output Files table in `skills/geo/SKILL.md` (`GEO-AUDIT-REPORT.md`, not `./geo-audit-<slug>-<ts>/REPORT.md`); `claude plugin validate .` passes | repo | Map matrix row "Documented options match what the skills read" (Us N) | high |
| 2 | Port the upstream `geo-compare` skill for run-over-run deltas | `skills/geo-compare/SKILL.md` exists with `name` and `description` frontmatter; `NOTICE.md` lists it under "Derived from geo-seo-claude"; `claude plugin validate .` passes and `claude plugin details libre-geo@libre-geo` lists skill `geo-compare`; QUICK_START "Iterating" shows the command the skill takes; the PR pastes one comparison of two runs on a public site (this also meets the Done of #4) | repo | Map matrix row "Run-over-run comparison and history" (Upstream, CSEO, Codex, Auriti, Amazing and Otterly Y; Us N); Map row geo-seo-claude ("Ships `geo-compare`") | high |
| 3 | Test the bundled Python scripts in CI (`script-tests`) | `tests/` holds pytest tests for `score_passage` in `skills/geo/scripts/citability_scorer.py` and for `validate_llmstxt` in `skills/geo/scripts/llmstxt_generator.py`, using saved fixtures with `requests` mocked, so they need no network; `python -m pytest tests` passes; `.github/workflows/validate.yml` runs it on every pull request; the Testing section of `CONTRIBUTING.md` shows that command in place of `skills/geo-report-pdf/tests/`, which does not exist | repo | Map matrix row "Tests for the bundled scripts, run in CI" (CSEO "410 passing", Auriti "2,000+ tests", Codex "52 tests passing"; Us N) | high |
| 4 | Source or re-weight the FAQ checks (`faq-evidence`) | Each FAQ recommendation and score row in `skills/geo-platform-optimizer/platforms.md` (including "FAQ section with 5+ questions"), `skills/geo-audit/SKILL.md` ("Missing FAQ schema") and `skills/geo-schema/SKILL.md` (FAQPage) either links a dated primary source (Google Search Central or a published study) or is marked unverified with its weight lowered; the PR lists every changed row | repo | X mine rows HiTw93 (two complaints: "add FAQ to boost your score", "Don’t let scores drive your decisions"); Map row opc-skills `seo-geo` ("+40% AI visibility" for FAQPage, no source) | medium |
| 5 | Say who reads llms.txt, with sources (`llms-txt-evidence`) | `skills/geo-llmstxt/SKILL.md` has a dated "Who reads llms.txt" section that links a primary source for Google's position and for every engine it says reads the file; the llms.txt section of `TROUBLESHOOTING.md` links to it; `skills/geo-audit/SKILL.md` states what weight llms.txt carries in the GEO Score | repo | X mine rows rustybrick (Mueller: "no AI system currently uses llms.txt"), sengineland (Lighthouse check), kensavage (Lighthouse audit), codyschneider ("launched channel"); Map matrix row "llms.txt validation and generation" (CSEO note: "llms.txt is not currently a citation lever") | medium |
| 6 | Spanish QUICK_START (`quick-start-es`) | `QUICK_START.es.md` exists and the README Quick start links it; its fenced code blocks are byte-identical to those in `QUICK_START.md`, in the same order (a short script that extracts fenced blocks from both files prints no difference) | repo | X mine rows midudev (Spanish), CamilleRoux (French) and AiAircle34052 (Japanese) share GEO packs outside English; Map matrix row "Guides in languages other than English" (Us N) | medium |
| 7 | Link a source for every Market Context number (`market-sources`) | Each row of the Market Context table in `skills/geo/SKILL.md` links a primary source URL or says "unverified" in its Source cell; no row is sourced only as "Industry analysts", "Industry data" or "Industry surveys" | repo | Map matrix row "Claims and statistics carry a source" (Us P; CSEO and Auriti Y); X mine row codyschneider (skepticism of "AI Visibility Score" KPIs) | medium |

## Explicitly not stocked (and why)

- Live AI answer citation tracking (asking ChatGPT, Perplexity or Gemini through their APIs): the matrix shows the gap, but every working version needs paid API keys, so it is not an atom anyone can check for free.
- Keyword, SERP and backlink data: needs a paid data provider (DataForSEO, Ahrefs) or a Search Console account; out of scope for a free, local pack.
- Sample audits in `demo/`: already tracked under Pending in `CHANGELOG.md`; an audit of a named third-party site needs that owner's consent, so it is left to the maintainer.
