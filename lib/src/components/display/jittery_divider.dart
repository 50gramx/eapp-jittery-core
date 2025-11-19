import 'package:flutter/material.dart';

/// Abstract divider component that can be implemented by different design languages
abstract class JitteryDivider extends StatelessWidget {
  const JitteryDivider({
    Key? key,
    this.height,
    this.thickness,
    this.color,
    this.indent,
    this.endIndent,
  }) : super(key: key);

  /// Height of the divider space
  final double? height;
  
  /// Thickness of the line
  final double? thickness;
  
  /// Color of the line
  final Color? color;
  
  /// Indent from the start
  final double? indent;
  
  /// Indent from the end
  final double? endIndent;

  /// Build the divider widget
  Widget buildDivider();

  @override
  Widget build(BuildContext context) {
    return buildDivider();
  }
}
