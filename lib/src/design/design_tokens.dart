import 'package:flutter/material.dart';

import 'carbon_generated_tokens.dart';
import 'design_system.dart';

enum DesignKitConformanceLevel {
  experimental,
  tokenComplete,
  componentComplete,
  pixelApproved;

  String get id {
    switch (this) {
      case DesignKitConformanceLevel.experimental:
        return 'experimental';
      case DesignKitConformanceLevel.tokenComplete:
        return 'token-complete';
      case DesignKitConformanceLevel.componentComplete:
        return 'component-complete';
      case DesignKitConformanceLevel.pixelApproved:
        return 'pixel-approved';
    }
  }
}

enum ComponentInteractionState {
  enabled,
  hover,
  active,
  focus,
  disabled,
  selected,
  error,
  loading,
}

@immutable
class DesignKitMetadata {
  const DesignKitMetadata({
    required this.id,
    required this.displayName,
    this.family,
    this.sourceUrl,
    this.sourcePackage,
    this.sourceVersion,
    this.themeId = 'default',
    this.parentKitId,
    this.aliases = const [],
    this.hasBrandOverrides = false,
    this.conformanceLevel = DesignKitConformanceLevel.experimental,
  });

  final String id;
  final String displayName;
  final String? family;
  final Uri? sourceUrl;
  final String? sourcePackage;
  final String? sourceVersion;
  final String themeId;
  final String? parentKitId;
  final List<String> aliases;
  final bool hasBrandOverrides;
  final DesignKitConformanceLevel conformanceLevel;

  DesignKitMetadata copyWith({
    String? id,
    String? displayName,
    String? family,
    Uri? sourceUrl,
    String? sourcePackage,
    String? sourceVersion,
    String? themeId,
    String? parentKitId,
    List<String>? aliases,
    bool? hasBrandOverrides,
    DesignKitConformanceLevel? conformanceLevel,
  }) {
    return DesignKitMetadata(
      id: id ?? this.id,
      displayName: displayName ?? this.displayName,
      family: family ?? this.family,
      sourceUrl: sourceUrl ?? this.sourceUrl,
      sourcePackage: sourcePackage ?? this.sourcePackage,
      sourceVersion: sourceVersion ?? this.sourceVersion,
      themeId: themeId ?? this.themeId,
      parentKitId: parentKitId ?? this.parentKitId,
      aliases: aliases ?? this.aliases,
      hasBrandOverrides: hasBrandOverrides ?? this.hasBrandOverrides,
      conformanceLevel: conformanceLevel ?? this.conformanceLevel,
    );
  }
}

@immutable
class ColorTokenSet {
  const ColorTokenSet({
    required this.background,
    required this.backgroundInverse,
    required this.layer01,
    required this.layer02,
    required this.layer03,
    required this.field01,
    required this.field02,
    required this.textPrimary,
    required this.textSecondary,
    required this.textPlaceholder,
    required this.textDisabled,
    required this.textInverse,
    required this.linkPrimary,
    required this.iconPrimary,
    required this.iconSecondary,
    required this.iconDisabled,
    required this.iconInverse,
    required this.borderSubtle,
    required this.borderStrong,
    required this.borderInteractive,
    required this.borderDisabled,
    required this.interactive,
    required this.supportSuccess,
    required this.supportWarning,
    required this.supportError,
    required this.supportInfo,
    required this.focus,
    required this.overlay,
    required this.skeletonElement,
    required this.skeletonBackground,
  });

  final Color background;
  final Color backgroundInverse;
  final Color layer01;
  final Color layer02;
  final Color layer03;
  final Color field01;
  final Color field02;
  final Color textPrimary;
  final Color textSecondary;
  final Color textPlaceholder;
  final Color textDisabled;
  final Color textInverse;
  final Color linkPrimary;
  final Color iconPrimary;
  final Color iconSecondary;
  final Color iconDisabled;
  final Color iconInverse;
  final Color borderSubtle;
  final Color borderStrong;
  final Color borderInteractive;
  final Color borderDisabled;
  final Color interactive;
  final Color supportSuccess;
  final Color supportWarning;
  final Color supportError;
  final Color supportInfo;
  final Color focus;
  final Color overlay;
  final Color skeletonElement;
  final Color skeletonBackground;
}

@immutable
class TypeTokenSet {
  const TypeTokenSet({
    required this.fontFamily,
    required this.monoFontFamily,
    required this.displayLarge,
    required this.displayMedium,
    required this.headingLarge,
    required this.headingMedium,
    required this.headingSmall,
    required this.bodyMedium,
    required this.bodySmall,
    required this.label,
    required this.caption,
    required this.mono,
  });

  final String? fontFamily;
  final String? monoFontFamily;
  final TextStyle displayLarge;
  final TextStyle displayMedium;
  final TextStyle headingLarge;
  final TextStyle headingMedium;
  final TextStyle headingSmall;
  final TextStyle bodyMedium;
  final TextStyle bodySmall;
  final TextStyle label;
  final TextStyle caption;
  final TextStyle mono;
}

@immutable
class SpacingTokenSet {
  const SpacingTokenSet({
    required this.spacing01,
    required this.spacing02,
    required this.spacing03,
    required this.spacing04,
    required this.spacing05,
    required this.spacing06,
    required this.spacing07,
    required this.spacing08,
    required this.spacing09,
    required this.spacing10,
    required this.spacing11,
    required this.spacing12,
    required this.spacing13,
  });

