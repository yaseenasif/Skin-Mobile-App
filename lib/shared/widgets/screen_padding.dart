import 'package:flutter/material.dart';

class ScreenPadding extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;

  /// A customizable widget to provide consistent padding around the screen.
  /// [child] is the widget to display inside this padding.
  /// [padding] defines the custom padding. Default is `EdgeInsets.all(16.0)`.
  const ScreenPadding({
    super.key,
    required this.child,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(16.0), // Default padding
      child: child,
    );
  }
}
