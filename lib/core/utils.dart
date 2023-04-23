import 'package:bookverse/src/presentation/custom_widget/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utility {
  static void showLoading() {
    Get.dialog(
      const Center(child: LoadingWidget()),
      barrierDismissible: false,
    );
  }

  static void hideLoading() => Get.back();

  static void showSnackBarMessage(
    String content, {
    String title = 'Notification',
    Duration? duration,
  }) {
    Get.snackbar(
      title,
      content,
      backgroundColor: Get.theme.colorScheme.primary,
      colorText: Get.theme.colorScheme.onPrimary,
      duration: duration ?? const Duration(seconds: 3),
    );
  }

  static void showSnackBarError(
    String content, {
    String title = 'Error',
    Duration? duration,
  }) {
    Get.snackbar(
      title,
      content,
      backgroundColor: Get.theme.colorScheme.error,
      colorText: Get.theme.colorScheme.onError,
      duration: duration ?? const Duration(seconds: 3),
    );
  }
}