  final double spacing01;
  final double spacing02;
  final double spacing03;
  final double spacing04;
  final double spacing05;
  final double spacing06;
  final double spacing07;
  final double spacing08;
  final double spacing09;
  final double spacing10;
  final double spacing11;
  final double spacing12;
  final double spacing13;
}

@immutable
class LayoutTokenSet {
  const LayoutTokenSet({
    required this.gridColumns,
    required this.gutter,
    required this.margin,
    required this.breakpointSmall,
    required this.breakpointMedium,
    required this.breakpointLarge,
    required this.breakpointXLarge,
  });

  final int gridColumns;
  final double gutter;
  final double margin;
  final double breakpointSmall;
  final double breakpointMedium;
  final double breakpointLarge;
  final double breakpointXLarge;
}

@immutable
class MotionTokenSet {
  const MotionTokenSet({
    required this.durationFast,
    required this.durationModerate,
    required this.durationSlow,
    required this.easingStandard,
    required this.easingEntrance,
  });

  final Duration durationFast;
  final Duration durationModerate;
  final Duration durationSlow;
  final Curve easingStandard;
  final Curve easingEntrance;
}

@immutable
class ComponentStateTokenSet {
  const ComponentStateTokenSet({
    required this.hover,
    required this.active,
    required this.selected,
    required this.focus,
    required this.disabled,
    required this.loading,
  });

  final Color hover;
  final Color active;
  final Color selected;
  final Color focus;
  final Color disabled;
  final Color loading;
}

typedef DesignTokenBuilder = DesignTokens Function(Brightness brightness);

@immutable
class DesignKit {
  const DesignKit({required this.metadata, required this.tokensBuilder});

  final DesignKitMetadata metadata;
  final DesignTokenBuilder tokensBuilder;

  Iterable<String> get keys sync* {
    yield metadata.id;
    for (final alias in metadata.aliases) {
      yield alias;
    }
  }
}

class DesignKitRegistry {
  DesignKitRegistry._();

  static final Map<String, DesignKit> _kits = <String, DesignKit>{};
  static bool _defaultsRegistered = false;

  static void _ensureDefaults() {
    if (_defaultsRegistered) return;
    _defaultsRegistered = true;

    _registerDefault(
      DesignKit(
        metadata: const DesignKitMetadata(
          id: 'level',
          displayName: 'Level',
          family: 'level',
          themeId: 'default',
          aliases: ['default', 'local', 'material'],
          conformanceLevel: DesignKitConformanceLevel.experimental,
        ),
        tokensBuilder: (brightness) => LevelTokens(brightness),
      ),
    );

    _registerDefault(
      DesignKit(
        metadata: DesignKitMetadata(
          id: 'carbon',
          displayName: 'IBM Carbon',
          family: 'carbon',
          sourceUrl: Uri.parse('https://carbondesignsystem.com/'),
          sourcePackage: '@carbon/themes',
          sourceVersion: 'Carbon v11 theme roles',
          themeId: 'white/g10/g90/g100',
          aliases: const ['ibm-carbon'],
          conformanceLevel: DesignKitConformanceLevel.tokenComplete,
        ),
        tokensBuilder: (brightness) => CarbonTokens(brightness),
      ),
    );

    _registerDefault(
      DesignKit(
        metadata: DesignKitMetadata(
          id: 'epn-carbon',
          displayName: 'EP&N Carbon',
          family: 'carbon',
          sourceUrl: Uri.parse('https://carbondesignsystem.com/'),
          sourcePackage: '@carbon/themes',
          sourceVersion: 'Carbon v11 theme roles + EP&N brand overlay',
          themeId: 'epn-carbon',
          parentKitId: 'carbon',
          aliases: const ['carbon-epn', 'ep-and-n-carbon'],
          hasBrandOverrides: true,
          conformanceLevel: DesignKitConformanceLevel.tokenComplete,
        ),
        tokensBuilder: (brightness) => EpnCarbonTokens(brightness),
      ),
    );
  }

  static String normalize(Object? value) {
    final raw = value?.toString().trim().toLowerCase();
    return raw == null || raw.isEmpty ? '' : raw;
  }

  static void _registerDefault(DesignKit kit) {
    for (final key in kit.keys) {
      final normalizedKey = normalize(key);
      if (normalizedKey.isEmpty) continue;
      _kits[normalizedKey] = kit;
    }
  }

  static void register(DesignKit kit) {
    _ensureDefaults();
    _registerDefault(kit);
  }

  static DesignKit resolveKit(Object? value) {
    _ensureDefaults();
    return _kits[normalize(value)] ?? _kits['level']!;
  }

  static DesignKitMetadata resolveMetadata(Object? value) =>
      resolveKit(value).metadata;

  static String resolveId(Object? value) => resolveKit(value).metadata.id;

  static DesignTokens resolveTokens(Object? value, Brightness brightness) =>
      resolveKit(value).tokensBuilder(brightness);

  static List<DesignKitMetadata> get allMetadata {
    _ensureDefaults();
    final seen = <String>{};
    final metadata = <DesignKitMetadata>[];
    for (final kit in _kits.values) {
      if (seen.add(kit.metadata.id)) {
        metadata.add(kit.metadata);
      }
    }
    return List<DesignKitMetadata>.unmodifiable(metadata);
  }

  static void clearForTests() {
    _kits.clear();
    _defaultsRegistered = false;
  }
}

