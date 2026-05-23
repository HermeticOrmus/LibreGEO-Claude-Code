# Platform Reference — Why Each Matters + Scoring Rubrics

Per-platform rationale, what to check, and 0-100 scoring rubric. Scoring values are calibrated — do not modify.

---

## 1. YouTube — Correlation ~0.737 (STRONGEST)

**Why it matters:** 2.5B+ monthly users. AI training datasets heavily incorporate YouTube transcripts, descriptions, metadata. Gemini and AI Overviews reference YouTube content directly. Perplexity and ChatGPT both index and cite YouTube video content. Transcripts are particularly valuable — natural-language mentions in conversational context align with how AI models generate text.

**What to check:**
- Brand YouTube channel — active? subscriber count? video count? upload frequency?
- Third-party video mentions — other channels mentioning brand (reviews, tutorials, comparisons)
- Brand name in video descriptions of industry-relevant content
- Brand mentioned in spoken content of relevant videos (transcripts are indexed)
- YouTube search presence for `[brand name]` — results positive?
- Comment mentions on relevant industry videos

**Scoring (0-100):**

| Score | Criteria |
|---|---|
| 90-100 | Active channel with 10K+ subscribers, regular uploads, brand mentioned in 20+ third-party videos, appears in YouTube search results for industry terms |
| 70-89 | Active channel with 1K+ subscribers, brand mentioned in 10-19 third-party videos, some YouTube search presence |
| 50-69 | Channel exists with some content, brand mentioned in 5-9 third-party videos, limited YouTube search presence |
| 30-49 | Channel exists but inactive, brand mentioned in 1-4 third-party videos |
| 10-29 | No channel or empty channel, brand mentioned in 1-2 videos only |
| 0-9 | No YouTube presence whatsoever |

---

## 2. Reddit — High Correlation

