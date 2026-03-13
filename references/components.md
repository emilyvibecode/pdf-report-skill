# Component Reference

All HTML snippets for report components. Use `style="width:X%"` for bar fills in PDF mode (not data attributes that need JS).

## HTML Boilerplate

Every report starts with this shell. Paste the base.css content into the `<style>` tag. Optionally append a theme CSS override after it. If using ECharts, add the script tag.

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
<!-- Add ECharts if using data visualizations -->
<script src="https://cdn.jsdelivr.net/npm/echarts@5.5.0/dist/echarts.min.js"></script>
<style>
/* PASTE base.css HERE */
/* OPTIONALLY PASTE theme override HERE */
</style>
</head>
<body>
<!-- COMPONENTS GO HERE -->
<!-- ECharts initialization scripts go at end of body -->
</body>
</html>
```

## Full-Bleed Cover (with AI-generated illustration)

Use for premium reports that need a cinematic cover image. Generate the image using `scripts/generate-image.sh` or fal.ai API, then embed it.

```html
<section class="cover-full">
  <img class="cover-bg" src="cover-image.jpg" alt="">
  <div class="cover-overlay"></div>
  <div class="cover-content">
    <div class="cover-kicker">Organization / Report Series</div>
    <h1>Report <em>Title</em></h1>
    <hr class="cover-rule">
    <p class="cover-sub">One-sentence description of what this report covers and why it matters.</p>
    <div class="cover-meta">
      <div><strong>Published</strong>&ensp;March 2026</div>
      <div><strong>Authors</strong>&ensp;Name, Name</div>
    </div>
  </div>
</section>
```

For the image source, you can use:
- A file path relative to the HTML: `src="cover.jpg"`
- A remote URL: `src="https://..."`
- Base64 inline: `src="data:image/jpeg;base64,..."`

## Section Hero (full-width image break)

Use between major sections for visual rhythm — like Bain and Deloitte chapter openers.

```html
<div class="section-hero">
  <img src="section-image.jpg" alt="">
  <div class="section-hero-overlay">
    <div class="section-hero-text">
      <div class="section-label">Chapter 2</div>
      <h2 class="section-title">Section heading text</h2>
    </div>
  </div>
</div>
```

## Top Bar

```html
<div class="top-bar">Organization Name<span class="sep">·</span>Report Type<span class="sep">·</span>Date</div>
```

## Hero

```html
<section class="hero">
  <div class="hero-inner">
    <div class="hero-kicker">Organization / Report Series</div>
    <h1>Report <em>Title</em></h1>
    <hr class="hero-rule">
    <p class="hero-sub">One-sentence description of what this report covers.</p>
    <div class="hero-details">
      <div><strong>Published</strong>&ensp;March 2026</div>
      <div><strong>Authors</strong>&ensp;Name, Name</div>
      <div><strong>Reading time</strong>&ensp;10 min</div>
    </div>
  </div>
</section>
```

## Executive Summary

```html
<section class="exec-summary">
  <div class="container">
    <div class="section-label">Executive Summary</div>
    <p class="lead drop-cap">Opening sentence with a <strong>bold key phrase</strong> that draws the reader in. This is the lead paragraph — use weight 300 for an elegant, light feel.</p>
    <p>Second paragraph with supporting details. Keep these under 700px max-width for comfortable line lengths.</p>
    <p>Third paragraph if needed. Be concise.</p>
  </div>
</section>
```

## Stat Banner

```html
<section class="stat-banner">
  <div class="container">
    <div class="stat-grid">
      <div class="stat-item">
        <div class="stat-number">42K</div>
        <div class="stat-unit">Label</div>
        <div class="stat-desc">Brief description of this metric</div>
      </div>
      <!-- Repeat for 3–4 stats total -->
    </div>
  </div>
