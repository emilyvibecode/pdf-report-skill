#!/usr/bin/env node
/**
 * render-pdf.js — HTML → PDF via Puppeteer
 * Waits for fonts + JS (ECharts etc) to fully render before generating PDF.
 * Usage: node render-pdf.js <input.html> [output.pdf]
 */
const puppeteer = require('puppeteer');
const path = require('path');
const fs = require('fs');

const input = process.argv[2];
const output = process.argv[3] || input.replace(/\.html$/i, '.pdf');

if (!input) {
  console.error('Usage: node render-pdf.js <input.html> [output.pdf]');
  process.exit(1);
}

const inputPath = path.resolve(input);
const outputPath = path.resolve(output);

if (!fs.existsSync(inputPath)) {
  console.error(`ERROR: Input file not found: ${inputPath}`);
  process.exit(1);
}

(async () => {
  console.log(`Rendering: ${path.basename(inputPath)} → ${path.basename(outputPath)}`);

  const browser = await puppeteer.launch({
    headless: 'new',
    args: ['--no-sandbox', '--disable-dev-shm-usage', '--disable-gpu'],
    executablePath: (() => {
      for (const cmd of ['chromium', 'chromium-browser', 'google-chrome', 'google-chrome-stable']) {
        try { return require('child_process').execSync(`which ${cmd}`).toString().trim(); } catch {}
      }
      return undefined;
    })()
  });

  const page = await browser.newPage();

  // Navigate to the HTML file
  await page.goto(`file://${inputPath}`, { waitUntil: 'networkidle0', timeout: 30000 });

  // Wait for fonts to load
  await page.evaluate(() => document.fonts.ready);

  // Wait for ECharts/Chart.js to render (if present)
  const hasCharts = await page.evaluate(() => {
    return typeof echarts !== 'undefined' || typeof Chart !== 'undefined';
  });
  if (hasCharts) {
    console.log('  Detected charting library — waiting for render...');
    await new Promise(r => setTimeout(r, 2000));
  }

  // Generate PDF — prefer CSS @page size if set (enables landscape, A4, custom sizes)
  await page.pdf({
    path: outputPath,
    format: 'Letter',
    preferCSSPageSize: true,
    printBackground: true,
    margin: { top: 0, right: 0, bottom: 0, left: 0 }
  });

  await browser.close();

  // Validate
  const stats = fs.statSync(outputPath);
  if (stats.size < 1000) {
    console.error('ERROR: PDF is suspiciously small.');
    process.exit(1);
  }
  const header = fs.readFileSync(outputPath, { encoding: 'utf8', length: 5 }).slice(0, 5);
  if (!header.startsWith('%PDF')) {
    console.error('ERROR: Output is not a valid PDF.');
    process.exit(1);
  }

  const kb = Math.round(stats.size / 1024);
  console.log(`✓ PDF created: ${path.basename(outputPath)} (${kb}KB)`);
})().catch(err => {
  console.error(`ERROR: ${err.message}`);
  process.exit(1);
});
