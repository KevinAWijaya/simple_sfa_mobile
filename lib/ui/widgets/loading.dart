import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_sfa_mobile/core/constants.dart';
import 'package:simple_sfa_mobile/core/theme/color.dart';
import 'package:simple_sfa_mobile/ui/widgets/text.dart';

class LoadingHelper {
  static void showLoading() {
    Get.dialog(
      barrierDismissible: false,
      Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: marginMedium, vertical: marginLarge),
            decoration: BoxDecoration(
              color: VColor.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(
                  color: VColor.primary,
                ),
                SizedBox(height: 16),
                VText(
                  "Loading...",
                  fontSize: textSizeMedium,
                  color: VColor.primary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static void hideLoading() {
    if (Get.isDialogOpen == true) {
      Get.back();
    }
  }
}
