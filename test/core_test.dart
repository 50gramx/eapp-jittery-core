import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yaml/yaml.dart';
import 'package:eapp_jittery_core/eapp_jittery_core.dart';

void main() {
  group('Jittery Core Tests', () {
    test('should create JitteryButtonStyle', () {
      final style = JitteryButtonStyle(
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        borderRadius: 8.0,
      );
      
      expect(style.backgroundColor, Colors.blue);
      expect(style.textColor, Colors.white);
      expect(style.borderRadius, 8.0);
    });

    test('should create JitteryTextFieldStyle', () {
      final style = JitteryTextFieldStyle(
        backgroundColor: Colors.grey,
        textColor: Colors.black,
        borderRadius: 12.0,
      );
      
      expect(style.backgroundColor, Colors.grey);
      expect(style.textColor, Colors.black);
      expect(style.borderRadius, 12.0);
    });

    test('should create JitteryComponentComposer', () {
      // Test that we can create a concrete implementation
      final composer = TestComponentComposer();
      expect(composer, isA<JitteryComponentComposer>());
    });

    test('should create JitteryTileComposer', () {
      // Test that we can create a concrete implementation
      final tileComposer = TestTileComposer();
      expect(tileComposer, isA<JitteryTileComposer>());
    });

    test('should get component code from name', () {
      final composer = TestComponentComposer();
      final code = composer.getComponentCode(componentNameCode: 'EIC1001');
      expect(code, 1001);
    });
  });
}

// Test implementations for abstract classes
class TestComponentComposer extends JitteryComponentComposer {
  @override
  Widget fromComponentContract({
    required int communityCode,
    required String orgName,
    required String appName,
    required String componentNameCode,
    required YamlMap componentProperties,
  }) {
    return const SizedBox();
  }

  @override
  Widget buildButton({
    required String label,
    required VoidCallback onPressed,
    bool isPrimary = false,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(label),
    );
  }

  @override
  Widget buildTextField({
    required String hintText,
    required TextEditingController controller,
    bool isEnabled = true,
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      enabled: isEnabled,
      maxLines: maxLines,
      decoration: InputDecoration(hintText: hintText),
    );
  }

  @override
  Widget buildColumn({required List<Widget> children}) {
    return Column(children: children);
  }

  @override
  Widget buildRow({required List<Widget> children}) {
    return Row(children: children);
  }

  @override
  Widget buildTileHeader({required String label}) {
    return Text(label);
  }

  @override
  Widget buildDropdown({
    required List<dynamic> items,
    required String valueProperty,
    required Function(dynamic) onSelect,
  }) {
    return DropdownButton<String>(
      items: items.map((item) => DropdownMenuItem(
        value: item[valueProperty]?.toString(),
        child: Text(item[valueProperty]?.toString() ?? ''),
      )).toList(),
      onChanged: (value) {
        final selectedItem = items.firstWhere(
          (item) => item[valueProperty]?.toString() == value,
          orElse: () => {},
        );
        onSelect(selectedItem);
      },
    );
  }

  @override
  Widget buildSpacer() {
    return const SizedBox();
  }
}

class TestTileComposer extends JitteryTileComposer {
  @override
  Widget fromContract({
    required int communityCode,
    required String orgName,
    required String appName,
    required YamlList conditions,
    required Widget composedComponent,
  }) {
    return buildVisibility(
      visible: true,
      child: composedComponent,
    );
  }

  @override
  bool resolveConditionFor({
    required String variableTypeNameCode,
    required YamlMap condition,
    required Map<String, dynamic> localVariableValue,
  }) {
    return true;
  }

  @override
  Widget buildVisibility({
    required bool visible,
    required Widget child,
  }) {
    return Visibility(
      visible: visible,
      child: child,
    );
  }
} 