# Design System Reference

This file contains detailed design principles and specifications. Load it when you need precision on typography, spacing, or color choices.

## Typography

### Font Stack

| Role | Font | Weight | Google Fonts Import |
|------|------|--------|---------------------|
| Display / Headlines | Instrument Serif | 400 (regular only) | `Instrument+Serif:ital@0;1` |
| Body text / Paragraphs | Literata | 300, 400, 600, 700 | `Literata:ital,wght@0,300;0,400;0,600;0,700;1,400` |
| UI / Labels / Sans | Instrument Sans | 400, 500, 600, 700 | `Instrument+Sans:wght@400;500;600;700` |
| Code / Data | JetBrains Mono | 400, 600 | `JetBrains+Mono:wght@400;600` |

**Full Google Fonts link tag:**
```html
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Instrument+Sans:wght@400;500;600;700&family=Instrument+Serif:ital@0;1&family=Literata:ital,opsz,wght@0,7..72,300;0,7..72,400;0,7..72,600;0,7..72,700;1,7..72,400&family=JetBrains+Mono:wght@400;600&display=swap" rel="stylesheet">
```

### Typography Rules

**Instrument Serif** is used ONLY for:
- Hero h1 titles
- Section titles (.section-title)
- Stat numbers (.stat-number)
- Exhibit titles (.exhibit-title)
- Pull quote text
- Insight card numbers (decorative)
- Drop caps

It should NEVER be bold (it only has weight 400). Its beauty is in its elegant regular weight.

**Literata** is the workhorse body serif:
- All paragraph text
- Executive summary body and lead paragraphs
- Timeline descriptions
- Any running prose
- Use weight 300 (light) for lead text, 400 for body, 600 for bold emphasis

**Instrument Sans** handles all structural/UI elements:
- Top bar text
- Section labels (kickers)
- Hero metadata
- Stat units and descriptions
- Exhibit labels, subtitles, and source lines
- Bar chart labels and values
- Table headers and cells
- Card titles (insight, implication)
- Footer text
- Any button or tag-like elements

### Size Scale

| Element | Font | Size | Weight | Line-height |
|---------|------|------|--------|-------------|
| Hero h1 | Display | clamp(38px, 5vw, 58px) | 400 | 1.1 |
| Section title | Display | clamp(26px, 3vw, 36px) | 400 | 1.18 |
| Exhibit title | Display | 20px | 400 | 1.3 |
| Lead paragraph | Text | 20px | 300 | 1.72 |
| Body text | Text | 15.5–16px | 400 | 1.78 |
| Section intro | Text | 17px | 300 | 1.78 |
| Sans body (cards) | Sans | 14–15px | 400 | 1.7 |
| Table header | Sans | 11px | 600 | — |
| Table cell | Sans | 13px | 400 | — |
| Label/kicker | Sans | 11px | 600 | — |
| Source/caption | Sans | 10–11px | 400 | — |
| Top bar | Sans | 11px | 500 | — |

### Letter-spacing

- Hero h1: -0.5px (tight for large type)
- Section title: -0.3px
- Labels/kickers: 2–2.5px (wide, uppercase)
- Body text: 0 (normal)
- Sans UI text: 0 (normal)

## Color System

### Warm Earth (Default Theme)

The default palette is grounded in warm, natural tones. It avoids corporate blue and neon accents in favor of terracotta, copper, sage, and sand — colors that feel like clay, leather, stone, and wheat.

**Ink tones (text hierarchy):**
```
#2C2420  ██  ink       — darkest, headings, hero bg
#3E3530  ██  espresso  — bold emphasis text
#4A4340  ██  body      — primary body text
#6B6260  ██  stone     — secondary text
#8C7E7A  ██  clay      — muted metadata, sources
```

**Accent colors:**
```
#B85C38  ██  terra     — PRIMARY accent (terracotta)
#C97B4B  ██  copper    — secondary warm accent
#6B7F5E  ██  sage      — tertiary green accent
#D4B896  ██  sand      — highlight, hero italic text
#C4933E  ██  ochre     — golden accent for special use
```