**Why it matters:** Heavily indexed in AI training data (Google's $60M/year Reddit licensing deal, 2024). AI weights Reddit heavily for product recommendations, comparisons, sentiment. "Reddit" appended to ~10-15% of Google searches by users seeking authentic opinions. Perplexity cites Reddit threads frequently. ChatGPT and Claude reference Reddit discussions for product/service questions.

**What to check:**
- Subreddit presence — which ones, how often discussed
- Mention volume + trend (increasing/decreasing)
- Sentiment — mostly positive/negative/neutral, common praise/complaints
- Official presence — official account, AMAs, participation
- Recommendation threads — appears in "What do you recommend for X?" threads, top recommendation or also-ran?
- Own subreddit — exists? active? member count?

**Scoring (0-100):**

| Score | Criteria |
|---|---|
| 90-100 | Frequently recommended in relevant subreddits, predominantly positive sentiment, active official presence, own subreddit with 5K+ members, appears in top recommendations for industry queries |
| 70-89 | Regularly mentioned in relevant subreddits, mostly positive sentiment, some official presence, appears in multiple recommendation threads |
| 50-69 | Mentioned in several relevant threads, mixed sentiment, brand name is recognized by community members |
| 30-49 | Occasional mentions, limited to 1-2 subreddits, no official presence |
| 10-29 | Rare mentions, brand largely unknown on Reddit |
| 0-9 | No Reddit presence |

---

## 3. Wikipedia / Wikidata — High Correlation

**Why it matters:** Highest-authority source in AI training data — all major AI models trained on Wikipedia dumps. AI uses Wikipedia as primary source for entity recognition (is this brand a "real" entity?). Wikidata provides machine-readable facts for knowledge graph construction. A Wikipedia page is a strong notability signal that correlates with AI treating the brand as authoritative.

**What to check:**
- Wikipedia article for brand/company — exists? marked for deletion or quality issues?
- Founder/CEO Wikipedia page (strong authority signal)
- Brand's website cited as reference in other Wikipedia articles
- Wikidata item (Q-number) — exists? complete properties?
- Brand mentioned in other Wikipedia articles (industry, competitor, category pages)
- Article quality — stub, start-class, or higher

**Scoring (0-100):**

| Score | Criteria |
|---|---|
| 90-100 | Detailed Wikipedia article (B-class or higher), Wikidata entry with complete properties, brand cited as reference in multiple articles, founder has Wikipedia page |
| 70-89 | Wikipedia article exists (start-class or higher), Wikidata entry exists, brand mentioned in 2+ other Wikipedia articles |
| 50-69 | Wikipedia article exists (stub or start), basic Wikidata entry, limited mentions in other articles |
| 30-49 | No Wikipedia article but brand is mentioned in other articles or cited as reference; Wikidata entry may exist |
| 10-29 | Brand mentioned in 1-2 Wikipedia articles as a passing reference only |
| 0-9 | No Wikipedia or Wikidata presence of any kind |

---

## 4. LinkedIn — Moderate Correlation

**Why it matters:** Increasingly indexed by AI for professional/B2B context. Company pages + employee thought leadership build brand entity signals. AI references LinkedIn for company info, team credentials, professional authority. Articles and posts are indexed by search engines and AI crawlers.

**What to check:**
- Company page — exists? follower count? post frequency?
- Employee thought leadership — leadership posting that mentions brand
- Third-party mentions — industry analysts, customers posting about brand
- Long-form LinkedIn articles about or mentioning the brand
- Employee profiles — list the company with detail, strong professional profiles
- Engagement metrics on company posts

**Scoring (0-100):**

| Score | Criteria |
|---|---|
| 90-100 | Active company page with 10K+ followers, leadership regularly posts thought leadership, brand frequently mentioned by industry professionals, strong employee profiles |
| 70-89 | Active company page with 5K+ followers, some employee thought leadership, occasional third-party mentions |
| 50-69 | Company page exists with 1K+ followers, irregular posting, limited third-party mentions |
| 30-49 | Company page exists but is sparse or inactive, few followers, no third-party mentions |
| 10-29 | Basic company page with minimal information |
| 0-9 | No LinkedIn company page |

---

## 5. Other Platforms — Supplementary (15% weight total)

Lower but meaningful correlation. Score collectively 0-100 based on presence and quality across these:

| Platform | Relevance | What to Check | Signal Strength |
|---|---|---|---|
| **Quora** | Answers in AI training data; cited by Perplexity | Brand in answers to industry questions; official presence | Moderate B2C, lower B2B |
| **Stack Overflow / Stack Exchange** | Developer brands (SaaS, dev tools, APIs) | Product in Q&A; brand tag exists; official account answering | High technical, irrelevant most B2C |
| **GitHub** | Open-source / developer-focused brands | GitHub org? Repo stars? Mentions in other repos' docs/discussions | High dev tools, low non-technical |
| **Industry Forums** | Niche authority signals from domain training data | Hacker News for tech, ProductHunt for startups, industry Slack | Moderate, valuable for niche authority |
| **News and Press** | Builds entity authority + recency signals | Major news/industry pub coverage; recency (last 6mo >> 3yr ago) | Moderate |
| **Podcasts** | Growing AI training data source; transcripts indexed | Brand or leadership podcast appearances; transcripts indexed | Moderate and growing |

---

## Correlation Reference (Ahrefs Dec 2025, 75K Brands)

| Signal | Correlation with AI Citation | Traditional SEO Value |
|---|---|---|
| YouTube mentions | ~0.737 | Low (not a ranking factor) |
| Reddit mentions | High (exact coefficient not published) | Low |
| Wikipedia presence | High | Moderate (trust signal) |
| LinkedIn presence | Moderate | Low |
| Domain Rating | ~0.266 | Very High |
| Backlink count | ~0.266 | Very High |
| Organic traffic | Moderate | Very High |

**Key insight:** Signals that matter most for AI visibility (YouTube, Reddit) are almost irrelevant in traditional SEO, and vice versa. Requires a fundamentally different optimization strategy.

---

## Sentiment Assessment Indicators

For Reddit / discussion platforms, assess sentiment from most recent and most prominent mentions:

| Sentiment | Indicators |
|---|---|
| **Positive** | Recommendations ("I love [brand]," "We switched to [brand] and...", "Highly recommend"), upvoted mentions, positive comparison vs competitors |
| **Neutral** | Factual mentions ("We use [brand] for...", "[Brand] offers..."), questions about the brand, balanced comparisons |
| **Negative** | Complaints ("Avoid [brand]", "[Brand] has terrible support"), downvoted recommendations, negative comparisons |
| **Mixed** | Combination of positive and negative — note the ratio and primary themes |

---

## Platform-Specific Quick Wins (for recommendations)

**YouTube:**
- Create a channel and upload 3-5 explainer videos about core topics
- Ensure brand name in video titles, descriptions, and spoken content
- Pursue guest appearances on relevant industry YouTube channels
- Create comparison or "alternatives" videos (cited by AI for comparison queries)

**Reddit:**
- Identify 3-5 subreddits where target audience is active
- Participate authentically — do NOT shill, communities detect and punish
- Do an AMA if appropriate
- Monitor and respond to brand mentions
- Create genuinely helpful posts that naturally mention brand's expertise

**Wikipedia:**
- Hire a Wikipedia-knowledgeable consultant — do NOT edit your own article (COI)
- Build notability through press, academic citations, industry recognition first
- Ensure Wikidata entry is complete even without a Wikipedia article
- Contribute to industry-relevant articles where brand can be naturally cited

**LinkedIn:**
- Optimize company page with complete info + regular posting
- Encourage leadership to post thought leadership weekly
- Publish LinkedIn articles on topics with unique expertise
- Engage industry discussions to increase brand visibility
