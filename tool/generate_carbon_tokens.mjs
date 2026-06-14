#!/usr/bin/env node
// Regenerates lib/src/design/carbon_generated_tokens.dart from official Carbon npm packages.
// Required packages in the working directory or parent Node resolution path:
//   @carbon/themes @carbon/layout @carbon/type

import { readFile, writeFile } from 'node:fs/promises';
import { dirname, resolve } from 'node:path';
import { fileURLToPath } from 'node:url';

const __dirname = dirname(fileURLToPath(import.meta.url));
const outPath = resolve(__dirname, '../lib/src/design/carbon_generated_tokens.dart');

async function importCarbonPackage(name) {
  try {
    return await import(name);
  } catch (error) {
    throw new Error(
      `Unable to import ${name}. Run npm install @carbon/themes @carbon/layout @carbon/type before regenerating. Original error: ${error.message}`,
    );
  }
}

function argb(hexOrRgba) {
  if (typeof hexOrRgba !== 'string') {
    throw new Error(`Unsupported Carbon color value: ${hexOrRgba}`);
  }
  const value = hexOrRgba.trim();
  if (value.startsWith('#')) {
    const hex = value.slice(1);
    if (hex.length === 6) return `0xFF${hex.toUpperCase()}`;
    if (hex.length === 8) return `0x${hex.slice(6, 8).toUpperCase()}${hex.slice(0, 6).toUpperCase()}`;
  }
  const rgba = value.match(/^rgba\((\d+),\s*(\d+),\s*(\d+),\s*([0-9.]+)\)$/);
  if (rgba) {
    const [, r, g, b, a] = rgba;
    const alpha = Math.round(Number(a) * 255);
    return `0x${alpha.toString(16).padStart(2, '0').toUpperCase()}${Number(r).toString(16).padStart(2, '0').toUpperCase()}${Number(g).toString(16).padStart(2, '0').toUpperCase()}${Number(b).toString(16).padStart(2, '0').toUpperCase()}`;
  }
  throw new Error(`Unsupported Carbon color value: ${value}`);
}

function px(value) {
  if (typeof value === 'number') return value;
  const text = String(value).trim();
  if (text.endsWith('px')) return Number(text.slice(0, -2));
  if (text.endsWith('rem')) return Number(text.slice(0, -3)) * 16;
  return Number(text);
}

function fontWeight(value) {
  const text = String(value ?? '400');
  if (text === 'light') return 300;
  if (text === 'regular') return 400;
  if (text === 'semibold') return 600;
  return Number(text);
}

function typeStyle(style) {
  return {
    fontSize: px(style.fontSize),
    fontWeight: fontWeight(style.fontWeight),
    lineHeight: px(style.lineHeight),
    letterSpacing: px(style.letterSpacing ?? 0),
  };
}

function theme(name, t) {
  return `const carbonTheme${name} = CarbonGeneratedTheme(\n` +
    `  background: ${argb(t.background)},\n` +
    `  backgroundInverse: ${argb(t.backgroundInverse)},\n` +
    `  layer01: ${argb(t.layer01)},\n` +
    `  layer02: ${argb(t.layer02)},\n` +
    `  layer03: ${argb(t.layer03)},\n` +
    `  field01: ${argb(t.field01)},\n` +
    `  field02: ${argb(t.field02)},\n` +
    `  textPrimary: ${argb(t.textPrimary)},\n` +
    `  textSecondary: ${argb(t.textSecondary)},\n` +
    `  textPlaceholder: ${argb(t.textPlaceholder)},\n` +
    `  textDisabled: ${argb(t.textDisabled)},\n` +
    `  textInverse: ${argb(t.textInverse)},\n` +
    `  linkPrimary: ${argb(t.linkPrimary)},\n` +
    `  iconPrimary: ${argb(t.iconPrimary)},\n` +
    `  iconSecondary: ${argb(t.iconSecondary)},\n` +
    `  iconDisabled: ${argb(t.iconDisabled)},\n` +
    `  iconInverse: ${argb(t.iconInverse)},\n` +
    `  borderSubtle01: ${argb(t.borderSubtle01)},\n` +
    `  borderStrong01: ${argb(t.borderStrong01)},\n` +
    `  borderInteractive: ${argb(t.borderInteractive)},\n` +
    `  borderDisabled: ${argb(t.borderDisabled)},\n` +
    `  interactive: ${argb(t.interactive)},\n` +
    `  supportSuccess: ${argb(t.supportSuccess)},\n` +
    `  supportWarning: ${argb(t.supportWarning)},\n` +
    `  supportError: ${argb(t.supportError)},\n` +
    `  supportInfo: ${argb(t.supportInfo)},\n` +
    `  focus: ${argb(t.focus)},\n` +
    `  overlay: ${argb(t.overlay)},\n` +
    `  skeletonElement: ${argb(t.skeletonElement)},\n` +
    `  skeletonBackground: ${argb(t.skeletonBackground)},\n` +
    `);`;
}

