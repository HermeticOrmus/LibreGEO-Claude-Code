# Menu: LibreGEO-Claude-Code

Queue: 2026-09-30-pantry-queue.md
Counts: open 7, in flight 0, shipped 0, parked 0, dropped 0, needs fixing 0

## Steer

- none

## Up next

**docs-real-flags**: Docs show only options the skills read (`docs-real-flags`) (queue #1, high, repo, since 2026-09-30)

- Done when: Every `--flag` written after `/geo-audit` in `QUICK_START.md`, `TROUBLESHOOTING.md` and `beginner/README.md` (today `--concurrency`, `--max-urls`) is either handled in `skills/geo-audit/SKILL.md` or replaced by the steps that work, leaving `--compare-with` to `geo-compare`; QUICK_START section 3 names the files the skills write, matching the Output Files table in `skills/geo/SKILL.md` (`GEO-AUDIT-REPORT.md`, not `./geo-audit-<slug>-<ts>/REPORT.md`); `claude plugin validate .` passes
- Verify on: repo
- Evidence: Map matrix row "Documented options match what the skills read" (Us N)
- Issue: none yet (promote after merge)
- Order: docs-real-flags, geo-compare, script-tests, faq-evidence, llms-txt-evidence, market-sources, quick-start-es
- Tie: docs-real-flags over geo-compare, script-tests, by key order (jev off)

## Atoms

| Key | Title | State | Confidence | Class | Since | Queue # | Issue | Because |
|-----|-------|-------|------------|-------|-------|---------|-------|---------|
| docs-real-flags | Docs show only options the skills read (`docs-real-flags`) | open | high | repo | 2026-09-30 | 1 | - | - |
| faq-evidence | Source or re-weight the FAQ checks (`faq-evidence`) | open | medium | repo | 2026-09-30 | 4 | - | - |
| geo-compare | Port the upstream `geo-compare` skill for run-over-run deltas | open | high | repo | 2026-09-30 | 2 | #4 | - |
| llms-txt-evidence | Say who reads llms.txt, with sources (`llms-txt-evidence`) | open | medium | repo | 2026-09-30 | 5 | - | - |
| market-sources | Link a source for every Market Context number (`market-sources`) | open | medium | repo | 2026-09-30 | 7 | - | - |
| quick-start-es | Spanish QUICK_START (`quick-start-es`) | open | medium | repo | 2026-09-30 | 6 | - | - |
| script-tests | Test the bundled Python scripts in CI (`script-tests`) | open | high | repo | 2026-09-30 | 3 | - | - |

## Retired

| Key | Title | State | Since | Issue | Because |
|-----|-------|-------|-------|-------|---------|
| none | | | | | |

## Notes

- none
