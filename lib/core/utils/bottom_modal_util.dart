import 'package:flutter/material.dart';

class BottomModalUtil {
  /// Show a bottom modal with a custom widget
  static void showBottomModal(BuildContext context, Widget child) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      builder: (_) => child,
    );
  }
}
