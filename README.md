<p align="center">
  <img src="https://ormus.solutions/mascot/chain_braces_to_swan.gif" alt="LibreGEO Claude Code" width="128" style="image-rendering: pixelated;" />
</p>

<h1 align="center">LibreGEO Claude Code</h1>

<p align="center">
  <em>GEO-first SEO for Claude Code — 12 specialized skills for AI search optimization</em>
</p>

<p align="center">
  <a href="https://github.com/HermeticOrmus/LibreGEO-Claude-Code/stargazers"><img src="https://img.shields.io/github/stars/HermeticOrmus/LibreGEO-Claude-Code?style=flat-square&color=aa8142" alt="Stars" /></a>
  <a href="https://github.com/HermeticOrmus/LibreGEO-Claude-Code/blob/main/LICENSE"><img src="https://img.shields.io/github/license/HermeticOrmus/LibreGEO-Claude-Code?style=flat-square&color=aa8142" alt="License" /></a>
  <a href="https://github.com/HermeticOrmus/LibreGEO-Claude-Code/commits"><img src="https://img.shields.io/github/last-commit/HermeticOrmus/LibreGEO-Claude-Code?style=flat-square&color=aa8142" alt="Last Commit" /></a>
  <img src="https://img.shields.io/badge/Python-aa8142?style=flat-square&logo=python&logoColor=white" alt="Python" />
  <img src="https://img.shields.io/badge/Claude_Code-aa8142?style=flat-square&logo=anthropic&logoColor=white" alt="Claude Code" />
</p>

---

> **Skills, agents, commands, and workflows for optimizing websites for AI search engines using Claude Code.**

Google sends fewer clicks every quarter. ChatGPT, Perplexity, Gemini, Claude, and Bing Copilot are now the front door for an increasing share of how people find things. Optimizing only for Google's classic search index leaves the AI-search lane unaddressed. **LibreGEO is the toolkit for the AI-search lane, designed natively for Claude Code.**

---

## The shift this kit responds to

Andrej Karpathy framed the broader change in December 2025:

> *"I've never felt this much behind as a programmer. The profession is being dramatically refactored."*
>
> *"New vocabulary: agents, subagents, their prompts, contexts, memory, modes, permissions, tools, plugins, skills, hooks, MCP, LSP, slash commands, workflows, IDE integrations..."*

The same refactor is happening to search. The user's question used to land on a Google SERP. Today it lands inside an AI assistant's answer, which cites zero, one, or two pages. If your page isn't cite-worthy by AI standards, it doesn't exist for that question.

**LibreGEO gives you the Claude Code skills to make your pages cite-worthy.**

### Where LibreGEO fits in the Claude Code stack

| Claude Code component | LibreGEO provides |
|---|---|
| **Skills** | 12 specialized skills covering every layer of GEO + technical SEO |
| **Commands** | `/geo`, `/geo-audit`, `/geo-citability`, `/geo-schema`, `/geo-llmstxt`, etc. |
| **Workflows** | Beginner → intermediate → advanced learning paths |
| **Templates** | llms.txt scaffolds, JSON-LD schema generators, audit report templates |
| **Reports** | Client-ready GEO reports (Markdown + PDF) generated from real audits |

This isn't a prompt library. It is infrastructure for AI-search optimization that runs inside the Claude Code agent loop.

---

## What's included

```
LibreGEO-Claude-Code/
├── 12 specialized skills    # one per GEO/SEO axis
├── 3 skill tiers            # beginner / intermediate / advanced
├── demo audits              # full sample runs on real sites
├── templates                # llms.txt, JSON-LD, report templates
└── resources                # platform docs, glossary, references
```

---

## The 12 skills

Each skill is a self-contained, agent-callable module. Install once via `setup.sh`, then invoke from any Claude Code session.

### Discoverability

| Skill | What it does |
|---|---|
| **`/geo`** | Master orchestrator. Routes to the right sub-skill based on the question. Use this when you don't know which specialist to call. |
| **`/geo-audit`** | Full-website GEO+SEO audit with parallel subagent delegation. Composite score (0-100) + prioritized action plan. |
| **`/geo-citability`** | Scores how likely AI systems are to cite or quote passages from a page. Returns rewrite suggestions for unciteable content. |

### Crawlability + access

| Skill | What it does |
|---|---|
| **`/geo-crawlers`** | Audits AI crawler access. Checks `robots.txt`, meta tags, and HTTP headers for GPTBot, ClaudeBot, PerplexityBot, Google-Extended, and CCBot. |
| **`/geo-llmstxt`** | Validates existing `llms.txt` files; generates new ones from scratch by crawling the site. Follows the emerging llms.txt standard for AI-friendly content disclosure. |
| **`/geo-technical`** | Technical SEO with GEO-specific checks — crawlability, indexability, security headers, Core Web Vitals (INP), mobile, server-side rendering, JS-dependency. |

### Content + authority

| Skill | What it does |
|---|---|
| **`/geo-content`** | Content quality + E-E-A-T evaluation. Scores Experience, Expertise, Authoritativeness, Trustworthiness against AI citation patterns. |
| **`/geo-brand-mentions`** | Brand presence scanner across AI-cited platforms. Returns where the brand is and isn't being mentioned. |
| **`/geo-schema`** | Schema.org structured data audit + generation. JSON-LD preferred. Focused on the schemas that move AI discoverability (Organization, Person, Article, sameAs, speakable). |

### Per-platform optimization

