import 'package:flutter/material.dart';

import 'design_system.dart';

/// DesignTokens is the design-system-agnostic surface widgets read instead of
/// hardcoded colors/type/spacing (SA-UI-1). One implementation per design
/// system ([LevelTokens], [CarbonTokens]); a contract selects which via
/// [DesignSystem], and [DesignTokenScope] makes the active set available down
/// the tree.
///
/// The token vocabulary is **semantic** (backgroundPrimary, contentTertiary,
/// success, …) — not raw palette — so the same widget code renders correctly
/// in either language. Values are resolved per [Brightness] so light/dark are
/// a single switch.
@immutable
abstract class DesignTokens {
  const DesignTokens();

  DesignSystem get system;
  Brightness get brightness;

  // ── color: surfaces ─────────────────────────────────────────────────────
  Color get backgroundPrimary;
  Color get backgroundSecondary;
  Color get backgroundTertiary;
  Color get backgroundInverse;

  // ── color: content/text ─────────────────────────────────────────────────
  Color get contentPrimary;
  Color get contentSecondary;
  Color get contentTertiary;
  Color get contentInverse;
  Color get contentDisabled;

  // ── color: brand + semantic ─────────────────────────────────────────────
  Color get accent;
  Color get success;
  Color get warning;
  Color get error;
  Color get border;

  // ── type scale ───────────────────────────────────────────────────────────
  /// Font family for the system (level uses the app default; carbon uses IBM
  /// Plex-style). Null means "inherit the ambient default".
  String? get fontFamily;
  TextStyle get displayLarge;
  TextStyle get headingMedium;
  TextStyle get bodyMedium;
  TextStyle get label; // dense table/label text — the data-dense workhorse
  TextStyle get mono; // numeric/code cells

  // ── spacing scale (4/8-based) ────────────────────────────────────────────
  double get space1; // 4
  double get space2; // 8
  double get space3; // 12 (carbon) / 16 (level)
  double get space4; // 16/24
  double get space6; // 24/32

  // ── shape + elevation ────────────────────────────────────────────────────
  double get radiusSmall;
  double get radiusMedium;
  double get radiusLarge;
  List<BoxShadow> get elevation1;

  // ─────────────────────────────────────────────────────────────────────────
  // SA-UI-8: EP&N bridge tokens.
  //
  // The experience brief (§7/§11/§14.4) requires level and carbon to read as
  // *dialects of one voice* — a shared accent family, semantic state set,
  // interaction states, spacing rhythm, type-scale relationships, motion and
  // iconography. These live as concrete, derived defaults here so both systems
  // inherit one coherent set; a system overrides only where its language truly
  // diverges. Everything is expressed in terms of the semantic tokens above,
  // so they stay correct under light/dark and any palette change.
  // ─────────────────────────────────────────────────────────────────────────

  bool get isDark => brightness == Brightness.dark;

  // interaction states — hover/active surfaces, selected row, accent ramp, focus
  Color get backgroundHover => contentPrimary.withOpacity(isDark ? 0.08 : 0.05);
  Color get backgroundActive => contentPrimary.withOpacity(isDark ? 0.13 : 0.09);
  Color get layerHover => contentPrimary.withOpacity(isDark ? 0.10 : 0.06);
  Color get selectedSurface => accent.withOpacity(0.12);
  Color get accentHover =>
      Color.alphaBlend((isDark ? Colors.white : Colors.black).withOpacity(0.14), accent);
  Color get accentSubtle => accent.withOpacity(0.12);
  Color get focusBorder => accent;

  // borders — hairline / strong divider / interactive
  Color get borderSubtle => border;
  Color get borderStrong => contentTertiary;
  Color get borderInteractive => accent;

  // field/input surface (carbon distinguishes field from layer)
  Color get field => backgroundSecondary;

  // semantic: info + subtle "support" tints for inline messages / badges /
  // ambient-state callouts (e.g. metering "local = 0", "why-not-running").
  Color get info => accent;
  Color get successSubtle => success.withOpacity(0.12);
  Color get warningSubtle => warning.withOpacity(0.16);
  Color get errorSubtle => error.withOpacity(0.12);
  Color get infoSubtle => info.withOpacity(0.12);

  // type-scale fill — dense tables (bodySmall/caption), metrics (displayMedium),
  // section headings (headingLarge/Small). Derived from each system's own base
  // styles so family/weight/letter-spacing stay on-language.
  TextStyle get displayMedium => displayLarge.copyWith(fontSize: 24);
  TextStyle get headingLarge => headingMedium.copyWith(fontSize: 20);
  TextStyle get headingSmall => headingMedium.copyWith(fontSize: 14);
  TextStyle get bodySmall => bodyMedium.copyWith(fontSize: 12);
  TextStyle get caption => label.copyWith(fontSize: 11);

  // spacing fill — keeps the 4/8 rhythm continuous for larger layouts.
  double get space5 => space4 + space1;
  double get space7 => space6 + space2;
  double get space8 => space6 + space4;

