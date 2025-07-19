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
} 