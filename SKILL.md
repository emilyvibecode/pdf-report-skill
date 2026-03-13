---
name: pdf-report
description: "Generate beautiful, publication-quality PDF reports with refined typography, AI-generated illustrations, and professional data visualization. Use when the user asks to create a report, whitepaper, research document, analysis, brief, memo, or professional document. Also triggers on 'make a report', 'write up a report', 'PDF this', 'create a document', 'generate a whitepaper', 'make a PDF', or requests for polished, professional output. Produces both a hosted HTML version and a downloadable PDF."
---

# PDF Report Generator

Create publication-quality reports with refined typography, AI-generated cover art, and professional data visualization. Design system inspired by Deloitte, McKinsey, Bain, Stripe, Figma, Airbnb, Nike, WEF, and Google Cloud report design.

## Tools & Dependencies

| Tool | What it does | How to use it |
|------|-------------|---------------|
| **Google Fonts (CDN)** | Loads Instrument Serif, Literata, Instrument Sans, JetBrains Mono | `<link>` tag in HTML `<head>` — snippet in `references/components.md` |
| **Apache ECharts (CDN)** | Professional charts (bar, line, donut, stacked, radar, treemap) | `<script src="https://cdn.jsdelivr.net/npm/echarts@5.5.0/dist/echarts.min.js">` in HTML `<head>` |
| **fal.ai API** | AI illustration generation (Flux model) | `bash scripts/generate-image.sh "prompt" output.jpg` — uses `FAL_API_KEY` env var via cloud proxy |
| **Ideogram API** | AI illustration generation (alternative, good with text-in-images) | Call `https://api.ideogram.ai.cloudproxy.vibecodeapp.com/generate` with `IDEOGRAM_API_KEY` |
| **Puppeteer + Chromium** | Renders HTML → PDF, waits for JS/fonts to complete | `bash scripts/render.sh input.html output.pdf` — Puppeteer is pre-installed globally |
| **assets/base.css** | Complete CSS design system (950+ lines) | Paste FULL contents into `<style>` tag. **Never abbreviate or rewrite.** |

### Connection details (all pre-configured via environment)

- **fal.ai**: `https://fal.run.cloudproxy.vibecodeapp.com/fal-ai/flux/dev` with `Authorization: Key $FAL_API_KEY`
- **Ideogram**: `https://api.ideogram.ai.cloudproxy.vibecodeapp.com/generate` with `Api-Key: $IDEOGRAM_API_KEY`
- **Google Fonts**: `https://fonts.googleapis.com/css2?family=...` (public CDN, no auth)
- **ECharts**: `https://cdn.jsdelivr.net/npm/echarts@5.5.0/dist/echarts.min.js` (public CDN, no auth)
- **Chromium**: Pre-installed at `/usr/bin/chromium`. Puppeteer uses it automatically.

## Workflow

### Step 1: Generate cover illustration (recommended for premium reports)

```bash
bash scripts/generate-image.sh \
  "Abstract geometric composition suggesting global connectivity and transformation, editorial style" \
  /path/to/cover.jpg landscape_16_9
```

The script auto-prefixes prompts with our warm earth palette. For section break images, run again with different prompts.

**Prompt tips for high quality:**
- Describe composition specifically: "overlapping geometric planes with depth, warm light"
- Request texture: "subtle paper grain, matte finish"
- Specify mood: "contemplative, professional, editorial"
- Always avoid: "text", "watermarks", "logos", "stock photo"

### Step 2: Build the HTML file

Create a single self-contained HTML file:

1. **Read** `assets/base.css` — paste its FULL contents into `<style>` tag
2. **Read** `references/components.md` — pick components and assemble the page
3. **If using ECharts**: Read `references/echarts.md` — add `<script>` tag and chart initialization code
4. **If using a theme**: Read the theme file from `assets/themes/*.css` — paste AFTER base.css in `<style>`