@immutable
class ComponentSpec {
  const ComponentSpec({
    required this.id,
    required this.primitive,
    this.componentCode,
    this.aliases = const [],
    this.sourceUrl,
    this.supportedStates = const <ComponentInteractionState>{},
    this.conformanceLevel = DesignKitConformanceLevel.experimental,
  });

  final String id;
  final String primitive;
  final int? componentCode;
  final List<String> aliases;
  final Uri? sourceUrl;
  final Set<ComponentInteractionState> supportedStates;
  final DesignKitConformanceLevel conformanceLevel;

  Iterable<String> get keys sync* {
    yield id;
    if (componentCode != null) yield 'eic$componentCode';
    for (final alias in aliases) {
      yield alias;
    }
  }
}

class ComponentSpecRegistry {
  ComponentSpecRegistry._();

  static final Map<String, ComponentSpec> _specs = <String, ComponentSpec>{};
  static bool _defaultsRegistered = false;

  static void _ensureDefaults() {
    if (_defaultsRegistered) return;
    _defaultsRegistered = true;
    for (final spec in <ComponentSpec>[
      ComponentSpec(
        id: 'button-primary',
        primitive: 'button',
        componentCode: 1006,
        aliases: const ['primary-button'],
        sourceUrl: Uri.parse(
          'https://carbondesignsystem.com/components/button/usage/',
        ),
        supportedStates: const {
          ComponentInteractionState.enabled,
          ComponentInteractionState.hover,
          ComponentInteractionState.active,
          ComponentInteractionState.focus,
          ComponentInteractionState.disabled,
        },
      ),
      ComponentSpec(
        id: 'button-secondary',
        primitive: 'button',
        componentCode: 1008,
        aliases: const ['secondary-button'],
        sourceUrl: Uri.parse(
          'https://carbondesignsystem.com/components/button/usage/',
        ),
        supportedStates: const {
          ComponentInteractionState.enabled,
          ComponentInteractionState.hover,
          ComponentInteractionState.active,
          ComponentInteractionState.focus,
          ComponentInteractionState.disabled,
        },
      ),
      ComponentSpec(
        id: 'text-input',
        primitive: 'text-input',
        componentCode: 1009,
        sourceUrl: Uri.parse(
          'https://carbondesignsystem.com/components/text-input/usage/',
        ),
        supportedStates: const {
          ComponentInteractionState.enabled,
          ComponentInteractionState.focus,
          ComponentInteractionState.disabled,
          ComponentInteractionState.error,
        },
      ),
      ComponentSpec(
        id: 'typography',
        primitive: 'type',
        componentCode: 1020,
        sourceUrl: Uri.parse(
          'https://carbondesignsystem.com/elements/typography/overview/',
        ),
      ),
      ComponentSpec(
        id: 'tile',
        primitive: 'tile',
        componentCode: 1023,
        aliases: const ['card'],
        sourceUrl: Uri.parse(
          'https://carbondesignsystem.com/components/tile/usage/',
        ),
        supportedStates: const {
          ComponentInteractionState.enabled,
          ComponentInteractionState.hover,
          ComponentInteractionState.focus,
          ComponentInteractionState.disabled,
          ComponentInteractionState.selected,
        },
      ),
      ComponentSpec(
        id: 'tag',
        primitive: 'tag',
        componentCode: 1030,
        aliases: const ['badge'],
        sourceUrl: Uri.parse(
          'https://carbondesignsystem.com/components/tag/usage/',
        ),
      ),
      ComponentSpec(
        id: 'badge-group',
        primitive: 'badge-group',
        aliases: const ['tag-group', 'status-group', 'chip-group'],
        sourceUrl: Uri.parse(
          'https://carbondesignsystem.com/components/tag/usage/',
        ),
        supportedStates: const {
          ComponentInteractionState.enabled,
          ComponentInteractionState.hover,
          ComponentInteractionState.focus,
          ComponentInteractionState.disabled,
        },
      ),
      ComponentSpec(
        id: 'data-table',
        primitive: 'data-table',
        componentCode: 1032,
        aliases: const ['table'],
        sourceUrl: Uri.parse(
          'https://carbondesignsystem.com/components/data-table/usage/',
        ),
        supportedStates: const {
          ComponentInteractionState.enabled,
          ComponentInteractionState.hover,
          ComponentInteractionState.focus,
          ComponentInteractionState.selected,
          ComponentInteractionState.loading,
        },
      ),
      ComponentSpec(
        id: 'data-table-row-action',
        primitive: 'data-table-row-action',
        aliases: const ['table-row-action', 'row-action', 'table-action'],
        sourceUrl: Uri.parse(
          'https://carbondesignsystem.com/components/data-table/usage/',
        ),
        supportedStates: const {
          ComponentInteractionState.enabled,
          ComponentInteractionState.hover,
          ComponentInteractionState.active,
          ComponentInteractionState.focus,
          ComponentInteractionState.disabled,
        },
      ),
      ComponentSpec(
        id: 'inline-notification',
        primitive: 'notification',
        componentCode: 1033,
        aliases: const ['notification'],
        sourceUrl: Uri.parse(
          'https://carbondesignsystem.com/components/notification/usage/',
        ),
      ),
      ComponentSpec(
        id: 'empty-state',
        primitive: 'state-panel',
        aliases: const ['no-data', 'zero-state'],
        sourceUrl: Uri.parse(
          'https://carbondesignsystem.com/patterns/empty-states-pattern/usage/',
        ),
      ),
      ComponentSpec(
        id: 'locked-state',
        primitive: 'state-panel',
        aliases: const ['invite-only-state', 'permission-denied-state'],
        sourceUrl: Uri.parse(
          'https://carbondesignsystem.com/patterns/empty-states-pattern/usage/',
        ),
        supportedStates: const {
          ComponentInteractionState.enabled,
          ComponentInteractionState.disabled,
          ComponentInteractionState.error,
        },
      ),
      ComponentSpec(
        id: 'progress-bar',
        primitive: 'progress',
        componentCode: 1034,
        aliases: const ['progress'],
        sourceUrl: Uri.parse(
          'https://carbondesignsystem.com/components/progress-bar/usage/',
        ),
        supportedStates: const {
          ComponentInteractionState.enabled,
          ComponentInteractionState.loading,
          ComponentInteractionState.error,
        },
      ),
      ComponentSpec(
        id: 'responsive-grid',
        primitive: 'layout-grid',
        componentCode: 1037,
        aliases: const ['grid'],
        sourceUrl: Uri.parse(
          'https://carbondesignsystem.com/guidelines/2x-grid/overview/',
        ),
      ),
      ComponentSpec(
        id: 'chat-message',
        primitive: 'chat-message',
        aliases: const ['conversation-message', 'message-bubble'],
        supportedStates: const {
          ComponentInteractionState.enabled,
          ComponentInteractionState.loading,
          ComponentInteractionState.error,
        },
      ),
      ComponentSpec(
        id: 'conversation-composer',
        primitive: 'conversation-composer',
        aliases: const ['chat-composer', 'message-composer'],
        supportedStates: const {
          ComponentInteractionState.enabled,
          ComponentInteractionState.focus,
          ComponentInteractionState.disabled,
          ComponentInteractionState.loading,
        },
      ),
      ComponentSpec(
        id: 'action-set',
        primitive: 'action-set',
        aliases: const ['actions', 'button-row', 'command-set'],
        sourceUrl: Uri.parse(
          'https://carbondesignsystem.com/patterns/actionable/overview/',
        ),
        supportedStates: const {
          ComponentInteractionState.enabled,
          ComponentInteractionState.hover,
          ComponentInteractionState.active,
          ComponentInteractionState.focus,
          ComponentInteractionState.disabled,
        },
      ),
      ComponentSpec(
        id: 'page-shell',
        primitive: 'page-shell',
        aliases: const [
          'content-region',
          'side-panel',
          'action-bar',
          'page-density',
        ],
        sourceUrl: Uri.parse(
          'https://carbondesignsystem.com/guidelines/2x-grid/overview/',
        ),
      ),
    ]) {
      register(spec);
    }
  }

