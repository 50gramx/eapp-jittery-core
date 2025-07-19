import 'package:flutter/material.dart';

/// Abstract base class for text fields in the Jittery UI kit.
/// 
/// This class defines the interface that all text field implementations
/// must follow, regardless of the design language (Level, Material, etc.).
abstract class JitteryTextField extends StatelessWidget {
  const JitteryTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.isEnabled = true,
    this.maxLines = 1,
    this.keyboardType,
    this.style,
  });

  /// The text editing controller
  final TextEditingController controller;

  /// The hint text to display
  final String hintText;

  /// Whether the text field is enabled
  final bool isEnabled;

  /// Maximum number of lines
  final int maxLines;

  /// Keyboard type for the text field
  final TextInputType? keyboardType;

  /// Optional custom style for the text field
  final JitteryTextFieldStyle? style;

  /// Build the text field widget
  @override
  Widget build(BuildContext context);

  /// Create a copy of this text field with new properties
  JitteryTextField copyWith({
    TextEditingController? controller,
    String? hintText,
    bool? isEnabled,
    int? maxLines,
    TextInputType? keyboardType,
    JitteryTextFieldStyle? style,
  });
}

/// Style configuration for Jittery text fields
class JitteryTextFieldStyle {
  const JitteryTextFieldStyle({
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.borderRadius,
    this.padding,
    this.textStyle,
    this.hintStyle,
  });

  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
} 