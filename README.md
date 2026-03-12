# PDF Report Skill

Publication-quality PDF report generator for [OpenClaw](https://github.com/openclaw/openclaw). Generates professional, multi-page reports with refined typography, data visualization, and multiple color themes.

## What It Does

Takes a topic and generates a polished report as both hosted HTML and downloadable PDF. The design system is inspired by top-tier consulting and tech report design — think McKinsey, Deloitte, Stripe annual reports.

## Features

- **5 color themes**: Warm Earth (default), Midnight Blue, Forest Green, Crimson, Slate
- **15+ components**: Hero covers, stat banners, bar charts, donut charts, timelines, data tables, insight cards, pull quotes, implications grids, callout boxes, sidebars, footnotes, and more
- **ECharts integration**: Professional charts (bar, line, donut, stacked, radar, treemap) — render server-side as static images for reliable PDF output
- **AI cover art**: Generate custom, visually striking illustrations via fal.ai that set the tone for the entire report
- **Full-bleed section heroes**: AI-generated imagery for chapter breaks with text overlays
- **20 component templates**: Individual HTML templates for every layout component
- **Multi-page report support**: Proper page-break rules ensure chapters and exhibits start on fresh pages

## Example Report

**[NYC Snowstorm Impact Assessment 2026](references/examples/nyc-snowstorm-report-2026.html)** — A 19-page consulting-style report on the impact of the 2025–2026 winter storms on New York City. Built with the Midnight Blue theme, featuring:

- Full-bleed AI-generated cover image
- AI-generated section hero images for chapter breaks
- Pre-rendered ECharts bar charts and donut charts
- Heat-mapped data tables
- Timeline, insight cards, pull quotes, case study sidebars
- Custom fictional brand identity (Meridian Policy Group)
- Proper page-break rules: every chapter and exhibit starts on its own page

```bash
# Render the example report
bash scripts/render.sh references/examples/nyc-snowstorm-report-2026.html output.pdf
```

## Quick Start

```bash
# Render any component template
bash scripts/render.sh references/examples/test-02-hero-stats.html output.pdf
```

## Structure

```
├── SKILL.md                    ← Main skill documentation
├── assets/
│   ├── base.css                ← Design system CSS
│   └── themes/                 ← Color theme overrides
│       ├── midnight.css        ← Corporate/finance
│       ├── forest.css          ← ESG/sustainability
│       ├── crimson.css         ← Security/alerts
│       └── slate.css           ← Academic/minimal
├── references/
│   ├── components.md           ← HTML component snippets
│   ├── design-system.md        ← Typography, color, spacing specs
│   ├── echarts.md              ← Chart templates
│   ├── examples/               ← Component templates + full report reference
│   └── inspiration/            ← Design guide + external sources
│       ├── README.md           ← Annotated design guide
│       └── SOURCES.md          ← External report inspiration links
└── scripts/
    ├── render.sh               ← HTML → PDF pipeline
    ├── render-pdf.js           ← Puppeteer render engine
    └── generate-image.sh       ← AI illustration generation
```

## Themes

| Theme | Best For |
|-------|----------|
| **Warm Earth** (default) | General purpose, editorial |
| **Midnight Blue** | Corporate, finance, government |
| **Forest Green** | ESG, sustainability |
| **Crimson** | Security, alerts |
| **Slate** | Academic, research |

## Design Principles

- **No emojis** — never use emoji characters in reports; use descriptive titles and visual design instead
- **Custom color palettes per report** — don't default to preset themes; design colors that fit the subject, brand, and tone
- **Font readability is non-negotiable** — if the display font looks too thin against your color scheme, boost weight or darken text
- **Cover images must be visually striking and bold** — they set the tone for the entire report
- **Generate custom brand assets** — create logos, icons, and section imagery using AI image generation to match the report's identity
- **Chapters start on a new page** — clean separation between major sections
- **Exhibits start on a new page** — charts and tables get full-page real estate, no awkward splits
- **Pre-render charts as static images** — use ECharts server-side rendering via Node.js; JS-based charts frequently fail in PDF generation
- **Serif for headlines, sans for structure** — Instrument Serif for display, Instrument Sans for UI, Literata for body text
- **No pure black** — use dark navy/charcoal as ink color; generous whitespace signals confidence

## Installation

```bash
git clone https://github.com/emilyvibecode/pdf-report-skill.git /data/openclaw/skills/pdf-report
```

## Requirements

- **Chromium** (headless) — for PDF rendering
- **Node.js** + Puppeteer (optional, preferred renderer)
- **ECharts + node-canvas** — for server-side chart rendering (`npm install --prefix skills/echarts/scripts echarts canvas`)

## External Inspiration

See [SOURCES.md](references/inspiration/SOURCES.md) for links to published reports from McKinsey, Deloitte, Stripe, Airbnb, and others that inspired the design system.

## License

MIT