  static String normalize(Object? value) {
    final raw = value?.toString().trim().toLowerCase();
    return raw == null || raw.isEmpty ? '' : raw;
  }

  static void register(ComponentSpec spec) {
    _ensureDefaults();
    for (final key in spec.keys) {
      final normalizedKey = normalize(key);
      if (normalizedKey.isEmpty) continue;
      _specs[normalizedKey] = spec;
    }
  }

  static ComponentSpec? resolve(Object? value) {
    _ensureDefaults();
    return _specs[normalize(value)];
  }

  static List<ComponentSpec> get all {
    _ensureDefaults();
    final seen = <ComponentSpec>{};
    for (final spec in _specs.values) {
      seen.add(spec);
    }
    return List<ComponentSpec>.unmodifiable(seen);
  }

  static void clearForTests() {
    _specs.clear();
    _defaultsRegistered = false;
  }
}

@immutable
class DesignFallbackReport {
  const DesignFallbackReport({
    required this.designKitId,
    required this.componentId,
    required this.fallbackKitId,
    required this.reason,
  });

  final String designKitId;
  final String componentId;
  final String fallbackKitId;
  final String reason;
}

class DesignFallbackReporter {
  DesignFallbackReporter._();

  static final List<DesignFallbackReport> _reports = <DesignFallbackReport>[];

  static void report(DesignFallbackReport report) {
    _reports.add(report);
  }

  static List<DesignFallbackReport> get reports =>
      List<DesignFallbackReport>.unmodifiable(_reports);

  static void clear() => _reports.clear();
}

/// DesignTokens is the design-system-agnostic surface widgets read instead of
/// hardcoded colors/type/spacing (SA-UI-1). One implementation per design
/// system ([LevelTokens], [CarbonTokens]); a contract selects which via
/// [DesignSystem], and [DesignTokenScope] makes the active set available down
/// the tree.
///
/// The token vocabulary is **semantic** (backgroundPrimary, contentTertiary,
/// in either language. Values are resolved per [Brightness] so light/dark are
/// a single switch.
@immutable
abstract class DesignTokens {
  const DesignTokens();

  DesignSystem get system;
  Brightness get brightness;

  Color get backgroundPrimary;
  Color get backgroundSecondary;
  Color get backgroundTertiary;
  Color get backgroundInverse;

  Color get contentPrimary;
  Color get contentSecondary;
  Color get contentTertiary;
  Color get contentInverse;
  Color get contentDisabled;

  Color get accent;
  Color get success;
  Color get warning;
  Color get error;
  Color get border;

  /// Font family for the system (level uses the app default; carbon uses IBM
  /// Plex-style). Null means "inherit the ambient default".
  String? get fontFamily;
  TextStyle get displayLarge;
  TextStyle get headingMedium;
  TextStyle get bodyMedium;
  TextStyle get label;
  TextStyle get mono; // numeric/code cells

