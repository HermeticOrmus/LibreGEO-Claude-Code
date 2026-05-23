# GEO glossary

Terms used throughout the LibreGEO skill bundle, defined once so the docs can stay tight.

## AI search engines

The five engines this kit currently optimizes for:

- **Google AI Overviews**: Google's AI-generated answer above the classic search results. Uses Google's index + Gemini.
- **ChatGPT web search**: OpenAI's search-augmented mode. Uses Bing's index under the hood.
- **Perplexity**: Standalone AI search engine. Source-citation forward.
- **Gemini**: Google's standalone AI assistant search mode. Uses Google index + Knowledge Graph.
- **Bing Copilot**: Microsoft's AI search mode integrated into Bing.

## Cite rate

The fraction of relevant queries for which an AI engine actually quotes or links to your site. The audit's composite score is predictive of cite rate but not equivalent to it — cite rate also depends on brand authority, recency, query competition.

## E-E-A-T

Experience, Expertise, Authoritativeness, Trustworthiness. Google's quality signals (extended from E-A-T to add Experience in 2022). AI search engines weight these heavily for citation eligibility.

## GEO

Generative Engine Optimization. The practice of optimizing content for AI search engines, in contrast to (or alongside) classic SEO.

## INP

Interaction to Next Paint. The Core Web Vitals metric that replaced First Input Delay (FID) in March 2024. Measures responsiveness to user input.

## JSON-LD

JavaScript Object Notation for Linked Data. The preferred Schema.org markup format for AI search engines. Embedded in `<script type="application/ld+json">` tags.

## Knowledge Graph entity

An entity (person, organization, place, concept) that has a node in Google's Knowledge Graph. Pages associated with KG entities are cited more frequently. `sameAs` links to Wikipedia / Wikidata are the primary signal.

## llms.txt

Emerging standard for AI-friendly content disclosure. A Markdown file at the site root that lists the site's highest-value content for AI crawlers. Analogous to `sitemap.xml` but designed for LLM consumption rather than crawler indexing.

## Speakable schema

A Schema.org property that identifies which parts of a page are suitable for text-to-speech reading (used by voice assistants). Subset of Article + WebPage schemas.

## SSR / SSG / CSR

- **SSR**: Server-side rendering. HTML generated per-request on the server.
- **SSG**: Static-site generation. HTML generated at build time.
- **CSR**: Client-side rendering. HTML rendered in the browser via JS.

AI crawlers reliably read SSR + SSG. CSR support is partial and unreliable; assume invisible.

## User-agent

The string an HTTP client sends to identify itself. The major AI crawler UAs:

- `GPTBot` — OpenAI's training crawler
- `ChatGPT-User` — OpenAI's per-query crawler (used during ChatGPT web search)
- `ClaudeBot` — Anthropic's crawler
- `PerplexityBot` — Perplexity's crawler
- `Google-Extended` — Google's AI training crawler (separate from `Googlebot`)
- `CCBot` — Common Crawl's crawler (used by many AI training pipelines)
- `Bytespider` — ByteDance's crawler
- `anthropic-ai` — older Anthropic crawler identifier
