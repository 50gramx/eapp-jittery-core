import 'package:flutter/material.dart';

/// Abstract base class for Image component
abstract class JitteryImage extends StatelessWidget {
  final String src;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final BorderRadius? borderRadius;

  const JitteryImage({
    Key? key,
    required this.src,
    this.width,
    this.height,
    this.fit,
    this.borderRadius,
  }) : super(key: key);

  /// Build the image widget
  Widget buildImage();

  @override
  Widget build(BuildContext context) {
    return buildImage();
  }
}