  double get space1; // 4
  double get space2; // 8
  double get space3; // 12 (carbon) / 16 (level)
  double get space4; // 16/24
  double get space6; // 24/32

  double get radiusSmall;
  double get radiusMedium;
  double get radiusLarge;
  List<BoxShadow> get elevation1;

  // SA-UI-8: EP&N bridge tokens.
  //
  // interaction states, spacing rhythm, type-scale relationships, motion and
  // iconography. These live as concrete, derived defaults here so both systems
  // inherit one coherent set; a system overrides only where its language truly
  // diverges. Everything is expressed in terms of the semantic tokens above,
  // so they stay correct under light/dark and any palette change.

  bool get isDark => brightness == Brightness.dark;

  Color get backgroundHover => contentPrimary.withOpacity(isDark ? 0.08 : 0.05);
  Color get backgroundActive =>
      contentPrimary.withOpacity(isDark ? 0.13 : 0.09);
  Color get layerHover => contentPrimary.withOpacity(isDark ? 0.10 : 0.06);
  Color get selectedSurface => accent.withOpacity(0.12);
  Color get accentHover => Color.alphaBlend(
    (isDark ? Colors.white : Colors.black).withOpacity(0.14),
    accent,
  );
  Color get accentSubtle => accent.withOpacity(0.12);
  Color get focusBorder => accent;

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

  // section headings (headingLarge/Small). Derived from each system's own base
  // styles so family/weight/letter-spacing stay on-language.
  TextStyle get displayMedium => displayLarge.copyWith(fontSize: 24);
  TextStyle get headingLarge => headingMedium.copyWith(fontSize: 20);
  TextStyle get headingSmall => headingMedium.copyWith(fontSize: 14);
  TextStyle get bodySmall => bodyMedium.copyWith(fontSize: 12);
  TextStyle get caption => label.copyWith(fontSize: 11);

  double get space5 => space4 + space1;
  double get space7 => space6 + space2;
  double get space8 => space6 + space4;

  // dignified beats). Animations read tokens instead of hardcoding Durations.
  Duration get durationFast => const Duration(milliseconds: 110);
  Duration get durationModerate => const Duration(milliseconds: 240);
  Duration get durationSlow => const Duration(milliseconds: 400);
  Curve get easingStandard => Curves.easeInOutCubic;
  Curve get easingEntrance => Curves.easeOutCubic;

  double get iconSizeSmall => 16;
  double get iconSizeMedium => 20;
  double get iconSizeLarge => 24;

  Color get layer01 => backgroundSecondary;
  Color get layer02 => backgroundTertiary;
  Color get layer03 => backgroundPrimary;
  Color get field01 => field;
  Color get field02 => backgroundTertiary;
  Color get textPrimary => contentPrimary;
  Color get textSecondary => contentSecondary;
  Color get textPlaceholder => contentTertiary;
  Color get textDisabled => contentDisabled;
  Color get textInverse => contentInverse;
  Color get linkPrimary => accent;
  Color get iconPrimary => contentPrimary;
  Color get iconSecondary => contentSecondary;
  Color get iconDisabled => contentDisabled;
  Color get iconInverse => contentInverse;
  Color get borderDisabled => contentDisabled;
  Color get interactive => accent;
  Color get supportSuccess => success;
  Color get supportWarning => warning;
  Color get supportError => error;
  Color get supportInfo => info;
  Color get focus => focusBorder;
  Color get overlay => Colors.black.withOpacity(isDark ? 0.72 : 0.5);
  Color get skeletonElement => contentPrimary.withOpacity(isDark ? 0.12 : 0.08);
  Color get skeletonBackground =>
      contentPrimary.withOpacity(isDark ? 0.08 : 0.04);
  Color get loading => accentSubtle;

  ColorTokenSet get colors => ColorTokenSet(
    background: backgroundPrimary,
    backgroundInverse: backgroundInverse,
    layer01: layer01,
    layer02: layer02,
    layer03: layer03,
    field01: field01,
    field02: field02,
    textPrimary: textPrimary,
    textSecondary: textSecondary,
    textPlaceholder: textPlaceholder,
    textDisabled: textDisabled,
    textInverse: textInverse,
    linkPrimary: linkPrimary,
    iconPrimary: iconPrimary,
    iconSecondary: iconSecondary,
    iconDisabled: iconDisabled,
    iconInverse: iconInverse,
    borderSubtle: borderSubtle,
    borderStrong: borderStrong,
    borderInteractive: borderInteractive,
    borderDisabled: borderDisabled,
    interactive: interactive,
    supportSuccess: supportSuccess,
    supportWarning: supportWarning,
    supportError: supportError,
    supportInfo: supportInfo,
    focus: focus,
    overlay: overlay,
    skeletonElement: skeletonElement,
    skeletonBackground: skeletonBackground,
  );

  TypeTokenSet get type => TypeTokenSet(
    fontFamily: fontFamily,
    monoFontFamily: mono.fontFamily,
    displayLarge: displayLarge,
    displayMedium: displayMedium,
    headingLarge: headingLarge,
    headingMedium: headingMedium,
    headingSmall: headingSmall,
    bodyMedium: bodyMedium,
    bodySmall: bodySmall,
    label: label,
    caption: caption,
    mono: mono,
  );

  SpacingTokenSet get spacing => SpacingTokenSet(
    spacing01: 2,
    spacing02: space1,
    spacing03: space2,
    spacing04: space3,
    spacing05: space4,
    spacing06: space6,
    spacing07: space7,
    spacing08: space8,
    spacing09: space8 + space4,
    spacing10: space8 * 2,
    spacing11: space8 * 2 + space4,
    spacing12: space8 * 3,
    spacing13: space8 * 4,
  );

