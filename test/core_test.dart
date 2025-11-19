import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:eapp_jittery_core/eapp_jittery_core.dart';

void main() {
  group('Jittery Core - Component Styles', () {
    test('should create JitteryButtonStyle with all properties', () {
      final style = JitteryButtonStyle(
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        borderRadius: 8.0,
      );
      
      expect(style.backgroundColor, Colors.blue);
      expect(style.textColor, Colors.white);
      expect(style.borderRadius, 8.0);
    });

    test('should create JitteryTextFieldStyle with all properties', () {
      final style = JitteryTextFieldStyle(
        backgroundColor: Colors.grey,
        textColor: Colors.black,
        borderRadius: 12.0,
      );
      
      expect(style.backgroundColor, Colors.grey);
      expect(style.textColor, Colors.black);
      expect(style.borderRadius, 12.0);
    });
  });

  group('Jittery Core - Abstract Interfaces', () {
    test('should have JitteryComponentComposer interface', () {
      // Verify the abstract class exists
      expect(JitteryComponentComposer, isNotNull);
    });

    test('should have JitteryTileComposer interface', () {
      // Verify the abstract class exists
      expect(JitteryTileComposer, isNotNull);
    });

    test('should have JitteryButton interface', () {
      // Verify the abstract class exists
      expect(JitteryButton, isNotNull);
    });

    test('should have JitteryTextField interface', () {
      // Verify the abstract class exists
      expect(JitteryTextField, isNotNull);
    });

    test('should have JitteryCard interface', () {
      // Verify the abstract class exists
      expect(JitteryCard, isNotNull);
    });
  });
}
 