**HTML skeleton:**
```html
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Report Title</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Instrument+Sans:wght@400;500;600;700&family=Instrument+Serif:ital@0;1&family=Literata:ital,opsz,wght@0,7..72,300;0,7..72,400;0,7..72,600;0,7..72,700;1,7..72,400&family=JetBrains+Mono:wght@400;600&display=swap" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/echarts@5.5.0/dist/echarts.min.js"></script>
<style>
/* === PASTE FULL base.css HERE === */
/* === OPTIONAL: paste theme override here === */
</style>
</head>
<body>
<!-- Components from references/components.md go here -->

<script>
// ECharts initialization goes here (templates in references/echarts.md)
// Always wrap in document.fonts.ready for reliable rendering:
document.fonts.ready.then(function() {
  // ... chart init code ...
});
</script>
</body>
</html>
```

### Step 3: Render to PDF

```bash
bash scripts/render.sh /path/to/report.html /path/to/output.pdf
```

This uses Puppeteer which:
- Waits for network requests (fonts, CDN scripts) to complete
- Waits for fonts to load
- Waits for ECharts/JS to execute and render
- Generates a print-quality PDF with background colors preserved

### Step 4: Deliver

Place both HTML and PDF in `Public/` directory for web access. Provide the user with:
- HTML URL for browser viewing
- PDF file for download

## Component Inventory

**Cover options (pick one):**
- **Full-Bleed Cover** — cinematic hero image with gradient overlay and text (requires generated image)
- **Hero** — dark `--ink` background with text, no image needed (simpler, always works)

**Required:**
- **Top Bar** — organization, report type, date (thin strip)
- **Executive Summary** — lead paragraph with drop cap

**Content blocks (mix and match):**
- **Table of Contents** — dotted leaders, for 3+ section reports
- **Stat Banner** — 3–4 key metrics on dark strip
- **Section Headers** — kicker label + Instrument Serif title + intro paragraph
- **Section Hero** — full-width image break between chapters
- **Exhibits (ECharts)** — bar, line/area, donut, stacked bar, radar, treemap
- **Exhibits (HTML)** — simple horizontal bars, timelines, data tables (no JS needed)
- **Insight Cards** — numbered grid of 3 insight boxes
- **Pull Quotes** — italic Instrument Serif quote with attribution
- **Two-Column Text** — side-by-side narrative paragraphs
- **Sidebars** — case study or definition boxes
- **Implications Grid** — 2×2 takeaway cards with colored left borders
- **Callout Boxes** — highlighted aside with terra left border
- **Footnotes** — superscript references with source text
- **Separator** — ◆ ◆ ◆ diamond divider
- **Footer** — disclaimers, copyright

## Data Visualization

**Pre-render charts as static PNG images** using the ECharts skill's server-side renderer. JS-based charts embedded in HTML frequently fail to render during PDF generation (Chromium doesn't always wait for async JS).

**Recommended workflow:**
1. Use the ECharts skill (`~/.openclaw/workspace/skills/echarts/scripts/render.js`) to render each chart as a PNG
2. Embed the PNG in the HTML with `<img src="chart.png" style="width:100%;height:auto;display:block">`
3. This guarantees charts appear in the final PDF

```bash
# Install ECharts if needed
npm install --prefix ~/.openclaw/workspace/skills/echarts/scripts echarts canvas

# Render a chart
echo '{"xAxis":{"type":"category","data":["Q1","Q2","Q3","Q4"]},...}' | \
  node ~/.openclaw/workspace/skills/echarts/scripts/render.js --out chart.png --width 860 --height 340
```

**Chart styling tips:**
- Use colors from your report's custom palette (match `--terra`, `--ink`, `--copper`, etc.)
- Set `backgroundColor: "#FFFFFF"` for clean white chart backgrounds
- Use `fontSize: 11-12` for axis labels, `fontWeight: "bold"` for value labels
- Donut charts: use short label names (15 chars max) to prevent truncation

See `references/echarts.md` for full chart templates and configuration examples.

## Color & Theming

**Do not limit yourself to preset themes.** The CSS design system uses CSS custom properties (variables) that can be overridden per report. Create a custom color palette that fits the subject matter, brand, or tone of each report.

The preset themes in `assets/themes/` (Midnight Blue, Forest, Crimson, Slate) are **starting points and examples**, not a closed set. For any report, you can and should define custom `--ink`, `--terra`, `--ochre`, `--surface`, etc. values that match the topic.