  LayoutTokenSet get layout => LayoutTokenSet(
    gridColumns: 16,
    gutter: space4,
    margin: space4,
    breakpointSmall: 320,
    breakpointMedium: 672,
    breakpointLarge: 1056,
    breakpointXLarge: 1312,
  );

  MotionTokenSet get motion => MotionTokenSet(
    durationFast: durationFast,
    durationModerate: durationModerate,
    durationSlow: durationSlow,
    easingStandard: easingStandard,
    easingEntrance: easingEntrance,
  );

  ComponentStateTokenSet get states => ComponentStateTokenSet(
    hover: backgroundHover,
    active: backgroundActive,
    selected: selectedSurface,
    focus: focus,
    disabled: contentDisabled,
    loading: loading,
  );

  /// Resolve the token set for a system + brightness.
  static DesignTokens resolve(DesignSystem system, Brightness brightness) {
    switch (system) {
      case DesignSystem.carbon:
        return CarbonTokens(brightness);
      case DesignSystem.level:
        return LevelTokens(brightness);
    }
  }

  /// Resolve the token set from a contract `design-language` / `design-system`
  /// value. Hosts can register brand kits without changing this package.
  static DesignTokens resolveForContract(
    Object? value,
    Brightness brightness,
  ) => DesignKitRegistry.resolveTokens(value, brightness);

  /// The active token set from the nearest [DesignTokenScope], or level/light
  /// as a safe default when none is present.
  static DesignTokens of(BuildContext context) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<DesignTokenScope>();
    return scope?.tokens ?? LevelTokens(Theme.of(context).brightness);
  }
}

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
  // and the shared **purple** accent (oklch 0.50/0.13/300) used in *both*
  // review, replacing the old blue. Dark level is purple-tinted (hue 300) so
  @override
  Color get backgroundPrimary =>
      _dark ? const Color(0xFF14111B) : const Color(0xFFF9F6F2);
  @override
  Color get backgroundSecondary =>
      _dark ? const Color(0xFF1E1A28) : const Color(0xFFE8E4DC);
  @override
  Color get backgroundTertiary =>
      _dark ? const Color(0xFF2A2536) : const Color(0xFFDED9CF);
  @override
  Color get backgroundInverse =>
      _dark ? const Color(0xFFF9F6F2) : const Color(0xFF14111B);

  @override
  Color get contentPrimary =>
      _dark ? const Color(0xFFF4F0EA) : const Color(0xFF291F18);
  @override
  Color get contentSecondary =>
      _dark ? const Color(0xFFBDB6C4) : const Color(0xFF564B42);
  @override
  Color get contentTertiary =>
      _dark ? const Color(0xFF8F8799) : const Color(0xFF6C6158);
  @override
  Color get contentInverse =>
      _dark ? const Color(0xFF14111B) : const Color(0xFFFFFFFF);
  @override
  Color get contentDisabled =>
      (_dark ? Colors.white : Colors.black).withOpacity(0.38);

  @override
  Color get accent => const Color(0xFF6F4FA1);
  @override
  Color get accentHover => const Color(0xFF583A84); // oklch 0.42/0.12/300
  @override
  Color get success => const Color(0xFF007840);
  @override
  Color get warning => const Color(0xFFB37903);
  @override
  Color get error => const Color(0xFFB94642); // oklch 0.55/0.15/25
  @override
  Color get info => const Color(0xFF6F4FA1);
  @override
  Color get border => _dark ? const Color(0xFF2A2536) : const Color(0xFFDCD6CC);

  @override
  String? get fontFamily => 'Albert Sans';
  @override
  TextStyle get displayLarge => TextStyle(
    fontFamily: fontFamily,
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: contentPrimary,
  );
  @override
  TextStyle get headingMedium => TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: contentPrimary,
  );
  @override
  TextStyle get bodyMedium => TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: contentPrimary,
  );
  @override
  TextStyle get label => TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: contentSecondary,
    letterSpacing: 0.4,
  );
  @override
  TextStyle get mono =>
      TextStyle(fontFamily: 'monospace', fontSize: 12, color: contentPrimary);

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
    BoxShadow(
      color: Colors.black.withOpacity(_dark ? 0.4 : 0.06),
      blurRadius: 12,
      offset: const Offset(0, 2),
    ),
  ];
}

/// Carbon tokens - IBM Carbon theme family with a pure source-backed base.
@immutable
class CarbonTokens extends DesignTokens {
  const CarbonTokens(this.brightness);
  @override
  final Brightness brightness;
  @override
  DesignSystem get system => DesignSystem.carbon;

  bool get _dark => brightness == Brightness.dark;

  CarbonGeneratedTheme get theme => _dark ? carbonThemeG100 : carbonThemeWhite;
  CarbonGeneratedTypeSet get typeSource => carbonTypeProductive;

  Color _color(int value) => Color(value);

  FontWeight _fontWeight(int value) {
    switch (value) {
      case 100:
        return FontWeight.w100;
      case 200:
        return FontWeight.w200;
      case 300:
        return FontWeight.w300;
      case 500:
        return FontWeight.w500;
      case 600:
        return FontWeight.w600;
      case 700:
        return FontWeight.w700;
      case 800:
        return FontWeight.w800;
      case 900:
        return FontWeight.w900;
      case 400:
      default:
        return FontWeight.w400;
    }
  }

