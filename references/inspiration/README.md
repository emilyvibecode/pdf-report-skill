# Visual Reference Guide

This directory contains visual references showing what reports from this skill should look and feel like. There are two types:

1. **Real report references** (`ref-*.png`) — Pages from actual reports we've built. These are the gold standard.
2. **Template screenshots** (`test-*.png`) — Individual component test renders showing each layout type.

An AI agent generating a report should look at these images to match the vibe — the typography, spacing, color restraint, and overall polish.

---

## Real Report References

These are from actual multi-page reports built with this design system. They show the quality bar at full production fidelity.

### Incident Report (Post-Mortem)

A SEV-1 incident post-mortem report. Dark warm palette, dramatic cover art, professional data visualization.

| File | What it shows | Key design elements |
|------|---------------|---------------------|
| `ref-incident-cover.png` | **Cover page** with AI-generated art | Dramatic vertical light beam, SEV-1 badge, italic accent title, metadata footer row |
| `ref-incident-dashboard.png` | **Impact dashboard + exec summary** | 4-stat banner (duration, users, revenue, SLA), drop-cap lead paragraph |
| `ref-incident-timeline.png` | **Vertical timeline** | Gradient timeline line, dot markers, date/title/desc per event, two-column text above |
| `ref-incident-chart.png` | **Combo chart** (bar + line) | Dual-axis chart showing error rate vs request volume, shaded incident window |
| `ref-incident-table.png` | **Data table + callout** | Regional impact table with heat-map highlights, blockquote callout with left border |
| `ref-incident-cards.png` | **Root cause cards** | Numbered cause cards (01, 02, 03) with section divider page |
| `ref-incident-code-barchart.png` | **Code diff + bar chart** | Technical detail box with code, horizontal bar chart with contributing factors |
| `ref-incident-quote.png` | **Pull quote + section intro** | VP Engineering quote with attribution, section 4 introduction |

**What makes it great:**
- The AI-generated cover art (glowing fissure) creates an immediate emotional hook
- Stats are scannable in under 3 seconds
- Timeline uses visual weight (dot size, line gradient) to show progression
- Tables have heat-map coloring to draw eyes to the worst numbers
- Pull quotes break up dense text sections

### China Report

A long-form technology analysis report in consulting style.

| File | What it shows | Key design elements |
|------|---------------|---------------------|
| `ref-china-cover.png` | **Cover + executive summary** | Dark teal gradient hero, gold italic accent word, drop-cap body text, metadata row |

**What makes it great:**
- The teal-to-navy gradient feels authoritative and premium
- Gold accent on one word ("Phenomenon") creates a focal point
- Metadata row (date, authors, reading time) gives instant context
- The transition from dark hero to white exec summary creates visual rhythm

### V2 Template Report

A cleaner, refined version of the template system.

| File | What it shows | Key design elements |
|------|---------------|---------------------|
| `ref-v2-cover.png` | **Cover page** | Dark hero, serif title with gold italic accent, subtitle, metadata row |
| `ref-v2-stats.png` | **Executive summary + stats** | Drop-cap lead, accent top border, stat banner with gold numbers |
| `ref-v2-chart.png` | **Key statistics page** | 4-stat grid on dark banner with gold numerals |

---

## Template Screenshots

Individual component tests showing each layout type in isolation. Each is exactly 1 page.

### Default Theme (Warm Earth)

| File | Component | Notes |
|------|-----------|-------|
| `test-02-hero-stats.png` | Hero + stat banner | The most common page type — title + key numbers |
| `test-03-bar-chart.png` | Bar chart exhibit | Chart inside bordered card, source attribution |
| `test-04-data-table.png` | Data table | Heat-mapped cells, compact hero for space |
| `test-05-timeline.png` | Timeline | 4 events, gradient line, compact spacing |
| `test-06-insight-cards.png` | Insight cards | 3-column grid with faded numbers |
| `test-07-donut.png` | Donut chart | CSS conic-gradient, side legend |
| `test-20-one-pager.png` | Full one-pager | Max density: hero + stats + chart |

### Themes

| File | Theme | Best for |
|------|-------|----------|
| `test-13-midnight.png` | Midnight Blue | Corporate, finance, tech |
| `test-14-forest.png` | Forest Green | ESG, sustainability |
| `test-15-crimson.png` | Crimson | Security, alerts |
| `test-16-slate.png` | Slate | Academic, research |

---

## Design Principles Visible Across All References

1. **Color restraint** — One accent color, used sparingly. Most of the page is text on neutral backgrounds.
2. **Typography does the heavy lifting** — Serif headlines create authority. Sans labels create structure. The italic accent word is the signature.
3. **Generous whitespace** — Even on dense layouts, nothing touches the edges.
4. **Dark hero, light body** — The gradient hero establishes visual weight at the top. The lighter body section is where reading happens.
5. **Exhibits are contained** — Charts, tables, and data live inside bordered cards. They never float freely.
6. **Source attribution** — Every exhibit has a source line. Non-negotiable.
7. **AI-generated cover art** — Premium reports use custom illustrations that match the topic. This is the biggest quality differentiator.
8. **Stats are scannable** — Large numbers, small labels, 3-second comprehension.
9. **Pull quotes break monotony** — A well-placed quote between data sections gives the reader a breather.
10. **Heat-map tables** — Color-coded cells draw eyes to the most important numbers.