**Guidelines for custom palettes:**
- Ensure sufficient contrast between body text and backgrounds (WCAG AA minimum)
- `--ink` should be dark enough for strong headlines
- `--body-color` must be clearly readable on `--surface` and `--paper` backgrounds
- `--terra` is the primary accent — use it for labels, exhibit rules, and interactive elements
- `--ochre` is the highlight accent — use for stat numbers, emphasis, pull quote borders
- Test readability: if the display font (Instrument Serif) looks too thin against your background, increase `font-weight` to 500+ or darken the text color

## Design Principles

1. **Serif headlines, sans for structure.** Instrument Serif for titles. Instrument Sans for labels/UI. Literata for body text.
2. **Font readability is non-negotiable.** If the display font looks too thin against the color scheme, boost weight or darken text. Always test contrast.
3. **Custom palettes per report.** Don't default to presets. Design a color palette that fits the subject, brand, and tone.
4. **No pure black.** Use a very dark navy/charcoal as `--ink`. Pure black looks harsh.
5. **No emojis.** Never use emoji characters in report content. Use descriptive titles and visual design instead.
6. **Cover images must be visually striking and bold.** The cover sets the tone for the entire report. Invest in a strong, cinematic cover image.
7. **Generate custom brand assets.** Create logos, icons, and section images as needed. Use AI image generation for custom branded imagery that matches the report's identity.
8. **Every chapter starts on a new page.** Clean separation between major sections.
9. **Every exhibit starts on a new page.** Charts and tables get full-page real estate. No awkward splits across pages.
10. **Pre-render charts as static images.** Use the ECharts skill to render charts server-side as PNG. JS-based charts frequently fail to render in PDF generation. Static images are reliable.
11. **Content density matters.** Every page should earn its existence.
12. **Always attribute data sources.** Use `.exhibit-source` below every chart and table.

## Reference Files

| File | What it contains | When to read it |
|------|-----------------|-----------------|
| `assets/base.css` | Complete CSS design system | **Always** — paste into every report |
| `assets/themes/*.css` | Theme overrides | When user requests a specific theme |
| `references/components.md` | All HTML component snippets | **Always** — pick components for the report |
| `references/design-system.md` | Typography, color, spacing specs | When you need precise design details |
| `references/echarts.md` | ECharts palette, chart templates | When the report needs data visualizations |
| `references/examples/*.html` | 20 tested single-page templates | When you need a working starting point with correct sizing |
| `scripts/render.sh` | HTML → PDF render pipeline | **Always** — use to generate the final PDF |
| `scripts/render-pdf.js` | Puppeteer render engine (called by render.sh) | Don't call directly — render.sh uses it |
| `scripts/generate-image.sh` | AI illustration via fal.ai | When generating cover art or section images |

## Single-Page Sizing Guide

**Critical rule: content must fit on exactly one page (Letter, 612×792pt). Nothing should spill.**

When combining multiple components on one page, the default hero padding (80px top/70px bottom) is too generous. Use these compact overrides:

| Layout complexity | Hero padding | Section padding | Component sizing |
|---|---|---|---|
| **Simple** (hero + 1 component) | Default (no override needed) | Default | Default |
| **Medium** (hero + 2 components) | `style="padding:50px 0 40px"` | `style="padding:30px 0"` | Reduce exhibit padding to 24px |
| **Dense** (hero + 3+ components) | `style="padding:45px 0 35px"` | `style="padding:20px 0"` | Reduce all padding/gaps/font-sizes |

**Compact overrides for dense pages:**
- Hero h1: `style="font-size:34-36px"`
- Hero rule: `style="margin:16-20px 0"`
- Exhibit padding: `style="padding:16-24px;margin:0"`
- Exhibit title: `style="font-size:16-18px"`
- Insight cards: `style="padding:24px 20px"` with number `style="font-size:32px"`
- Implications grid: `style="gap:12px"` with cards `style="padding:16px"`
- Impl icons: `style="font-size:20px;margin-bottom:4px"`
- Impl title/text: `style="font-size:14px"` / `style="font-size:12px"`
- Donut: `style="width:160px;height:160px"` (default 220px is large)
- Timeline items: `style="margin-bottom:18px"` (default ~28px)
- Pull quote: `style="padding:30px 50px;margin:0"` with blockquote `style="font-size:20px"`
- Stat banner: `style="padding:28-32px 0"` with numbers `style="font-size:32-36px"`

