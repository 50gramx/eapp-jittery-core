/// The design language a contract renders in (SA-UI). `level` is the
/// Material-flavored consumer surface (default); `carbon` is the IBM
/// Carbon-flavored, data-dense, enterprise-legible surface used for the EP&N
/// infra/dashboard eApps.
///
/// The contract-driven engine separates *what* (component code) from *how*
/// (composer + tokens); DesignSystem is the dimension added to the "how", so
/// the same contract renders consumer-friendly or enterprise-grade with no
/// eApp rewrite.
enum DesignSystem {
  level,
  carbon;

  /// Parse a contract `design_system` value; unknown/empty → [level] (default).
  static DesignSystem fromContract(Object? value) {
    switch (value?.toString().trim().toLowerCase()) {
      case 'carbon':
        return DesignSystem.carbon;
      case 'level':
      default:
        return DesignSystem.level;
    }
  }

  /// The string the ComposerFactory keys on.
  String get id => name;
}
