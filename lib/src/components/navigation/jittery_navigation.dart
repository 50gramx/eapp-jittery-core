import 'package:flutter/material.dart';

/// Abstract navigation component that can be implemented by different design languages
abstract class JitteryNavigation extends StatelessWidget {
  const JitteryNavigation({
    Key? key,
    required this.items,
    required this.onItemSelected,
    this.selectedIndex = 0,
    this.type = JitteryNavigationType.bottom,
    this.backgroundColor,
    this.selectedItemColor,
    this.unselectedItemColor,
    this.elevation,
  }) : super(key: key);

  /// Navigation items to display
  final List<JitteryNavigationItem> items;
  
  /// Callback when an item is selected
  final ValueChanged<int> onItemSelected;
  
  /// Currently selected item index
  final int selectedIndex;
  
  /// Type of navigation (bottom, left, top)
  final JitteryNavigationType type;
  
  /// Background color
  final Color? backgroundColor;
  
  /// Color for selected items
  final Color? selectedItemColor;
  
  /// Color for unselected items
  final Color? unselectedItemColor;
  
  /// Elevation/shadow depth
  final double? elevation;

  /// Build the navigation widget
  Widget buildNavigation();

  @override
  Widget build(BuildContext context) {
    return buildNavigation();
  }
}

/// Navigation item data
class JitteryNavigationItem {
  const JitteryNavigationItem({
    required this.icon,
    required this.label,
    this.badge,
    this.onTap,
  });

  /// Icon to display
  final IconData icon;
  
  /// Label text
  final String label;
  
  /// Optional badge (notification count, etc.)
  final Widget? badge;
  
  /// Optional tap callback
  final VoidCallback? onTap;
}

/// Navigation types
enum JitteryNavigationType {
  bottom,
  left,
  top,
} 