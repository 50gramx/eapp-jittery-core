import 'package:flutter/material.dart';
import 'package:yaml/yaml.dart';

import '../design/design_tokens.dart';

/// Abstract component composer that can work with different design language implementations.
/// 
/// This class provides the framework for composing components from contracts,
/// but delegates the actual component creation to design language specific implementations.
abstract class JitteryComponentComposer {
  const JitteryComponentComposer();

  /// Build a component from a contract
  Widget fromComponentContract({
    required int communityCode,
    required String orgName,
    required String appName,
    required String componentNameCode,
    required YamlMap componentProperties,
    required Widget Function({
      required String appName,
      required int communityCode,
      required String componentNameCode,
      required String orgName,
    }) componentResolver,
    required Widget Function({
      required int communityCode,
      required String orgName,
      required String appName,
      required String tileNameCode,
    }) tileResolver,
    Function({
      required int communityCode,
      required String orgName,
      required String appName,
      required String capabilityNameCode,
    })? capabilityResolver,
    Function({
      required int communityCode,
      required String orgName,
      required String appName,
      required String variableNameCode,
    })? variableResolver,
    void Function({
      required String variableNameCode,
      required void Function(dynamic value) onChanged,
    })? variableSubscriber,
    void Function({
      required String variableNameCode,
      required void Function(dynamic value) onChanged,
    })? variableUnsubscriber,
  });

  /// Get the component code from the component name code
  int getComponentCode({required String componentNameCode}) {
    String typeCodeString = componentNameCode.replaceFirst("EIC", '');
    return int.parse(typeCodeString);
  }

  /// Build a button component
  Widget buildButton({
    required String label,
    required VoidCallback onPressed,
    bool isPrimary = false,
  });

  /// Build a text field component
  Widget buildTextField({
    required String hintText,
    required TextEditingController controller,
    bool isEnabled = true,
    int maxLines = 1,
  });

  /// Build a column layout
  Widget buildColumn({
    required List<Widget> children,
  });

  /// Build a row layout
  Widget buildRow({
    required List<Widget> children,
  });

  /// Build a tile header
  Widget buildTileHeader({
    required String label,
  });

  /// Build a dropdown component
  Widget buildDropdown({
    required List<dynamic> items,
    required String valueProperty,
    required Function(dynamic) onSelect,
  });

  /// Build a spacer/empty widget
  Widget buildSpacer();
  /// Build a typography component
  Widget buildTypography({
    required String text,
    String variant = 'bodyMedium',
    String align = 'left',
    Color? color,
    int? maxLines,
    String overflow = 'ellipsis',
  });

  /// Build an image component
  Widget buildImage({
    required String src,
    double? width,
    double? height,
    BoxFit? fit,
    BorderRadius? borderRadius,
  });

  /// Build a switch component
  Widget buildSwitch({
    required bool value,
    required ValueChanged<bool> onChanged,
    String? label,
    bool isEnabled = true,
  });

  /// Build a card component
  Widget buildCard({
    required Widget child,
    double? elevation,
    Color? color,
    double? padding,
    VoidCallback? onTap,
  });

  /// Build a list item component. [selected] surfaces the design system's
  /// active-row treatment (e.g. Carbon's accent left rule + tint).
  Widget buildListItem({
    String? title,
    String? subtitle,
    Widget? leading,
    Widget? trailing,
    VoidCallback? onTap,
    bool selected = false,
  });

  /// Build a divider component
  Widget buildDivider({
    double? height,
    double? thickness,
    Color? color,
    double? indent,
    double? endIndent,
  });

  /// Build a checkbox component
  Widget buildCheckbox({
    required bool value,
    required ValueChanged<bool?> onChanged,
    String? label,
    bool isEnabled = true,
  });

  /// Build a list view component. When [maxHeight] is set the list is capped to
  /// that height and scrolls internally — used by dense panels (e.g. an
  /// org-solution nav) that must not grow unbounded inside a larger scroll.
  Widget buildListView({
    required List<Widget> children,
    bool shrinkWrap = true,
    ScrollPhysics? physics,
    double? maxHeight,
  });

  /// Build a QR code display component (EIC1027)
  Widget buildQrCode({
    required String data,
    double size = 200,
    Color? foregroundColor,
    Color? backgroundColor,
  });