</section>
```

## Section Header

```html
<div class="section-label">Chapter N</div>
<h2 class="section-title">Section heading text</h2>
<p class="section-intro">Optional introductory paragraph for this section. Sets context before the detail begins.</p>
```

## Exhibit — Bar Chart

```html
<div class="exhibit">
  <div class="exhibit-label">Exhibit N</div>
  <div class="exhibit-title">Chart title in Instrument Serif</div>
  <div class="exhibit-subtitle">Description of what's measured, units, time period</div>
  <div class="bar-chart">
    <div class="bar-row">
      <div class="bar-label">Item A</div>
      <div class="bar-track"><div class="bar-fill c-1" style="width:85%"></div></div>
      <div class="bar-value">85%</div>
    </div>
    <div class="bar-row">
      <div class="bar-label">Item B</div>
      <div class="bar-track"><div class="bar-fill c-2" style="width:62%"></div></div>
      <div class="bar-value">62%</div>
    </div>
    <div class="bar-row">
      <div class="bar-label">Item C</div>
      <div class="bar-track"><div class="bar-fill c-3" style="width:45%"></div></div>
      <div class="bar-value">45%</div>
    </div>
  </div>
  <p class="exhibit-source">Source: attribution text</p>
</div>
```

**Important:** Always use inline `style="width:X%"` on `.bar-fill` for PDF. JS-based animations won't run in headless Chromium.

## Exhibit — Timeline

```html
<div class="exhibit">
  <div class="exhibit-label">Exhibit N</div>
  <div class="exhibit-title">Timeline title</div>
  <div class="exhibit-subtitle">Time period covered</div>
  <div class="timeline">
    <div class="timeline-item">
      <div class="timeline-date">Date</div>
      <div class="timeline-title">Event Title</div>
      <div class="timeline-desc">Description of what happened and why it matters.</div>
    </div>
    <!-- Repeat for each event -->
  </div>
  <p class="exhibit-source">Source: attribution</p>
</div>
```

## Exhibit — Data Table

```html
<div class="exhibit">
  <div class="exhibit-label">Exhibit N</div>
  <div class="exhibit-title">Table title</div>
  <div class="exhibit-subtitle">What this data shows</div>
  <table class="data-table">
    <thead>
      <tr><th>Column 1</th><th>Column 2</th><th>Column 3</th></tr>
    </thead>
    <tbody>
      <tr><td>Data</td><td class="heat-high">Highlighted</td><td>Data</td></tr>
      <tr><td>Data</td><td class="heat-med">Medium</td><td>Data</td></tr>
      <tr><td>Data</td><td class="heat-low">Subtle</td><td>Data</td></tr>
    </tbody>
  </table>
  <p class="exhibit-source">Source: attribution</p>
</div>
```

Heat map classes: `.heat-high` (strong), `.heat-med` (moderate), `.heat-low` (subtle).

## Exhibit — Donut Chart

```html
<div class="exhibit">
  <div class="exhibit-label">Exhibit N</div>
  <div class="exhibit-title">Distribution title</div>
  <div class="exhibit-subtitle">What this breakdown shows</div>
  <div class="donut-section">
    <div class="donut" style="background:conic-gradient(var(--terra) 0deg 130deg, var(--ink) 130deg 230deg, var(--copper) 230deg 310deg, var(--sage) 310deg 360deg)"></div>
    <div class="donut-legend">
      <div class="legend-item"><div class="legend-swatch" style="background:var(--terra)"></div><div class="legend-pct">36%</div>Category A</div>
      <div class="legend-item"><div class="legend-swatch" style="background:var(--ink)"></div><div class="legend-pct">28%</div>Category B</div>
      <div class="legend-item"><div class="legend-swatch" style="background:var(--copper)"></div><div class="legend-pct">22%</div>Category C</div>
      <div class="legend-item"><div class="legend-swatch" style="background:var(--sage)"></div><div class="legend-pct">14%</div>Category D</div>
    </div>
  </div>
  <p class="exhibit-source">Source: attribution</p>
</div>
```

**Converting percentages to degrees:** multiply each percentage by 3.6 (e.g., 36% = 129.6°).

## Insight Cards

```html
<div class="insight-grid">
  <div class="insight-card">
    <div class="insight-number">01</div>
    <div class="insight-title">Insight title</div>
    <div class="insight-text">Description text explaining this insight in 1–3 sentences.</div>
  </div>
  <div class="insight-card">
    <div class="insight-number">02</div>
    <div class="insight-title">Insight title</div>
    <div class="insight-text">Description text.</div>
  </div>
  <div class="insight-card">
    <div class="insight-number">03</div>
    <div class="insight-title">Insight title</div>
    <div class="insight-text">Description text.</div>
  </div>
