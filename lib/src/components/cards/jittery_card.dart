import 'package:flutter/material.dart';

/// Abstract card component that can be implemented by different design languages
abstract class JitteryCard extends StatelessWidget {
  const JitteryCard({
    Key? key,
    required this.child,
    this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.elevation,
    this.borderRadius,
  }) : super(key: key);

  /// The main content of the card
  final Widget child;
  
  /// Optional title text
  final String? title;
  
  /// Optional subtitle text
  final String? subtitle;
  
  /// Optional leading widget (icon, image, etc.)
  final Widget? leading;
  
  /// Optional trailing widget (actions, etc.)
  final Widget? trailing;
  
  /// Optional tap callback
  final VoidCallback? onTap;
  
  /// Internal padding
  final EdgeInsetsGeometry? padding;
  
  /// External margin
  final EdgeInsetsGeometry? margin;
  
  /// Width of the card
  final double? width;
  
  /// Height of the card
  final double? height;
  
  /// Elevation/shadow depth
  final double? elevation;
  
  /// Border radius
  final BorderRadius? borderRadius;

  /// Build the card container
  Widget buildCardContainer(Widget content);

  /// Build the card header (title, subtitle, leading, trailing)
  Widget? buildCardHeader();

  /// Build the card content
  Widget buildCardContent();

  @override
  Widget build(BuildContext context) {
    final header = buildCardHeader();
    final content = buildCardContent();

    final cardContent = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (header != null) header,
        content,
      ],
    );

    final cardWidget = buildCardContainer(cardContent);

    if (onTap != null) {
      return GestureDetector(
        onTap: onTap,
        child: cardWidget,
      );
    }

    return cardWidget;
  }
} 