  TextStyle _typeStyle(
    CarbonGeneratedTypeStyle token, {
    String? fontFamilyOverride,
    Color? color,
  }) => TextStyle(
    fontFamily: fontFamilyOverride ?? fontFamily,
    fontSize: token.fontSize,
    fontWeight: _fontWeight(token.fontWeight),
    height: token.lineHeight / token.fontSize,
    letterSpacing: token.letterSpacing,
    color: color ?? contentPrimary,
  );

  /// Resolves a canonical Carbon type token or a compatibility alias.
  ///
  /// Token matching ignores case and separators, so `heading-03`,
  /// `heading03`, and `heading_03` are equivalent. Unknown values safely fall
  /// back to Carbon body-01.
  TextStyle resolveTypeStyle(String name) {
    final normalized = _normalizeTypeName(name);
    final canonical = switch (normalized) {
      // Generic and Material-era contract aliases preserve the Carbon
      // composer's previous rendered output. Canonical Carbon names opt into
      // the complete scale without unexpectedly restyling existing eApps.
      'displaylarge' || 'headlinelarge' => 'heading06',
      'headingmedium' || 'titlemedium' || 'titlelarge' => 'heading01',
      'label' || 'labelsmall' || 'labelmedium' => 'label01',
      'mono' => 'code01',
      'body1' ||
      'body2' ||
      'bodylarge' ||
      'bodymedium' ||
      'bodysmall' ||
      'caption' ||
      'displaymedium' ||
      'headline6' ||
      'headlinemedium' ||
      'headlinesmall' ||
      'labellarge' ||
      'titlesmall' => 'bodyCompact01',
      // Carbon v10 aliases retained for existing contracts.
      'bodyshort01' => 'bodyCompact01',
      'bodylong01' => 'body01',
      'productiveheading03' || 'expressiveheading03' => 'heading03',
      'productiveheading05' || 'expressiveheading05' => 'heading05',
      'productiveheading06' => 'heading06',
      'productiveheading07' => 'heading07',
      _ => null,
    };
    final target =
        canonical == null ? normalized : _normalizeTypeName(canonical);
    CarbonGeneratedTypeStyle? token;
    String? tokenName;
    for (final entry in typeSource.styles.entries) {
      if (_normalizeTypeName(entry.key) == target) {
        token = entry.value;
        tokenName = entry.key;
        break;
      }
    }
    token ??= typeSource['body01'] ?? typeSource['bodyLong01'];
    tokenName ??= 'body01';
    final isCode = _normalizeTypeName(tokenName).startsWith('code');
    return _typeStyle(
      token!,
      fontFamilyOverride: isCode ? 'IBM Plex Mono' : null,
    );
  }

  String _normalizeTypeName(String value) =>
      value.toLowerCase().replaceAll(RegExp(r'[^a-z0-9]'), '');

  @override
  Color get backgroundPrimary => _color(theme.background);
  @override
  Color get backgroundSecondary => _color(theme.layer01);
  @override
  Color get backgroundTertiary => _color(theme.layer02);
  @override
  Color get backgroundInverse => _color(theme.backgroundInverse);

  @override
  Color get contentPrimary => _color(theme.textPrimary);
  @override
  Color get contentSecondary => _color(theme.textSecondary);
  @override
  Color get contentTertiary => _color(theme.iconSecondary);
  @override
  Color get contentInverse => _color(theme.textInverse);
  @override
  Color get contentDisabled => _color(theme.textDisabled);

  @override
  Color get accent => _color(theme.interactive);
  @override
  Color get accentHover =>
      _dark ? const Color(0xFF78A9FF) : const Color(0xFF0043CE);
  @override
  Color get success => _color(theme.supportSuccess);
  @override
  Color get warning => _color(theme.supportWarning);
  @override
  Color get error => _color(theme.supportError);
  @override
  Color get info => _color(theme.supportInfo);
  @override
  Color get border => _color(theme.borderSubtle01);

  @override
  Color get borderSubtle => _color(theme.borderSubtle01);
  @override
  Color get borderStrong => _color(theme.borderStrong01);
  @override
  Color get borderInteractive => _color(theme.borderInteractive);
  @override
  Color get borderDisabled => _color(theme.borderDisabled);
  @override
  Color get focusBorder => _color(theme.focus);
  @override
  Color get field => _color(theme.field01);
  @override
  Color get infoSubtle => _color(theme.supportInfo).withOpacity(0.12);

  @override
  Color get layer01 => _color(theme.layer01);
  @override
  Color get layer02 => _color(theme.layer02);
  @override
  Color get layer03 => _color(theme.layer03);
  @override
  Color get field01 => _color(theme.field01);
  @override
  Color get field02 => _color(theme.field02);
  @override
  Color get textPrimary => _color(theme.textPrimary);
  @override
  Color get textSecondary => _color(theme.textSecondary);
  @override
  Color get textPlaceholder => _color(theme.textPlaceholder);
  @override
  Color get textDisabled => _color(theme.textDisabled);
  @override
  Color get textInverse => _color(theme.textInverse);
  @override
  Color get linkPrimary => _color(theme.linkPrimary);
  @override
  Color get iconPrimary => _color(theme.iconPrimary);
  @override
  Color get iconSecondary => _color(theme.iconSecondary);
  @override
  Color get iconDisabled => _color(theme.iconDisabled);
  @override
  Color get iconInverse => _color(theme.iconInverse);
  @override
  Color get interactive => accent;
  @override
  Color get supportSuccess => _color(theme.supportSuccess);
  @override
  Color get supportWarning => _color(theme.supportWarning);
  @override
  Color get supportError => _color(theme.supportError);
  @override
  Color get supportInfo => info;
  @override
  Color get focus => _color(theme.focus);
  @override
  Color get overlay => _color(theme.overlay);
  @override
  Color get skeletonElement => _color(theme.skeletonElement);
  @override
  Color get skeletonBackground => _color(theme.skeletonBackground);

