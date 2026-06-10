import 'package:flutter/material.dart';

/// Abstract base class for a QR Code display component (EIC1027).
///
/// Renders [data] (e.g. a multiaddr or DID) as a scannable QR code.
abstract class JitteryQrCode extends StatelessWidget {
  final String data;
  final double size;
  final Color? foregroundColor;
  final Color? backgroundColor;

  const JitteryQrCode({
    Key? key,
    required this.data,
    this.size = 200,
    this.foregroundColor,
    this.backgroundColor,
  }) : super(key: key);

  /// Build the QR code widget
  Widget buildQrCode();

  @override
  Widget build(BuildContext context) {
    return buildQrCode();
  }
}
