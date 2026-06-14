import 'package:flutter/material.dart';

import 'design_tokens.dart';

/// SA-UI-9 — per-app colour scheme.
///
/// A contract declares a *colour scheme* next to its `design-language`
/// (`color-scheme: two-tone`). Components then reference **roles**
/// (`color: primary`, `color: positive`, `color: on-surface-muted`) instead of
/// raw hex, and the [ColorRoles] provider resolves those roles from the active
/// [DesignTokens] (so they stay correct under light/dark and either design
/// language). The scheme controls *how many distinct hues* an app paints with:
///
/// - **mono**  — one hue: surface + content greys + the semantic set. No brand
///   accent (everything reads as a neutral instrument).
/// - **two**   — surface + a single brand **primary** (the default).
/// - **three** — surface + **primary** + a distinct **secondary** hue.
///
/// Semantic roles (positive/negative/caution/info) are always available
/// regardless of tone count — they carry meaning, not brand.
enum AppColorScheme {
  mono,
  two,
  three;

  /// Parse a contract `color-scheme` value. Accepts `mono`/`monotone`,
  /// `two`/`two-tone`, `three`/`three-tone`. Unknown/empty → [two] (default).
  static AppColorScheme fromContract(Object? value) {
    switch (value?.toString().trim().toLowerCase().replaceAll('-', '')) {
      case 'mono':
      case 'monotone':
      case 'one':
      case 'onetone':
        return AppColorScheme.mono;
      case 'three':
      case 'threetone':
        return AppColorScheme.three;
      case 'two':
      case 'twotone':
      default:
        return AppColorScheme.two;
    }
  }

  String get id => name;
}

/// Resolves role names to concrete colours for a given [DesignTokens] set and
/// [AppColorScheme]. This is the "colour provider from jittery" the engine uses
/// for an app's compositions; the same role renders correctly in level or
/// carbon, light or dark, because every role maps onto a semantic token.
@immutable
class ColorRoles {
  const ColorRoles(this.tokens, this.scheme);

  final DesignTokens tokens;
  final AppColorScheme scheme;

  /// The brand primary, collapsed to neutral content in a [AppColorScheme.mono]
  /// app (no brand hue).
  Color get primary =>
      scheme == AppColorScheme.mono ? tokens.contentPrimary : tokens.accent;

  /// The secondary hue — only distinct in a three-tone app; otherwise it falls
  /// back to a muted neutral so two-/mono- apps stay calm.
  Color get secondary => scheme == AppColorScheme.three
      ? tokens.info
      : tokens.contentSecondary;

  /// Resolve a role name to a colour, or null when the name is unknown (callers
  /// then fall back to the ambient default). Hyphens and underscores are
  /// interchangeable (`on-surface-muted` == `on_surface_muted`).
  Color? byName(String role) {
    switch (role.trim().toLowerCase().replaceAll('_', '-')) {
      // surfaces
      case 'surface':
        return tokens.backgroundPrimary;
      case 'surface-muted':
      case 'layer':
        return tokens.backgroundSecondary;
      case 'surface-strong':
        return tokens.backgroundTertiary;
      case 'surface-inverse':
        return tokens.backgroundInverse;
      case 'field':
        return tokens.field;
      // content / text
      case 'on-surface':
      case 'content':
        return tokens.contentPrimary;
      case 'on-surface-muted':
      case 'content-muted':
        return tokens.contentSecondary;
      case 'on-surface-subtle':
      case 'content-subtle':
        return tokens.contentTertiary;
      case 'on-surface-inverse':
        return tokens.contentInverse;
      case 'disabled':
        return tokens.contentDisabled;
      // brand
      case 'primary':
      case 'accent':
        return primary;
      case 'primary-hover':
        return tokens.accentHover;
      case 'primary-subtle':
        return tokens.accentSubtle;
      case 'secondary':
        return secondary;
      // semantic (always available)
      case 'positive':
      case 'success':
        return tokens.success;
      case 'negative':
      case 'error':
      case 'danger':
        return tokens.error;
      case 'caution':
      case 'warning':
        return tokens.warning;
      case 'info':
        return tokens.info;
      case 'positive-subtle':
        return tokens.successSubtle;
      case 'negative-subtle':
        return tokens.errorSubtle;
      case 'caution-subtle':
        return tokens.warningSubtle;
      case 'info-subtle':
        return tokens.infoSubtle;
      // lines
      case 'border':
        return tokens.border;
      case 'border-subtle':
        return tokens.borderSubtle;
      case 'border-strong':
        return tokens.borderStrong;
      case 'focus':
        return tokens.focusBorder;
      default:
        return null;
    }
  }

  /// Resolve a contract `color:` spec to a colour. Backward compatible:
  /// an `int` (or `0x…`/decimal string) is treated as a raw ARGB value; a role
  /// name is resolved via [byName]. Returns null when absent or unresolvable.
  Color? resolve(Object? spec) {
    if (spec == null) return null;
    if (spec is int) return Color(spec);
    if (spec is Color) return spec;
    final s = spec.toString().trim();
    if (s.isEmpty) return null;
    // raw hex/decimal int — keep working for un-migrated contracts.
    if (s.startsWith('0x') || s.startsWith('0X')) {
      final v = int.tryParse(s.substring(2), radix: 16);
      if (v != null) return Color(v);
    }
    final asInt = int.tryParse(s);
    if (asInt != null) return Color(asInt);
    return byName(s);
  }
}

/// Makes the active [AppColorScheme] available to descendants — the engine
/// wraps a rendered eApp in this scope using the contract's declared scheme,
/// alongside the existing [DesignTokenScope].
class ColorSchemeScope extends InheritedWidget {
  const ColorSchemeScope({super.key, required this.scheme, required super.child});

  final AppColorScheme scheme;

  /// The active scheme, or [AppColorScheme.two] when none is installed.
  static AppColorScheme of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<ColorSchemeScope>();
    return scope?.scheme ?? AppColorScheme.two;
  }

  /// The colour provider for the current context — resolved tokens + scheme.
  static ColorRoles rolesOf(BuildContext context) =>
      ColorRoles(DesignTokens.of(context), of(context));

  @override
  bool updateShouldNotify(ColorSchemeScope oldWidget) => oldWidget.scheme != scheme;
}