**Surfaces:**
```
#FAF7F4  ██  surface   — page background (warm white)
#FFFFFF  ██  paper     — cards, exhibits, tables
#F3EDE7  ██  wash      — light background sections
#E5DDD5  ██  border    — rules, dividers, card borders
```

### Color Usage Rules

1. **Terra (#B85C38)** is the primary accent. Use it for: section labels, exhibit top borders, insight card borders, timeline dots, callout borders. It's the signature color.

2. **Sand (#D4B896)** appears in dark contexts only: hero italic text, stat numbers on dark backgrounds, pull quote borders. It's the "light accent."

3. **Ink (#2C2420)** is used for hero/stat-banner/footer backgrounds. It's a warm near-black, NOT pure black.

4. **Never use pure black (#000000)** for text or backgrounds. The warmest dark is var(--ink).

5. **Bar chart colors** cycle through: terra → ink → copper → sage → clay. These five provide enough differentiation while staying on-palette.

6. **Heat map tints** for data tables use transparent terra overlays at 12%, 6%, and 4% opacity.

### Available Themes

Each theme overrides CSS custom properties. They are loaded as a `<style>` block AFTER the base CSS.

| Theme | File | Character |
|-------|------|-----------|
| **Warm Earth** | (default in base.css) | Natural, grounded, editorial |
| **Midnight Blue** | themes/midnight.css | Corporate, authoritative, cool |
| **Forest** | themes/forest.css | Natural, ESG/sustainability |
| **Slate** | themes/slate.css | Minimal, neutral, restrained |
| **Crimson** | themes/crimson.css | Bold, high-contrast, alerts |

## Spacing

The spacing system uses a 4px base unit. Use the CSS variables:

```
--sp-1:  4px    --sp-2:  8px    --sp-3:  12px   --sp-4:  16px
--sp-5:  20px   --sp-6:  24px   --sp-8:  32px   --sp-10: 40px
--sp-12: 48px   --sp-16: 64px   --sp-20: 80px   --sp-24: 96px
```

**Key spacing patterns:**
- Section padding: 80px (sp-20) top and bottom
- Container max-width: 960px with 40px gutters
- Exhibit margin: 40px (sp-10) top and bottom
- Card grids: 24px (sp-6) gap
- Paragraph spacing: 20px (sp-5) bottom margin
- Hero padding: 96px top, 80px bottom

## Chart Colors

For donut charts, use `conic-gradient()` with these palette colors:

```css
/* 4-slice donut example */
background: conic-gradient(
  var(--terra)  0deg   130deg,
  var(--ink)    130deg 230deg,
  var(--copper) 230deg 310deg,
  var(--sage)   310deg 360deg
);
```

For bar charts, use classes `c-1` through `c-5`:
- `.c-1` → terra (primary)
- `.c-2` → ink (dark)
- `.c-3` → copper (warm)
- `.c-4` → sage (green)
- `.c-5` → clay (muted)

## Design Philosophy

Inspired by the reference PDFs from Deloitte and McKinsey:

1. **Serif for headlines, sans for structure** — Like McKinsey's Bower + McKinsey Sans approach. The display serif (Instrument Serif) carries authority and elegance. The sans (Instrument Sans) handles everything structural.

2. **Restrained color** — Like Deloitte's nearly monochrome interiors with strategic spot color. Don't overuse the accent palette. Terra is the star; others support.

3. **Generous whitespace** — Pages should breathe. It's better to have half a page empty than to cram content. Empty space signals confidence and clarity.

4. **Content hierarchy through typography, not decoration** — Size, weight, and font family changes establish hierarchy. Avoid excessive borders, shadows, or decorative elements.

5. **Data viz serves narrative** — Charts should tell a story, not just display numbers. Labels should be meaningful. Sources should always be attributed.