function styleConst(name, s) {
  return `  ${name}: CarbonGeneratedTypeStyle(fontSize: ${s.fontSize}, fontWeight: ${s.fontWeight}, lineHeight: ${s.lineHeight}, letterSpacing: ${s.letterSpacing}),`;
}

const themes = await importCarbonPackage('@carbon/themes');
const layout = await importCarbonPackage('@carbon/layout');
const type = await importCarbonPackage('@carbon/type');

const typeMap = {
  caption01: typeStyle(type.caption01),
  label01: typeStyle(type.label01),
  bodyShort01: typeStyle(type.bodyShort01),
  bodyLong01: typeStyle(type.bodyLong01),
  code01: typeStyle(type.code01),
  heading01: typeStyle(type.heading01),
  productiveHeading03: typeStyle(type.productiveHeading03),
  productiveHeading05: typeStyle(type.productiveHeading05),
  productiveHeading06: typeStyle(type.productiveHeading06),
  productiveHeading07: typeStyle(type.productiveHeading07),
  expressiveHeading03: typeStyle(type.expressiveHeading03),
  expressiveHeading05: typeStyle(type.expressiveHeading05),
};

const template = await readFile(outPath, 'utf8');
const constantsMarker = 'const carbonThemeWhite = CarbonGeneratedTheme(';
const markerIndex = template.indexOf(constantsMarker);
if (markerIndex === -1) {
  throw new Error(`Unable to find ${constantsMarker} in ${outPath}`);
}
const templateHeader = template.slice(0, markerIndex);

const dart = templateHeader +
  `${theme('White', themes.white)}\n\n` +
  `${theme('G10', themes.g10)}\n\n` +
  `${theme('G90', themes.g90)}\n\n` +
  `${theme('G100', themes.g100)}\n\n` +
  `const carbonSpacing = CarbonGeneratedSpacing(\n` +
  `  spacing01: ${px(layout.spacing01)},\n` +
  `  spacing02: ${px(layout.spacing02)},\n` +
  `  spacing03: ${px(layout.spacing03)},\n` +
  `  spacing04: ${px(layout.spacing04)},\n` +
  `  spacing05: ${px(layout.spacing05)},\n` +
  `  spacing06: ${px(layout.spacing06)},\n` +
  `  spacing07: ${px(layout.spacing07)},\n` +
  `  spacing08: ${px(layout.spacing08)},\n` +
  `  spacing09: ${px(layout.spacing09)},\n` +
  `  spacing10: ${px(layout.spacing10)},\n` +
  `  spacing11: ${px(layout.spacing11)},\n` +
  `  spacing12: ${px(layout.spacing12)},\n` +
  `  spacing13: ${px(layout.spacing13)},\n` +
  `);\n\n` +
  `const carbonLayout = CarbonGeneratedLayout(\n` +
  `  gridColumns: 16,\n` +
  `  gutter: 16,\n` +
  `  margin: 16,\n` +
  `  breakpointSmall: 320,\n` +
  `  breakpointMedium: 672,\n` +
  `  breakpointLarge: 1056,\n` +
  `  breakpointXLarge: 1312,\n` +
  `  iconSize01: ${px(layout.iconSize01)},\n` +
  `  iconSize02: ${px(layout.iconSize02)},\n` +
  `);\n\n` +
  `const carbonTypeProductive = CarbonGeneratedTypeSet(\n` +
  Object.entries(typeMap).map(([name, value]) => styleConst(name, value)).join('\n') +
  `\n);\n\n` +
  `const carbonTypeExpressive = carbonTypeProductive;\n`;
await writeFile(outPath, dart);
console.log(`Generated ${outPath}`);