  // ───────────────────────────────────────────────────────────────────────
  // Data-dense primitives (SA-UI-6).
  //
  // These are implemented once here, driven by [resolveTokens], so every
  // design system themes them automatically — Carbon overrides [resolveTokens]
  // to stay correct even with no [DesignTokenScope] present. A design system
  // may still override any individual primitive for a distinct treatment.
  // ───────────────────────────────────────────────────────────────────────

  /// The token set these primitives paint with. Defaults to the ambient
  /// [DesignTokens.of]; design systems override to guarantee their own tokens.
  @protected
  DesignTokens resolveTokens(BuildContext context) => DesignTokens.of(context);

  /// A standalone icon, token-colored (defaults to secondary content).
  Widget buildIcon({
    required IconData icon,
    double? size,
    Color? color,
  }) {
    return Builder(builder: (context) {
      final t = resolveTokens(context);
      return Icon(icon, size: size ?? 20, color: color ?? t.contentSecondary);
    });
  }

  /// An icon-only button with a tooltip and hover feedback. [semantic] selects
  /// the role color: `neutral` (default), `accent`, or `danger`.
  Widget buildIconButton({
    required IconData icon,
    required VoidCallback onPressed,
    String? tooltip,
    String semantic = 'neutral',
    double? size,
  }) {
    return Builder(builder: (context) {
      final t = resolveTokens(context);
      return _ComposerIconButton(
        icon: icon,
        onPressed: onPressed,
        tooltip: tooltip,
        tokens: t,
        semantic: semantic,
        size: size ?? 18,
      );
    });
  }

