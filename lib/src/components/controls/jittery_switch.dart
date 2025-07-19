import 'package:flutter/material.dart';

/// Abstract switch component that can be implemented by different design languages
abstract class JitterySwitch extends StatelessWidget {
  const JitterySwitch({
    Key? key,
    required this.value,
    required this.onChanged,
    this.label,
    this.isEnabled = true,
    this.width,
    this.height,
  }) : super(key: key);

  /// Current switch state
  final bool value;
  
  /// Callback when switch state changes
  final ValueChanged<bool> onChanged;
  
  /// Optional label text
  final String? label;
  
  /// Whether the switch is enabled
  final bool isEnabled;
  
  /// Width of the switch
  final double? width;
  
  /// Height of the switch
  final double? height;

  /// Build the switch widget
  Widget buildSwitch();

  /// Build the label widget
  Widget? buildLabel();

  @override
  Widget build(BuildContext context) {
    final switchWidget = buildSwitch();
    final labelWidget = buildLabel();

    if (labelWidget != null) {
      return Row(
        children: [
          switchWidget,
          const SizedBox(width: 8),
          labelWidget,
        ],
      );
    }

    return switchWidget;
  }
} 