**Always validate with `pdfinfo output.pdf | grep Pages` — must say `Pages: 1`.**

## Tested Example Templates

20 tested single-page templates are in `references/examples/`. Each is a complete, self-contained HTML file that renders to exactly 1 page. **Read these when you need a working starting point.**

| Example | File | What it demonstrates |
|---------|------|---------------------|
| Minimal | `references/examples/test-01-minimal.html` | Hero + exec summary (simplest possible) |
| Hero + Stats | `references/examples/test-02-hero-stats.html` | Hero + 4-stat banner |
| Bar Chart | `references/examples/test-03-bar-chart.html` | Bar chart exhibit with source |
| Data Table | `references/examples/test-04-data-table.html` | Heat-mapped comparison table (compact hero) |
| Timeline | `references/examples/test-05-timeline.html` | 4-event timeline (compact spacing) |
| Insight Cards | `references/examples/test-06-insight-cards.html` | 3-card grid (compact hero + cards) |
| Donut Chart | `references/examples/test-07-donut.html` | Donut chart + legend (compact, 160px donut) |
| Pull Quote | `references/examples/test-08-pull-quote.html` | Quote block |
| Two-Column | `references/examples/test-09-two-col.html` | Side-by-side narrative text |
| Implications | `references/examples/test-10-implications.html` | 2×2 grid with colored left borders (compact) |
| Callout + Sidebar | `references/examples/test-11-callout-sidebar.html` | Callout box + case study sidebar |
| Table of Contents | `references/examples/test-12-toc.html` | TOC with dotted leaders |
| Midnight Theme | `references/examples/test-13-midnight.html` | Corporate/finance blue theme |
| Forest Theme | `references/examples/test-14-forest.html` | ESG/sustainability green theme |
| Crimson Theme | `references/examples/test-15-crimson.html` | Security/alerts red theme |
| Slate Theme | `references/examples/test-16-slate.html` | Academic/minimal gray theme |
| Footnotes | `references/examples/test-17-footnotes.html` | Superscript references + footnote block |
| Stats + Quote | `references/examples/test-18-stats-quote.html` | Stat banner + pull quote combo (compact) |
| Table + Impl | `references/examples/test-19-table-impl.html` | Risk table + implications (dense layout) |
| Full One-Pager | `references/examples/test-20-one-pager.html` | Compact hero + stats + bar chart (max density) |

**How to use:** Read the example closest to what you need, then adapt the content. The sizing and spacing in each example is already validated to fit one page.

## Visual References

The `references/inspiration/` directory contains **PNG screenshots** of rendered report templates plus an annotated `README.md` guide. 

**Before generating a report, read `references/inspiration/README.md`** to understand the visual quality bar — the typography, spacing, color restraint, and overall vibe each layout should achieve.

| File | What it shows |
|------|---------------|
| `references/inspiration/README.md` | Annotated guide to all reference images |
| `references/inspiration/test-02-hero-stats.png` | Hero + stat banner (default theme) |
| `references/inspiration/test-03-bar-chart.png` | Bar chart exhibit |
| `references/inspiration/test-04-data-table.png` | Heat-mapped data table |
| `references/inspiration/test-05-timeline.png` | 4-event timeline |
| `references/inspiration/test-06-insight-cards.png` | 3-card insight grid |
| `references/inspiration/test-07-donut.png` | Donut chart with legend |
| `references/inspiration/test-13-midnight.png` | Midnight blue theme |
| `references/inspiration/test-14-forest.png` | Forest green theme |
| `references/inspiration/test-15-crimson.png` | Crimson theme |
| `references/inspiration/test-16-slate.png` | Slate/academic theme |
| `references/inspiration/test-20-one-pager.png` | Full one-pager (max density) |

When the agent has vision capabilities, it should look at the relevant PNG to match the vibe, not just the code.
