import 'package:flutter/material.dart';

/// Abstract checkbox component that can be implemented by different design languages
abstract class JitteryCheckbox extends StatelessWidget {
  const JitteryCheckbox({
    Key? key,
    required this.value,
    required this.onChanged,
    this.label,
    this.isEnabled = true,
    this.width,
    this.height,
  }) : super(key: key);

  /// Current checkbox state
  final bool value;
  
  /// Callback when checkbox state changes
  final ValueChanged<bool?> onChanged;
  
  /// Optional label text
  final String? label;
  
  /// Whether the checkbox is enabled
  final bool isEnabled;
  
  /// Width of the checkbox
  final double? width;
  
  /// Height of the checkbox
  final double? height;

  /// Build the checkbox widget
  Widget buildCheckbox();

  /// Build the label widget
  Widget? buildLabel();

  @override
  Widget build(BuildContext context) {
    final checkboxWidget = buildCheckbox();
    final labelWidget = buildLabel();

    if (labelWidget != null) {
      return Row(
        children: [
          checkboxWidget,
          const SizedBox(width: 8),
          labelWidget,
        ],
      );
    }

    return checkboxWidget;
  }
}
