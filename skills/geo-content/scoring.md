# Content quality metrics and scoring modifiers

Reference tables for word count benchmarks, readability, structure, freshness, and topical authority. The 4 E-E-A-T dimensions live in `signals.md`.

---

## Word count benchmarks

Floors, not targets. More words does not mean better content. These are the minimums to adequately cover a topic for AI citability.

| Page type | Minimum words | Ideal range | Notes |
|---|---|---|---|
| Homepage | 500 | 500-1,500 | Clear value proposition, not a wall of text |
| Blog post | 1,500 | 1,500-3,000 | Thorough but focused |
| Pillar content / Ultimate guide | 2,000 | 2,500-5,000 | Comprehensive topic coverage |
| Product page | 300 | 500-1,500 | Descriptions, specs, use cases |
| Service page | 500 | 800-2,000 | What, how, why, for whom |
| About page | 300 | 500-1,000 | Company/person story and credentials |
| FAQ page | 500 | 1,000-2,500 | Thorough answers, not one-liners |

---

## Readability assessment

- **Target Flesch Reading Ease**: 60-70 (8th-9th grade level)
- This is NOT a direct ranking factor but affects citability — AI platforms prefer content that is clear and unambiguous
- Overly academic writing (score < 30) reduces citability for general queries
- Overly simple writing (score > 80) may lack the depth needed for expertise signals

Estimate without a tool:
- Average sentence length: 15-20 words is ideal
- Average paragraph length: 2-4 sentences
- Jargon: should be defined when first used
- Passive voice: < 15% of sentences

---

## Paragraph structure for AI parsing

AI platforms extract content at the paragraph level. Each paragraph should be a self-contained unit of meaning.

- **2-4 sentences** per paragraph (1-sentence paragraphs are weak; 5+ sentences are hard to extract)
- **One idea per paragraph** — do not mix topics within a paragraph
- **Lead with the key claim** — first sentence should contain the main point
- **Support with evidence** — remaining sentences provide data, examples, or context
- **Quotable standalone** — each paragraph should make sense if extracted in isolation

---

## Heading structure

- **One H1 per page** — the primary topic/title
- **H2 for major sections** — should represent distinct subtopics
- **H3 for subsections** — nested under relevant H2
- **No skipped levels** — do not go from H1 to H3 without an H2
- **Descriptive headings** — "How to Optimize for AI Search" not "Section 2"
- **Question-based headings** where appropriate — these map directly to AI queries

---

## Internal linking

- Every content page should link to 3-5 related pages on the same site
- Links should use descriptive anchor text (not "click here")
- Create a topic cluster structure: pillar page linked to/from all related subtopic pages
- Orphan pages (no internal links pointing to them) are rarely cited by AI

---

## Content freshness

Check for visible `datePublished` and `dateModified` in both the content and structured data. Content without dates is treated as less trustworthy by AI platforms. Dates should be specific (January 15, 2026) not vague ("recently").

| Criterion | Score |
|---|---|
| Updated within 3 months | Excellent — current and relevant |
| Updated within 6 months | Good — still reasonably current |
| Updated within 12 months | Acceptable — may need refresh |
| Updated 12-24 months ago | Warning — review for accuracy |
| No date or 24+ months old | Critical — AI platforms may deprioritize |

Evergreen indicators — content remains relevant regardless of age if:
- It covers fundamental concepts that do not change (physics, basic math, legal definitions)
- It is clearly labeled as a reference/guide for lasting concepts
- It does not contain time-dependent claims ("the latest", "currently", "in 2024")

---

## Topical authority modifier

Topical authority measures whether a site comprehensively covers a topic rather than touching on it superficially. AI platforms prefer citing sites that are recognized authorities on their topics.

Assess:
1. **Content breadth**: Does the site have multiple pages covering different aspects of its core topic?
2. **Content depth**: Do individual pages go deep into subtopics?
3. **Topic clustering**: Are pages organized into logical groups with internal linking?
4. **Content gaps**: Are there obvious subtopics that the site should cover but does not?
5. **Competitor comparison**: Do competitors cover subtopics that this site misses?

| Level | Description | Score impact |
|---|---|---|
| Authority | 20+ pages covering topic comprehensively, strong clustering | +10 bonus |
| Developing | 10-20 pages with some clustering | +5 bonus |
| Emerging | 5-10 pages on topic, limited clustering | +0 |
| Thin | < 5 pages, no clustering | -5 penalty |
