import 'package:flutter/material.dart';

/// Abstract slider component that can be implemented by different design languages
abstract class JitterySlider extends StatelessWidget {
  const JitterySlider({
    Key? key,
    required this.value,
    required this.onChanged,
    this.min = 0.0,
    this.max = 1.0,
    this.divisions,
    this.label,
    this.isEnabled = true,
    this.width,
    this.height,
  }) : super(key: key);

  /// Current slider value
  final double value;
  
  /// Callback when slider value changes
  final ValueChanged<double> onChanged;
  
  /// Minimum value
  final double min;
  
  /// Maximum value
  final double max;
  
  /// Number of divisions (null for continuous)
  final int? divisions;
  
  /// Optional label text
  final String? label;
  
  /// Whether the slider is enabled
  final bool isEnabled;
  
  /// Width of the slider
  final double? width;
  
  /// Height of the slider
  final double? height;

  /// Build the slider widget
  Widget buildSlider();

  /// Build the label widget
  Widget? buildLabel();

  /// Build the value display widget
  Widget? buildValueDisplay();

  @override
  Widget build(BuildContext context) {
    final sliderWidget = buildSlider();
    final labelWidget = buildLabel();
    final valueWidget = buildValueDisplay();

    final children = <Widget>[];
    
    if (labelWidget != null) {
      children.add(labelWidget);
    }
    
    children.add(sliderWidget);
    
    if (valueWidget != null) {
      children.add(valueWidget);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }
} 