  /// A compact status pill. [status] ∈ neutral | accent | success | warning |
  /// error (alias `danger`). An optional leading [icon] renders before the label.
  Widget buildBadge({
    required String label,
    String status = 'neutral',
    IconData? icon,
  }) {
    return Builder(builder: (context) {
      final t = resolveTokens(context);
      Color fg;
      switch (status) {
        case 'accent':
          fg = t.accent;
          break;
        case 'success':
          fg = t.success;
          break;
        case 'warning':
          fg = t.warning;
          break;
        case 'error':
        case 'danger':
          fg = t.error;
          break;
        default:
          fg = t.contentSecondary;
      }
      return Container(
        padding: EdgeInsets.symmetric(horizontal: t.space2, vertical: t.space1 / 2),
        decoration: BoxDecoration(
          color: fg.withOpacity(0.12),
          borderRadius: BorderRadius.circular(t.radiusSmall),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 11, color: fg),
              SizedBox(width: t.space1),
            ],
            Text(
              label,
              style: t.label.copyWith(color: fg, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      );
    });
  }

  /// A determinate progress bar (0..1) with an optional caption above it.
  Widget buildProgressBar({
    required double value,
    String? label,
  }) {
    return Builder(builder: (context) {
      final t = resolveTokens(context);
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (label != null)
            Padding(
              padding: EdgeInsets.only(bottom: t.space1),
              child: Text(label, style: t.label),
            ),
          ClipRRect(
            borderRadius: BorderRadius.circular(t.radiusSmall),
            child: LinearProgressIndicator(
              value: value.clamp(0.0, 1.0),
              minHeight: 4,
              backgroundColor: t.backgroundTertiary,
              valueColor: AlwaysStoppedAnimation<Color>(t.accent),
            ),
          ),
        ],
      );
    });
  }

  /// A shrink-wrapped grid (does not scroll itself — host inside a scroll).
  Widget buildGrid({
    required List<Widget> children,
    int crossAxisCount = 2,
    double? spacing,
    double? childAspectRatio,
  }) {
    return Builder(builder: (context) {
      final t = resolveTokens(context);
      final s = spacing ?? t.space3;
      return GridView.count(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: s,
        crossAxisSpacing: s,
        childAspectRatio: childAspectRatio ?? 1.0,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: children,
      );
    });
  }

  /// Resolve a semantic status name to its role colour.
  Color statusColor(String status, DesignTokens t) {
    switch (status) {
      case 'accent':
      case 'primary':
        return t.accent;
      case 'success':
      case 'positive':
        return t.success;
      case 'warning':
      case 'caution':
        return t.warning;
      case 'error':
      case 'danger':
      case 'negative':
        return t.error;
      case 'info':
        return t.info;
      default:
        return t.contentSecondary;
    }
  }

  /// A single metric/stat: a prominent [value], a [label] beneath, optional
  /// [caption], and a [status] that tints the value (used by Metering/Home).
  Widget buildMetric({
    required String value,
    required String label,
    String? caption,
    String status = 'neutral',
  }) {
    return Builder(builder: (context) {
      final t = resolveTokens(context);
      final valueColor =
          status == 'neutral' ? t.contentPrimary : statusColor(status, t);
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(value, style: t.displayMedium.copyWith(color: valueColor)),
          SizedBox(height: t.space1),
          Text(label, style: t.label),
          if (caption != null)
            Text(caption, style: t.caption.copyWith(color: t.contentTertiary)),
        ],
      );
    });
  }

  /// A data table — header [columns] + [rows] of equal-weight string cells.
  /// The data-dense workhorse for peers / market / activity (carbon).
  Widget buildTable({
    required List<String> columns,
    required List<List<String>> rows,
  }) {
    return Builder(builder: (context) {
      final t = resolveTokens(context);
      Widget cell(String s, TextStyle style) =>
          Expanded(child: Text(s, style: style, overflow: TextOverflow.ellipsis));
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: t.space2, horizontal: t.space2),
            child: Row(
              children: [
                for (final c in columns)
                  cell(c, t.label.copyWith(color: t.contentSecondary, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          Container(height: 1, color: t.borderStrong),
          for (final r in rows) ...[
            Padding(
              padding: EdgeInsets.symmetric(vertical: t.space2, horizontal: t.space2),
              child: Row(children: [for (final c in r) cell(c, t.bodySmall)]),
            ),
            Container(height: 1, color: t.borderSubtle),
          ],
        ],
      );
    });
  }

  /// An inline notification banner. [kind] ∈ success | warning | error | info.
  /// Subtle role-tinted surface + accent left rule; optional [body] + action.
  Widget buildNotification({
    required String kind,
    required String title,
    String? body,
    String? actionLabel,
    VoidCallback? onAction,
  }) {
    return Builder(builder: (context) {
      final t = resolveTokens(context);
      final fg = statusColor(kind, t);
      Color bg;
      IconData icon;
      switch (kind) {
        case 'success':
        case 'positive':
          bg = t.successSubtle;
          icon = Icons.check_circle_outline;
          break;
        case 'warning':
        case 'caution':
          bg = t.warningSubtle;
          icon = Icons.warning_amber_outlined;
          break;
        case 'error':
        case 'danger':
        case 'negative':
          bg = t.errorSubtle;
          icon = Icons.error_outline;
          break;
        default:
          bg = t.infoSubtle;
          icon = Icons.info_outline;
      }
      return Container(
        padding: EdgeInsets.all(t.space3),
        decoration: BoxDecoration(
          color: bg,
          border: Border(left: BorderSide(color: fg, width: 3)),
          borderRadius: BorderRadius.circular(t.radiusSmall),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 16, color: fg),
            SizedBox(width: t.space2),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(title, style: t.bodyMedium.copyWith(fontWeight: FontWeight.w600)),
                  if (body != null)
                    Text(body, style: t.bodySmall.copyWith(color: t.contentSecondary)),
                ],
              ),
            ),
            if (actionLabel != null && onAction != null)
              TextButton(
                onPressed: onAction,
                style: TextButton.styleFrom(foregroundColor: fg, padding: EdgeInsets.symmetric(horizontal: t.space2)),
                child: Text(actionLabel, style: t.label.copyWith(color: fg, fontWeight: FontWeight.w600)),
              ),
          ],
        ),
      );
    });
  }
}

/// Icon button with hover feedback + tooltip, shared by every design system
/// (the role color comes from the passed [tokens], so it stays on-language).
class _ComposerIconButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final String? tooltip;
  final DesignTokens tokens;
  final String semantic;
  final double size;

  const _ComposerIconButton({
    required this.icon,
    required this.onPressed,
    required this.tooltip,
    required this.tokens,
    required this.semantic,
    required this.size,
  });

  @override
  State<_ComposerIconButton> createState() => _ComposerIconButtonState();
}

class _ComposerIconButtonState extends State<_ComposerIconButton> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final t = widget.tokens;
    final Color active = widget.semantic == 'danger'
        ? t.error
        : widget.semantic == 'accent'
            ? t.accent
            : t.contentPrimary;
    final Color fg = _hovering ? active : t.contentTertiary;

    final button = MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        behavior: HitTestBehavior.opaque,
        child: Padding(
          padding: EdgeInsets.all(t.space1 + 2),
          child: Icon(widget.icon, size: widget.size, color: fg),
        ),
      ),
    );

    if (widget.tooltip == null) return button;
    return Tooltip(message: widget.tooltip!, child: button);
  }
}