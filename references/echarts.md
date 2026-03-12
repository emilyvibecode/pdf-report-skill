# ECharts Integration Reference

Use Apache ECharts for professional data visualization. Load via CDN in the HTML. Charts render in headless Chromium when `--virtual-time-budget=5000` is set.

## Setup

Add to the HTML `<head>`:
```html
<script src="https://cdn.jsdelivr.net/npm/echarts@5.5.0/dist/echarts.min.js"></script>
```

**Critical for PDF rendering:** When using `render.sh` or direct Chromium, add `--virtual-time-budget=5000` to ensure JS finishes executing before capture.

## Palette Configuration

Use our warm earth tone palette consistently:

```javascript
var palette = {
  terra:    '#B85C38',  // Primary accent
  ink:      '#2C2420',  // Dark
  copper:   '#C97B4B',  // Secondary warm
  sage:     '#6B7F5E',  // Green
  clay:     '#8C7E7A',  // Muted
  sand:     '#D4B896',  // Light warm
  ochre:    '#C4933E',  // Golden
  border:   '#E5DDD5',  // Grid lines
  wash:     '#F3EDE7',  // Light background
  body:     '#4A4340',  // Text
  stone:    '#6B6260',  // Secondary text
};

var fontSans = "'Instrument Sans', 'Helvetica Neue', sans-serif";
var fontSerif = "'Instrument Serif', Georgia, serif";
```

## Chart Templates

### Horizontal Bar Chart
```javascript
echarts.init(el).setOption({
  grid: { left: 130, right: 60, top: 10, bottom: 20 },
  xAxis: {
    type: 'value', max: 100,
    axisLine: { show: false },
    axisTick: { show: false },
    splitLine: { lineStyle: { color: palette.border, type: 'dashed' } },
    axisLabel: { color: palette.clay, fontFamily: fontSans, fontSize: 11 }
  },
  yAxis: {
    type: 'category',
    data: ['Category A', 'Category B', 'Category C'],
    inverse: true,
    axisLine: { show: false },
    axisTick: { show: false },
    axisLabel: { color: palette.ink, fontFamily: fontSans, fontSize: 12, fontWeight: 500 }
  },
  series: [{
    type: 'bar', barWidth: 20,
    data: [85, 62, 45],
    itemStyle: {
      borderRadius: [0, 2, 2, 0],
      color: function(p) {
        var colors = [palette.terra, palette.ink, palette.copper, palette.sage, palette.clay];
        return colors[p.dataIndex % colors.length];
      }
    },
    label: {
      show: true, position: 'right',
      color: palette.ink, fontFamily: fontSans, fontSize: 12, fontWeight: 600,
      formatter: '{c}%'
    }
  }]
});
```

### Line / Area Chart
```javascript
echarts.init(el).setOption({
  grid: { left: 50, right: 20, top: 20, bottom: 40 },
  xAxis: {
    type: 'category',
    data: ['Q1', 'Q2', 'Q3', 'Q4'],
    axisLine: { lineStyle: { color: palette.border } },
    axisTick: { show: false },
    axisLabel: { color: palette.clay, fontFamily: fontSans, fontSize: 10 }
  },
  yAxis: {
    type: 'value',
    axisLine: { show: false },
    axisTick: { show: false },
    splitLine: { lineStyle: { color: palette.border, type: 'dashed' } },
    axisLabel: { color: palette.clay, fontFamily: fontSans, fontSize: 10 }
  },
  legend: {
    bottom: 0,
    textStyle: { fontFamily: fontSans, fontSize: 11, color: palette.stone },
    icon: 'roundRect', itemWidth: 14, itemHeight: 3
  },
  series: [{
    name: 'Series A', type: 'line',
    data: [100, 120, 150, 190],
    smooth: 0.3,
    lineStyle: { width: 2.5, color: palette.terra },
    itemStyle: { color: palette.terra },
    symbol: 'none',
    areaStyle: {
      color: {
        type: 'linear', x: 0, y: 0, x2: 0, y2: 1,
        colorStops: [
          { offset: 0, color: 'rgba(184,92,56,0.08)' },
          { offset: 1, color: 'rgba(184,92,56,0)' }
        ]
      }
    }
  }]
});
```

### Donut Chart
```javascript
echarts.init(el).setOption({
  series: [{
    type: 'pie', radius: ['48%', '76%'], center: ['35%', '50%'],
    data: [
      { value: 35, name: 'Category A', itemStyle: { color: palette.terra } },
      { value: 30, name: 'Category B', itemStyle: { color: palette.ink } },
      { value: 20, name: 'Category C', itemStyle: { color: palette.copper } },
      { value: 15, name: 'Category D', itemStyle: { color: palette.sage } }
    ],
    label: {
      show: true, fontFamily: fontSans, fontSize: 11,
      color: palette.body, lineHeight: 15,
      formatter: '{b}\n{d}%'
    },
    labelLine: { lineStyle: { color: palette.border } },
    emphasis: { scaleSize: 3 }
  }]
});
```

### Stacked Bar Chart
```javascript
echarts.init(el).setOption({
  grid: { left: 50, right: 20, top: 10, bottom: 40 },
  xAxis: {
    type: 'category', data: ['2022', '2023', '2024', '2025', '2026'],
    axisLine: { lineStyle: { color: palette.border } },
    axisTick: { show: false },
    axisLabel: { color: palette.clay, fontFamily: fontSans, fontSize: 11 }
  },
  yAxis: {
    type: 'value', max: 100,
    axisLine: { show: false }, axisTick: { show: false },
    splitLine: { lineStyle: { color: palette.border, type: 'dashed' } },
    axisLabel: { color: palette.clay, fontFamily: fontSans, fontSize: 10, formatter: '{value}%' }
  },
  legend: {
    bottom: 0,
    textStyle: { fontFamily: fontSans, fontSize: 10, color: palette.stone },
    icon: 'roundRect', itemWidth: 12, itemHeight: 3, itemGap: 16
  },
  series: [
    { name: 'Base', type: 'bar', stack: 'a', data: [65, 58, 48, 38, 28], itemStyle: { color: palette.clay }, barWidth: 36 },
    { name: 'Growth', type: 'bar', stack: 'a', data: [20, 25, 32, 38, 43], itemStyle: { color: palette.terra } },
    { name: 'New', type: 'bar', stack: 'a', data: [15, 17, 20, 24, 29], itemStyle: { color: palette.ink, borderRadius: [2, 2, 0, 0] } }
  ]
});
```

## Chart Container HTML Pattern

Wrap ECharts in our exhibit component:

```html
<div class="exhibit">
  <div class="exhibit-label">Exhibit N</div>
  <div class="exhibit-title">Chart title</div>
  <div class="exhibit-subtitle">Description of data, time period, units</div>
  <div id="chart-N" style="width:100%;height:320px;"></div>
  <p class="exhibit-source">Source: attribution</p>
</div>
```

## Tips

- Set explicit width/height on chart containers (don't rely on responsive sizing in PDF)
- Use `renderer: 'svg'` in `echarts.init(el, null, {renderer: 'svg'})` for crisper PDF output
- Keep chart height between 280-400px for good proportions in reports
- Always include source attribution below charts
- Use at most 5-6 data series per chart — more becomes unreadable
- For percentage charts, always label with `%` suffix
