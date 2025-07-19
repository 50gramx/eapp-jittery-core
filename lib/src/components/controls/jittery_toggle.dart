import 'package:flutter/material.dart';

/// Abstract toggle component that can be implemented by different design languages
abstract class JitteryToggle extends StatelessWidget {
  const JitteryToggle({
    Key? key,
    required this.value,
    required this.onChanged,
    this.label,
    this.isEnabled = true,
    this.width,
    this.height,
  }) : super(key: key);

  /// Current toggle state
  final bool value;
  
  /// Callback when toggle state changes
  final ValueChanged<bool> onChanged;
  
  /// Optional label text
  final String? label;
  
  /// Whether the toggle is enabled
  final bool isEnabled;
  
  /// Width of the toggle
  final double? width;
  
  /// Height of the toggle
  final double? height;

  /// Build the toggle switch
  Widget buildToggleSwitch();

  /// Build the label widget
  Widget? buildLabel();

  @override
  Widget build(BuildContext context) {
    final toggleWidget = buildToggleSwitch();
    final labelWidget = buildLabel();

    if (labelWidget != null) {
      return Row(
        children: [
          toggleWidget,
          const SizedBox(width: 8),
          labelWidget,
        ],
      );
    }

    return toggleWidget;
  }
} 