  // motion — deliberately shared across both languages (§7/§9/§12: one rhythm,
  // dignified beats). Animations read tokens instead of hardcoding Durations.
  Duration get durationFast => const Duration(milliseconds: 110);
  Duration get durationModerate => const Duration(milliseconds: 240);
  Duration get durationSlow => const Duration(milliseconds: 400);
  Curve get easingStandard => Curves.easeInOutCubic;
  Curve get easingEntrance => Curves.easeOutCubic;

  // iconography rhythm — shared icon sizes (§11 "shared iconography family").
  double get iconSizeSmall => 16;
  double get iconSizeMedium => 20;
  double get iconSizeLarge => 24;

  /// Resolve the token set for a system + brightness.
  static DesignTokens resolve(DesignSystem system, Brightness brightness) {
    switch (system) {
      case DesignSystem.carbon:
        return CarbonTokens(brightness);
      case DesignSystem.level:
        return LevelTokens(brightness);
    }
  }

  /// The active token set from the nearest [DesignTokenScope], or level/light
  /// as a safe default when none is present.
  static DesignTokens of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<DesignTokenScope>();
    return scope?.tokens ?? LevelTokens(Theme.of(context).brightness);
  }
}

/// Level tokens — the Material-flavored consumer default. Values approximate the
/// existing `LevelColors`/`LevelTheme` palette so adopting tokens is visually
/// neutral; widgets already on LevelColors can migrate incrementally.
@immutable
class LevelTokens extends DesignTokens {
  const LevelTokens(this.brightness);
  @override
  final Brightness brightness;
  @override
  DesignSystem get system => DesignSystem.level;

  bool get _dark => brightness == Brightness.dark;

  // EP&N v2 bridge tokens (SA-UI-8). Light level surface is *warm paper*
  // (oklch 0.975/0.006/85 ≈ #F9F6F2), warm near-black ink (oklch 0.25/0.02/60),
  // and the shared **purple** accent (oklch 0.50/0.13/300) used in *both*
  // dialects — the conscious "purple everywhere" decision from the v2 design
  // review, replacing the old blue. Dark level is purple-tinted (hue 300) so
  // level and carbon read as one house. §7/§14.4.
  @override
  Color get backgroundPrimary => _dark ? const Color(0xFF14111B) : const Color(0xFFF9F6F2);
  @override
  Color get backgroundSecondary => _dark ? const Color(0xFF1E1A28) : const Color(0xFFE8E4DC);
  @override
  Color get backgroundTertiary => _dark ? const Color(0xFF2A2536) : const Color(0xFFDED9CF);
  @override
  Color get backgroundInverse => _dark ? const Color(0xFFF9F6F2) : const Color(0xFF14111B);

  @override
  Color get contentPrimary => _dark ? const Color(0xFFF4F0EA) : const Color(0xFF291F18);
  @override
  Color get contentSecondary => _dark ? const Color(0xFFBDB6C4) : const Color(0xFF564B42);
  @override
  Color get contentTertiary => _dark ? const Color(0xFF8F8799) : const Color(0xFF6C6158);
  @override
  Color get contentInverse => _dark ? const Color(0xFF14111B) : const Color(0xFFFFFFFF);
  @override
  Color get contentDisabled => (_dark ? Colors.white : Colors.black).withOpacity(0.38);

  @override
  Color get accent => const Color(0xFF6F4FA1); // oklch 0.50/0.13/300 — brand purple
  @override
  Color get accentHover => const Color(0xFF583A84); // oklch 0.42/0.12/300
  @override
  Color get success => const Color(0xFF007840); // oklch 0.50/0.13/155 — safe/local/earnings
  @override
  Color get warning => const Color(0xFFB37903); // oklch 0.62/0.13/75 — caution
  @override
  Color get error => const Color(0xFFB94642); // oklch 0.55/0.15/25
  @override
  Color get info => const Color(0xFF6F4FA1);
  @override
  Color get border => _dark ? const Color(0xFF2A2536) : const Color(0xFFDCD6CC);

  @override
  String? get fontFamily => 'Albert Sans';
  @override
  TextStyle get displayLarge => TextStyle(fontFamily: fontFamily, fontSize: 32, fontWeight: FontWeight.w700, color: contentPrimary);
  @override
  TextStyle get headingMedium => TextStyle(fontFamily: fontFamily, fontSize: 18, fontWeight: FontWeight.w600, color: contentPrimary);
  @override
  TextStyle get bodyMedium => TextStyle(fontFamily: fontFamily, fontSize: 14, fontWeight: FontWeight.w400, color: contentPrimary);
  @override
  TextStyle get label => TextStyle(fontFamily: fontFamily, fontSize: 12, fontWeight: FontWeight.w500, color: contentSecondary, letterSpacing: 0.4);
  @override
  TextStyle get mono => TextStyle(fontFamily: 'monospace', fontSize: 12, color: contentPrimary);

  @override
  double get space1 => 4;
  @override
  double get space2 => 8;
  @override
  double get space3 => 16;
  @override
  double get space4 => 24;
  @override
  double get space6 => 32;

  @override
  double get radiusSmall => 8;
  @override
  double get radiusMedium => 12;
  @override
  double get radiusLarge => 16;
  @override
  List<BoxShadow> get elevation1 => [
        BoxShadow(color: Colors.black.withOpacity(_dark ? 0.4 : 0.06), blurRadius: 12, offset: const Offset(0, 2)),
      ];
}

