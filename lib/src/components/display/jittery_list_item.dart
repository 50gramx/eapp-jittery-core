import 'package:flutter/material.dart';

/// Abstract list item component that can be implemented by different design languages
abstract class JitteryListItem extends StatelessWidget {
  const JitteryListItem({
    Key? key,
    this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
  }) : super(key: key);

  /// Title text
  final String? title;
  
  /// Subtitle text
  final String? subtitle;
  
  /// Leading widget (icon, avatar, etc.)
  final Widget? leading;
  
  /// Trailing widget (icon, checkbox, etc.)
  final Widget? trailing;
  
  /// Tap callback
  final VoidCallback? onTap;

  /// Build the list item widget
  Widget buildListItem();

  @override
  Widget build(BuildContext context) {
    final listItem = buildListItem();

    if (onTap != null) {
      return GestureDetector(
        onTap: onTap,
        child: listItem,
      );
    }

    return listItem;
  }
}
