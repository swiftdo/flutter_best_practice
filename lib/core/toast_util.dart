import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class MyToast {
  /// init EasyLoading
  static TransitionBuilder init({
    TransitionBuilder? builder,
  }) {
    return EasyLoading.init();
  }

  static Future<void> showSuccess(
    String status, {
    Duration? duration,
    EasyLoadingMaskType? maskType,
    bool? dismissOnTap,
  }) {
    return EasyLoading.showSuccess(
      status,
      duration: duration,
      maskType: maskType,
      dismissOnTap: dismissOnTap,
    );
  }

  static Future<void> showError(
    String status, {
    Duration? duration,
    EasyLoadingMaskType? maskType,
    bool? dismissOnTap,
  }) {
    return EasyLoading.showError(
      status,
      dismissOnTap: dismissOnTap,
      duration: duration,
      maskType: maskType,
    );
  }

  static Future<void> showInfo(
    String status, {
    Duration? duration,
    EasyLoadingMaskType? maskType,
    bool? dismissOnTap,
  }) {
    return EasyLoading.showInfo(status,
        duration: duration, maskType: maskType, dismissOnTap: dismissOnTap);
  }
}