/// Carbon tokens — IBM Carbon palette/type/spacing: enterprise-legible,
/// data-dense, WCAG-minded. Squarer corners, tighter spacing, IBM Plex type,
/// and Carbon's Blue 60 / Gray 100 ramps.
@immutable
class CarbonTokens extends DesignTokens {
  const CarbonTokens(this.brightness);
  @override
  final Brightness brightness;
  @override
  DesignSystem get system => DesignSystem.carbon;

  bool get _dark => brightness == Brightness.dark;

  // Carbon Gray ramp (g100 dark theme / g10 light theme) + Blue 60 accent.
  @override
  Color get backgroundPrimary => _dark ? const Color(0xFF161616) : const Color(0xFFFFFFFF);
  @override
  Color get backgroundSecondary => _dark ? const Color(0xFF262626) : const Color(0xFFF4F4F4);
  @override
  Color get backgroundTertiary => _dark ? const Color(0xFF393939) : const Color(0xFFE0E0E0);
  @override
  Color get backgroundInverse => _dark ? const Color(0xFFF4F4F4) : const Color(0xFF161616);

  @override
  Color get contentPrimary => _dark ? const Color(0xFFF4F4F4) : const Color(0xFF161616);
  @override
  Color get contentSecondary => _dark ? const Color(0xFFC6C6C6) : const Color(0xFF525252);
  @override
  Color get contentTertiary => _dark ? const Color(0xFF8D8D8D) : const Color(0xFF6F6F6F);
  @override
  Color get contentInverse => _dark ? const Color(0xFF161616) : const Color(0xFFFFFFFF);
  @override
  Color get contentDisabled => (_dark ? Colors.white : Colors.black).withOpacity(0.25);

  // EP&N v2 bridge (SA-UI-8): the *conscious purple-everywhere* decision — the
  // accent/link/focus family is the shared brand purple (oklch 0.50/0.13/300),
  // NOT IBM Blue 60, so carbon and level read as one voice. Surfaces, type and
  // 0-radius stay pure Carbon. Semantic green/red share the bridge hues (155/25).
  @override
  Color get accent => const Color(0xFF6F4FA1); // oklch 0.50/0.13/300 — brand purple
  @override
  Color get accentHover => const Color(0xFF583A84); // oklch 0.42/0.12/300
  @override
  Color get success => const Color(0xFF007840); // oklch 0.50/0.13/155
  @override
  Color get warning => const Color(0xFFB37903); // oklch 0.62/0.13/75
  @override
  Color get error => const Color(0xFFB94642); // oklch 0.55/0.15/25
  @override
  Color get info => const Color(0xFF6F4FA1); // brand purple (was support-info blue)
  @override
  Color get focusBorder => const Color(0xFF6F4FA1); // brand purple focus ring
  @override
  Color get border => _dark ? const Color(0xFF393939) : const Color(0xFFE0E0E0);

  @override
  String? get fontFamily => 'IBM Plex Sans';
  @override
  TextStyle get displayLarge => TextStyle(fontFamily: fontFamily, fontSize: 32, fontWeight: FontWeight.w300, color: contentPrimary, letterSpacing: 0);
  @override
  TextStyle get headingMedium => TextStyle(fontFamily: fontFamily, fontSize: 16, fontWeight: FontWeight.w600, color: contentPrimary);
  @override
  TextStyle get bodyMedium => TextStyle(fontFamily: fontFamily, fontSize: 14, fontWeight: FontWeight.w400, color: contentPrimary, letterSpacing: 0.16);
  @override
  TextStyle get label => TextStyle(fontFamily: fontFamily, fontSize: 12, fontWeight: FontWeight.w400, color: contentSecondary, letterSpacing: 0.32);
  @override
  TextStyle get mono => TextStyle(fontFamily: 'IBM Plex Mono', fontSize: 12, color: contentPrimary);

  // Carbon spacing tokens (4-based, tighter than level).
  @override
  double get space1 => 4; // $spacing-02
  @override
  double get space2 => 8; // $spacing-03
  @override
  double get space3 => 12; // $spacing-04
  @override
  double get space4 => 16; // $spacing-05
  @override
  double get space6 => 24; // $spacing-06

  // Carbon is famously near-square.
  @override
  double get radiusSmall => 0;
  @override
  double get radiusMedium => 2;
  @override
  double get radiusLarge => 4;
  @override
  List<BoxShadow> get elevation1 => [
        BoxShadow(color: Colors.black.withOpacity(_dark ? 0.5 : 0.1), blurRadius: 4, offset: const Offset(0, 1)),
      ];
}

/// Makes a [DesignTokens] set available to descendants. The engine wraps a
/// rendered eApp in this scope using the contract's design system.
class DesignTokenScope extends InheritedWidget {
  const DesignTokenScope({super.key, required this.tokens, required super.child});

  final DesignTokens tokens;

  @override
  bool updateShouldNotify(DesignTokenScope oldWidget) => oldWidget.tokens != tokens;
}
