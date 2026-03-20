import 'package:flutter/material.dart';

/// Abstract list view component that can be implemented by different design languages
abstract class JitteryListView extends StatelessWidget {
  /// The child widgets to display in the list
  final List<Widget> children;

  /// Whether the list should shrink-wrap its content
  final bool shrinkWrap;

  /// Scroll physics for the list
  final ScrollPhysics? physics;

  const JitteryListView({
    Key? key,
    required this.children,
    this.shrinkWrap = true,
    this.physics,
  }) : super(key: key);

  /// Build the list view widget
  Widget buildListView();

  @override
  Widget build(BuildContext context) => buildListView();
}
