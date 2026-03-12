# Visual Reference Guide

Screenshots of rendered report templates showing the design system in action. Use these to understand the **visual quality bar** — the typography, spacing, color restraint, and overall vibe each layout should achieve.

An AI agent generating a report should reference these images to match the look and feel, not just the HTML structure.

## Screenshots

### Default Theme (Warm Earth)

#### `test-02-hero-stats.png` — Hero + Stat Banner
**Layout:** Dark espresso hero gradient → 4-stat metric banner → breathing room
**What to notice:**
- Warm earth palette: espresso browns, copper accents, cream backgrounds
- Instrument Serif italic on the accent word ("*Performance*") in gold/copper — this is the signature brand element
- Stat numbers use large display serif, unit labels in small-cap sans
- The dark hero and dark stat banner create a strong top-heavy visual weight — the white space below balances it
- Top bar uses letterspaced uppercase sans — thin, authoritative

#### `test-03-bar-chart.png` — Bar Chart Exhibit
**What to notice:**
- Exhibit card has a subtle terra/copper top border — the only color accent
- Bar fills use the c-1/c-2/c-3 palette classes (terra, ink, copper) — distinct but harmonious
- Chart sits inside a bordered card with generous padding
- Source attribution at the bottom of the exhibit — always include this
- Labels are right-aligned sans, values are bold sans on the right

#### `test-04-data-table.png` — Data Table with Heat Map
**What to notice:**
- Table header uses dark ink background with white text
- Heat map classes create subtle background tints (green for high, lighter for med/low)
- The compact hero (reduced padding) leaves room for the table
- Clean, scannable rows — no visual clutter

#### `test-05-timeline.png` — Timeline
**What to notice:**
- Vertical timeline line with gradient (terra → copper)
- Circular dot markers at each event
- Date labels in small uppercase, event titles in bold sans, descriptions in body serif
- Compact spacing between events to fit 4 on one page

#### `test-06-insight-cards.png` — Three Insight Cards
**What to notice:**
- 3-column grid of cards with terra top border
- Large faded numbers (01, 02, 03) create visual rhythm
- Short, punchy titles with minimal body text
- Cards should feel like quick-scan takeaways, not paragraphs

#### `test-07-donut.png` — Donut Chart
**What to notice:**
- CSS-only donut (conic-gradient) — no JavaScript needed
- Legend beside the donut with color swatches
- The donut hole is white, creating the ring effect
- Sized at 160px for compact layouts (default 220px is for full pages)

#### `test-20-one-pager.png` — Full One-Pager (Maximum Density)
**What to notice:**
- This is the densest layout — hero + stats + bar chart on one page
- Everything is scaled down: hero padding, stat sizes, exhibit padding
- Despite the compression, it still reads cleanly — nothing feels cramped
- This is the template to reference when someone says "give me everything on one page"

### Midnight Blue Theme

#### `test-13-midnight.png` — Corporate/Finance
**What to notice:**
- Deep navy gradient replacing the warm earth tones
- Accent color shifts to steel blue/slate — appropriate for financial services
- Stat numbers in light blue against navy — high contrast, trustworthy feel
- The mood is "Bloomberg terminal meets annual report"

### Forest Green Theme

#### `test-14-forest.png` — ESG/Sustainability
**What to notice:**
- Dark forest green gradient with warm gold italic accent
- The gold on green is the standout combination — luxurious but grounded
- Bar chart uses green spectrum (different values, not different hues)
- Mint-tinted page background extends the green identity subtly

### Crimson Theme

#### `test-15-crimson.png` — Security/Alerts
**What to notice:**
- Deep maroon-to-black gradient — conveys urgency without being garish
- Italic accent word in soft pink — editorial restraint even in an "alert" context
- Red left-border on callout box draws the eye to critical content
- The palette says "this matters" without screaming

### Slate Theme

#### `test-16-slate.png` — Academic/Minimal
**What to notice:**
- No chromatic accent — relies entirely on typographic hierarchy
- Drop cap adds editorial personality without color
- "Working Paper No." kicker establishes the academic register
- The most restrained theme — ideal for research papers, policy briefs
- Bold text is the only emphasis mechanism — use sparingly

## Design Principles Visible Across All Templates

1. **Color restraint** — One accent color, used sparingly. Most of the page is text on neutral backgrounds.
2. **Typography does the heavy lifting** — Serif headlines create authority. Sans labels create structure. The italic accent word is the signature.
3. **Generous whitespace** — Even on dense layouts, nothing touches the edges. Padding and margins create breathing room.
4. **Dark hero, light body** — The gradient hero establishes visual weight at the top. The lighter body section is where the reader settles in.
5. **Exhibits are contained** — Charts, tables, and data live inside bordered cards with consistent styling. They never float freely.
6. **Source attribution** — Every exhibit has a source line. This is non-negotiable for professional reports.
