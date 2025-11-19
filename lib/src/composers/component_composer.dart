import 'package:flutter/material.dart';
import 'package:yaml/yaml.dart';

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

  /// Build a list item component
  Widget buildListItem({
    String? title,
    String? subtitle,
    Widget? leading,
    Widget? trailing,
    VoidCallback? onTap,
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
}