| Skill | What it does |
|---|---|
| **`/geo-platform-optimizer`** | Platform-specific tuning for Google AI Overviews, ChatGPT web search, Perplexity, Gemini, Bing Copilot. |

### Reporting

| Skill | What it does |
|---|---|
| **`/geo-report`** | Assembles a client-ready GEO report (Markdown) combining audit results, scores, findings, and prioritized actions. |
| **`/geo-report-pdf`** | Renders the GEO report as a polished PDF using ReportLab — score gauges, bar charts, platform readiness visualizations, color-coded action tables. |

---

## Quick start

```bash
# Clone the repo
git clone https://github.com/HermeticOrmus/LibreGEO-Claude-Code.git ~/projects/LibreGEO-Claude-Code

# Install the 12 skills into your Claude Code config
cd ~/projects/LibreGEO-Claude-Code
./setup.sh
```

Then in any Claude Code session:

```
/geo-audit https://your-site.com
```

The audit takes 2-5 minutes depending on site size. Output: a composite GEO score, per-axis breakdown, and a prioritized action plan. See [QUICK_START.md](QUICK_START.md) for the full walkthrough.

---

## Skill tiers

The repo is structured by skill level. Pick your entry point:

### Beginner — *"Is my site visible to AI search?"*

You have a site. You want to know whether AI assistants cite it. Run one command, get one number, get one action plan.

→ [`beginner/`](beginner/)

### Intermediate — *"Optimize a deployed site for AI search"*

You ran an audit, scored 50/100, and want to know what to fix first. The skill bundle takes you through the high-ROI moves in order.

→ [`intermediate/`](intermediate/)

### Advanced — *"Engineer pages for ChatGPT / Perplexity / Gemini citation"*

You ship at scale and want repeatable patterns. Per-platform optimization, llms.txt at multi-subdomain scale, schema graphs that maintain consistency across hundreds of pages.

→ [`advanced/`](advanced/)

---

## Sample audits

Real audits run with the skill bundle, included as worked examples:

- [`demo/ormus-solutions-audit/`](demo/) — full audit of [ormus.solutions](https://ormus.solutions), all artifacts (Markdown report, PDF report, raw JSON, screenshots)
- [`demo/public-benchmark-audit/`](demo/) — audit of a neutral public site, used as the reference for what 60–80/100 looks like in practice

Both directories contain reproducible commands so you can re-run the audit and compare your delta over time.

---

## Why GEO needs its own toolkit

Classic SEO optimizes for crawl → index → rank. AI search optimizes for crawl → cite. The mechanics overlap but the priorities diverge:

| Classic SEO | GEO (AI search) |
|---|---|
| Backlinks dominate | Brand mentions in trusted contexts dominate |
| Title + meta description tuning | First-paragraph factual density + speakable schema |
| Schema as a nice-to-have | Schema as the cite-target |
| Rendered HTML for crawlers | SSR/static HTML for AI crawlers that don't run JS |
| `robots.txt` gates Googlebot | `robots.txt` + `llms.txt` gate AI crawlers separately |
| Core Web Vitals affect ranking | Core Web Vitals affect ranking + INP replaces FID |

Skills in this repo address both lanes, with the GEO priorities elevated.

---

## Compatibility

- **Claude Code**: 1.x+
- **Python**: 3.10+ (for `geo-report-pdf` ReportLab integration)
- **OS**: Linux / macOS / Windows (WSL2 tested)
- **License**: MIT

The skills make HTTP requests to your target site only. No data leaves your machine.

---

## Contributing

PRs welcome. See [CONTRIBUTING.md](CONTRIBUTING.md) for the contribution model — fork, branch, tested skill change, commit message format, PR template.

Issues for: bugs, new platform support (e.g., when a new AI search engine launches), schema additions, regional GEO patterns (the AI-search landscape outside English is under-served right now).

---

## Part of the Libre Open-Source Stack for Claude Code

This repository is part of a growing family of open-source toolkits for Claude Code, each focused on a specific lane:

- [LibreUIUX-Claude-Code](https://github.com/HermeticOrmus/LibreUIUX-Claude-Code) — UI/UX development (152 agents, 70 plugins, 76 commands, 74 skills)
- [LibreArch-Claude-Code](https://github.com/HermeticOrmus/LibreArch-Claude-Code) — Software architecture and system design
- [LibreCopy-Claude-Code](https://github.com/HermeticOrmus/LibreCopy-Claude-Code) — Technical writing and documentation engineering
- [LibreDevOps-Claude-Code](https://github.com/HermeticOrmus/LibreDevOps-Claude-Code) — DevOps engineering and infrastructure automation
- [LibreEmbed-Claude-Code](https://github.com/HermeticOrmus/LibreEmbed-Claude-Code) — Embedded systems, firmware, and IoT development
- [LibreFinTech-Claude-Code](https://github.com/HermeticOrmus/LibreFinTech-Claude-Code) — Financial technology development
- [LibreGameDev-Claude-Code](https://github.com/HermeticOrmus/LibreGameDev-Claude-Code) — Game development across Godot, Unity, Unreal
- [LibreMLOps-Claude-Code](https://github.com/HermeticOrmus/LibreMLOps-Claude-Code) — ML engineering and AI operations
- [LibreMobileDev-Claude-Code](https://github.com/HermeticOrmus/LibreMobileDev-Claude-Code) — Mobile app development (Flutter, React Native, native iOS, native Android)
- [LibreSecOps-Claude-Code](https://github.com/HermeticOrmus/LibreSecOps-Claude-Code) — Security operations

Star the family, not just one — that's how the suite stays coherent.
