import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_sfa_mobile/core/constants.dart';
import 'package:simple_sfa_mobile/core/theme/color.dart';

import 'popup/alert_text_popup.dart';

class XPopup {
  XPopup._privateConstructor();

  static final XPopup _instance = XPopup._privateConstructor();

  factory XPopup() {
    return _instance;
  }

  AlertDialog _alertDialog({@required Widget? content}) {
    return AlertDialog(
      scrollable: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      backgroundColor: VColor.white,
      content: content,
      contentPadding: EdgeInsets.zero,
      insetPadding: const EdgeInsets.all(paddingExtraLarge),
    );
  }

  void alertText(String title, String message) {
    showGeneralDialog(
      barrierDismissible: false,
      transitionDuration: const Duration(milliseconds: 200),
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0)).animate(anim1),
          child: child,
        );
      },
      context: Get.context!,
      pageBuilder: (context, anim1, anim2) {
        return Container(
          height: 400,
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 30, left: 10, right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: _alertDialog(
            content: AlertTextPopup(
              title: title,
              message: message,
            ),
          ),
        );
      },
    );
  }
}