</div>
```

## Pull Quote

```html
<div class="pull-quote">
  <blockquote>"Quote text goes here — keep it impactful and concise."</blockquote>
  <cite>— Name, Title or Role</cite>
</div>
```

## Two-Column Text

```html
<div class="two-col">
  <div>
    <p>Left column paragraph text. Good for comparative analysis or splitting a long narrative into digestible columns.</p>
    <p>Second paragraph in left column.</p>
  </div>
  <div>
    <p>Right column paragraph text. Mirrors the left in structure and weight.</p>
    <p>Second paragraph in right column.</p>
  </div>
</div>
```

## Implications Grid

```html
<div class="implications-grid">
  <div class="impl-card">
    
    <div class="impl-title">Takeaway title</div>
    <div class="impl-text">What this means and what action to take.</div>
  </div>
  <div class="impl-card">
    
    <div class="impl-title">Takeaway title</div>
    <div class="impl-text">Description of implication.</div>
  </div>
  <div class="impl-card">
    
    <div class="impl-title">Takeaway title</div>
    <div class="impl-text">Description of implication.</div>
  </div>
  <div class="impl-card">
    
    <div class="impl-title">Takeaway title</div>
    <div class="impl-text">Description of implication.</div>
  </div>
</div>
```

## Callout Box

```html
<div class="callout">
  <strong>Key point:</strong> Important supplementary information that deserves visual separation from the main text. Use sparingly.
</div>
```

## Table of Contents

Place after the hero or executive summary. Use for reports with 3+ sections.

```html
<section class="toc">
  <div class="container">
    <div class="toc-title">Contents</div>
    <ul class="toc-list">
      <li class="toc-item"><span class="toc-chapter">Executive Summary</span><span class="toc-dots"></span><span class="toc-page">2</span></li>
      <li class="toc-item"><span class="toc-chapter">Chapter 1: Section Title</span><span class="toc-dots"></span><span class="toc-page">3</span></li>
      <li class="toc-item"><span class="toc-chapter">Chapter 2: Section Title</span><span class="toc-dots"></span><span class="toc-page">5</span></li>
      <li class="toc-item"><span class="toc-chapter">Chapter 3: Section Title</span><span class="toc-dots"></span><span class="toc-page">7</span></li>
      <li class="toc-item"><span class="toc-chapter">Appendix: Methodology</span><span class="toc-dots"></span><span class="toc-page">9</span></li>
    </ul>
  </div>
</section>
```

Note: Page numbers in the TOC are approximate — Chromium headless pagination is not 100% predictable. Use reasonable estimates based on content length.

## Sidebar / Case Study Box

Use for case studies, definitions, methodology notes, or any supplementary content that deserves visual separation from the main flow.

```html
<div class="sidebar">
  <div class="sidebar-label">Case Study</div>
  <div class="sidebar-title">How Acme Corp Transformed Their Workflow</div>
  <p>Brief narrative about a specific organization, study, or example that illustrates the report's arguments.</p>
  <p>A second paragraph with additional detail or outcomes. Keep sidebars to 2–3 paragraphs maximum.</p>
</div>
```

## Footnotes

Place at the bottom of a section when source citations or methodology notes are needed.

```html
<div class="footnotes">
  <p><span class="fn-ref">1</span> Source description or methodology note.</p>
  <p><span class="fn-ref">2</span> Additional citation or caveat.</p>
</div>
```

Use `<span class="fn-ref">N</span>` inline in body text to create superscript reference markers.

## Separator

```html
<div class="separator">◆ ◆ ◆</div>
```

## Footer

```html
<footer>
  <div class="container">
    <p>Disclaimer or additional context text. Keep it brief and relevant.</p>
    <div class="footer-bottom">
      <span>© 2026 Organization Name</span>
      <span>All rights reserved</span>
    </div>
  </div>
</footer>
```
