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

  @override
  Color get backgroundPrimary => _dark ? const Color(0xFF1A1A1A) : const Color(0xFFFFFFFF);
  @override
  Color get backgroundSecondary => _dark ? const Color(0xFF242424) : const Color(0xFFF4F4F4);
  @override
  Color get backgroundTertiary => _dark ? const Color(0xFF2E2E2E) : const Color(0xFFECECEC);
  @override
  Color get backgroundInverse => _dark ? const Color(0xFFF4F4F4) : const Color(0xFF1A1A1A);

  @override
  Color get contentPrimary => _dark ? const Color(0xFFF5F5F5) : const Color(0xFF1A1A1A);
  @override
  Color get contentSecondary => _dark ? const Color(0xFFB8B8B8) : const Color(0xFF666666);
  @override
  Color get contentTertiary => _dark ? const Color(0xFF8A8A8A) : const Color(0xFF999999);
  @override
  Color get contentInverse => _dark ? const Color(0xFF1A1A1A) : const Color(0xFFFFFFFF);
  @override
  Color get contentDisabled => (_dark ? Colors.white : Colors.black).withOpacity(0.38);

  @override
  Color get accent => const Color(0xFF3B82F6);
  @override
  Color get success => const Color(0xFF22C55E);
  @override
  Color get warning => const Color(0xFFF59E0B);
  @override
  Color get error => const Color(0xFFEF4444);
  @override
  Color get border => _dark ? const Color(0xFF333333) : const Color(0xFFE0E0E0);

  @override
  String? get fontFamily => 'Montserrat';
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

  @override
  Color get accent => const Color(0xFF0F62FE); // Carbon Blue 60
  @override
  Color get success => const Color(0xFF24A148); // Green 50
  @override
  Color get warning => const Color(0xFFF1C21B); // Yellow 30
  @override
  Color get error => const Color(0xFFDA1E28); // Red 60
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
