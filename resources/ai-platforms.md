# AI platforms reference

Per-platform docs, crawler user-agents, citation patterns, and update cadence.

## Google AI Overviews

- **Launched**: May 2024 (rolled to general availability March 2025)
- **Crawler UAs**: `Googlebot` (classic) + `Google-Extended` (AI training)
- **Index**: Google's primary search index
- **Citation pattern**: AI Overview at top of SERP; cites 2-4 sources
- **Update cadence**: real-time index, weeks for AI Overview-specific behavior to update
- **Docs**: [https://developers.google.com/search/docs](https://developers.google.com/search/docs)

## ChatGPT web search

- **Launched**: November 2023 (originally "Browse with Bing"; rebranded ChatGPT search 2024)
- **Crawler UAs**: `GPTBot`, `ChatGPT-User`, `OAI-SearchBot`
- **Index**: Bing's index (via partnership)
- **Citation pattern**: inline numbered citations linking to source pages
- **Update cadence**: Bing index refresh (hours to days); ChatGPT search behavior updated by OpenAI on opaque cadence
- **Docs**: [https://platform.openai.com/docs/bots](https://platform.openai.com/docs/bots)

## Perplexity

- **Launched**: August 2022
- **Crawler UAs**: `PerplexityBot`, `Perplexity-User`
- **Index**: own index + partnerships
- **Citation pattern**: numbered citations + a "Sources" panel
- **Update cadence**: relatively fast (days to weeks for new content to be cited)
- **Docs**: [https://docs.perplexity.ai/](https://docs.perplexity.ai/)

## Google Gemini

- **Launched**: December 2023 (formerly Bard)
- **Crawler UAs**: `Google-Extended`, `Googlebot`
- **Index**: Google's index + Knowledge Graph
- **Citation pattern**: variable — sometimes inline links, sometimes hidden sources
- **Update cadence**: Google's index refresh
- **Docs**: see Google AI Overviews

## Bing Copilot

- **Launched**: February 2023 (originally "Bing Chat")
- **Crawler UAs**: `bingbot`
- **Index**: Bing's primary index
- **Citation pattern**: inline citations + source list
- **Update cadence**: Bing index refresh
- **Docs**: [https://www.bing.com/webmasters](https://www.bing.com/webmasters)

## Crawler user-agent summary

| User-agent | Operator | Purpose |
|---|---|---|
| `GPTBot` | OpenAI | Training crawler |
| `ChatGPT-User` | OpenAI | Per-query crawler during ChatGPT search |
| `OAI-SearchBot` | OpenAI | Search-specific crawler |
| `ClaudeBot` | Anthropic | Training crawler |
| `anthropic-ai` | Anthropic | Legacy identifier |
| `PerplexityBot` | Perplexity | Training + search crawler |
| `Perplexity-User` | Perplexity | Per-query crawler |
| `Google-Extended` | Google | AI training crawler (Gemini, AI Overviews) |
| `Googlebot` | Google | Classic + AI Overview source crawler |
| `bingbot` | Microsoft | Classic + ChatGPT search source crawler |
| `CCBot` | Common Crawl | Training data feed for many AI pipelines |
| `Bytespider` | ByteDance | Training crawler (used by Doubao + others) |

## Allow/block decision matrix

You don't have to allow every bot. Common patterns:

- **Allow all** (default for marketing sites that want AI citation maximally)
- **Block training crawlers, allow per-query** (e.g., block `GPTBot` but allow `ChatGPT-User` — get cited without training data contribution)
- **Block everything** (rare; only if content is genuinely sensitive)

The `/geo-crawlers` skill audits which bots are allowed and proposes an opinionated `robots.txt` based on your stated policy.

## Disclaimer

The AI search landscape is changing fast. Last refreshed: 2026-05. Verify current crawler UAs against each platform's official docs before making blocking decisions.
