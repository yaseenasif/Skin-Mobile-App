import 'package:flutter/material.dart';
import 'package:skinner/shared/navigation/navigation_service.dart';

import '../../shared/widgets/loading_dialog.dart';

class DialogUtil {
  /// Show a non-dismissible loading dialog
  static void showLoadingDialog() {
    showDialog(
      context: AppNavigator.navigatorKey.currentState!.context,
      barrierDismissible: false, // Prevent dismissal
      barrierColor: Colors.black.withOpacity(0.5), // Dim the background
      builder: (BuildContext dialogContext) {
        return const LoadingDialog();
      },
    );
  }

  /// Hide the currently displayed loading dialog
  static void hideLoadingDialog() {
    AppNavigator.pop();
  }
}
