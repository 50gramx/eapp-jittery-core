import 'package:flutter/material.dart';
import 'package:yaml/yaml.dart';

/// Abstract tile composer that can work with different design language implementations.
/// 
/// This class provides the framework for composing tiles from contracts,
/// but delegates the actual tile creation to design language specific implementations.
abstract class JitteryTileComposer {
  const JitteryTileComposer();

  /// Build a tile from a contract
  Widget fromContract({
    required int communityCode,
    required String orgName,
    required String appName,
    required YamlList conditions,
    required Widget composedComponent,
    Function({
      required int communityCode,
      required String orgName,
      required String appName,
      required String variableNameCode,
    })? variableResolver,
  });

  /// Build a visibility widget
  Widget buildVisibility({
    required bool visible,
    required Widget child,
  });
}
