import 'package:flutter/material.dart';

/// Abstract base class for buttons in the Jittery UI kit.
/// 
/// This class defines the interface that all button implementations
/// must follow, regardless of the design language (Level, Material, etc.).
abstract class JitteryButton extends StatelessWidget {
  const JitteryButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.isEnabled = true,
    this.isLoading = false,
    this.style,
  });

  /// The text to display on the button
  final String title;

  /// Callback function when the button is pressed
  final VoidCallback? onPressed;

  /// Whether the button is enabled
  final bool isEnabled;

  /// Whether the button is in loading state
  final bool isLoading;

  /// Optional custom style for the button
  final JitteryButtonStyle? style;

  /// Build the button widget
  @override
  Widget build(BuildContext context);

  /// Create a copy of this button with new properties
  JitteryButton copyWith({
    String? title,
    VoidCallback? onPressed,
    bool? isEnabled,
    bool? isLoading,
    JitteryButtonStyle? style,
  });
}

/// Style configuration for Jittery buttons
class JitteryButtonStyle {
  const JitteryButtonStyle({
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.borderRadius,
    this.padding,
    this.textStyle,
  });

  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
} 