  @override
  String? get fontFamily => 'IBM Plex Sans';
  @override
  TextStyle get displayLarge => resolveTypeStyle('heading06');
  @override
  TextStyle get displayMedium => resolveTypeStyle('heading05');
  @override
  TextStyle get headingLarge => resolveTypeStyle('heading03');
  @override
  TextStyle get headingMedium => resolveTypeStyle('heading01');
  @override
  TextStyle get headingSmall => resolveTypeStyle('label01');
  @override
  TextStyle get bodyMedium => resolveTypeStyle('bodyCompact01');
  @override
  TextStyle get bodySmall => resolveTypeStyle('caption01');
  @override
  TextStyle get label =>
      resolveTypeStyle('label01').copyWith(color: contentSecondary);
  @override
  TextStyle get caption =>
      resolveTypeStyle('caption01').copyWith(color: contentSecondary);
  @override
  TextStyle get mono => resolveTypeStyle('code01');

  @override
  double get space1 => carbonSpacing.spacing02;
  @override
  double get space2 => carbonSpacing.spacing03;
  @override
  double get space3 => carbonSpacing.spacing04;
  @override
  double get space4 => carbonSpacing.spacing05;
  @override
  double get space6 => carbonSpacing.spacing07;

  @override
  SpacingTokenSet get spacing => SpacingTokenSet(
    spacing01: carbonSpacing.spacing01,
    spacing02: carbonSpacing.spacing02,
    spacing03: carbonSpacing.spacing03,
    spacing04: carbonSpacing.spacing04,
    spacing05: carbonSpacing.spacing05,
    spacing06: carbonSpacing.spacing06,
    spacing07: carbonSpacing.spacing07,
    spacing08: carbonSpacing.spacing08,
    spacing09: carbonSpacing.spacing09,
    spacing10: carbonSpacing.spacing10,
    spacing11: carbonSpacing.spacing11,
    spacing12: carbonSpacing.spacing12,
    spacing13: carbonSpacing.spacing13,
  );

  @override
  LayoutTokenSet get layout => LayoutTokenSet(
    gridColumns: carbonLayout.gridColumns,
    gutter: carbonLayout.gutter,
    margin: carbonLayout.margin,
    breakpointSmall: carbonLayout.breakpointSmall,
    breakpointMedium: carbonLayout.breakpointMedium,
    breakpointLarge: carbonLayout.breakpointLarge,
    breakpointXLarge: carbonLayout.breakpointXLarge,
  );

  @override
  double get iconSizeSmall => carbonLayout.iconSize01;
  @override
  double get iconSizeMedium => carbonLayout.iconSize02;
  @override
  double get iconSizeLarge => carbonSpacing.spacing07;

  @override
  double get radiusSmall => 0;
  @override
  double get radiusMedium => 2;
  @override
  double get radiusLarge => 4;
  @override
  List<BoxShadow> get elevation1 => [
    BoxShadow(
      color: Colors.black.withOpacity(_dark ? 0.5 : 0.1),
      blurRadius: 4,
      offset: const Offset(0, 1),
    ),
  ];
}

@immutable
class CarbonThemeWhite extends CarbonTokens {
  const CarbonThemeWhite() : super(Brightness.light);

  @override
  CarbonGeneratedTheme get theme => carbonThemeWhite;
}

@immutable
class CarbonThemeG10 extends CarbonTokens {
  const CarbonThemeG10() : super(Brightness.light);

  @override
  CarbonGeneratedTheme get theme => carbonThemeG10;
}

@immutable
class CarbonThemeG90 extends CarbonTokens {
  const CarbonThemeG90() : super(Brightness.dark);

  @override
  CarbonGeneratedTheme get theme => carbonThemeG90;
}

@immutable
class CarbonThemeG100 extends CarbonTokens {
  const CarbonThemeG100() : super(Brightness.dark);

  @override
  CarbonGeneratedTheme get theme => carbonThemeG100;
}

@immutable
class EpnCarbonTokens extends CarbonTokens {
  EpnCarbonTokens(Brightness brightness) : super(brightness);

  @override
  Color get accent => const Color(0xFF6F4FA1);
  @override
  Color get accentHover => const Color(0xFF583A84);
  @override
  Color get info => const Color(0xFF6F4FA1);
  @override
  Color get focusBorder => const Color(0xFF6F4FA1);
  @override
  Color get borderInteractive => accent;
  @override
  Color get interactive => accent;
  @override
  Color get supportInfo => info;
  @override
  Color get focus => focusBorder;
}

/// Makes a [DesignTokens] set available to descendants. The engine wraps a
/// rendered eApp in this scope using the contract's design system.
class DesignTokenScope extends InheritedWidget {
  const DesignTokenScope({
    super.key,
    required this.tokens,
    required super.child,
  });

  final DesignTokens tokens;

  @override
  bool updateShouldNotify(DesignTokenScope oldWidget) =>
      oldWidget.tokens != tokens;
}
