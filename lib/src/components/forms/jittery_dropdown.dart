import 'package:flutter/material.dart';

/// Abstract dropdown component that can be implemented by different design languages
abstract class JitteryDropdown extends StatelessWidget {
  const JitteryDropdown({
    Key? key,
    required this.items,
    required this.valueProperty,
    required this.onSelect,
    this.hintText,
    this.isEnabled = true,
    this.width,
    this.height,
  }) : super(key: key);

  /// List of items to display in the dropdown
  final List<dynamic> items;
  
  /// Property name to use as the display value
  final String valueProperty;
  
  /// Callback when an item is selected
  final Function(dynamic) onSelect;
  
  /// Hint text to display when no item is selected
  final String? hintText;
  
  /// Whether the dropdown is enabled
  final bool isEnabled;
  
  /// Width of the dropdown
  final double? width;
  
  /// Height of the dropdown
  final double? height;

  /// Get the display value for an item
  String getDisplayValue(dynamic item) {
    return item[valueProperty]?.toString() ?? '';
  }

  /// Get the current selected value
  String? get currentValue;

  /// Build the dropdown items
  List<DropdownMenuItem<String>> buildDropdownItems();

  /// Build the dropdown button
  Widget buildDropdownButton();

  @override
  Widget build(BuildContext context) {
    return buildDropdownButton();
  }
} 