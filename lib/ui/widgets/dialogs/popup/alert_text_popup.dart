import 'package:flutter/material.dart';
import 'package:simple_sfa_mobile/core/constants.dart';
import 'package:simple_sfa_mobile/core/theme/color.dart';
import 'package:simple_sfa_mobile/ui/widgets/button.dart';
import 'package:simple_sfa_mobile/ui/widgets/text.dart';

class AlertTextPopup extends StatelessWidget {
  final String? title;
  final String? message;
  const AlertTextPopup({super.key, this.title, this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(paddingExtraLarge),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: VText(
              title,
              color: VColor.black,
              fontSize: textSizeLarge,
              isBold: true,
            ),
          ),
          spaceVerticalLarge,
          Align(
            alignment: Alignment.centerLeft,
            child: VText(
              message,
              color: VColor.grey3,
              fontSize: textSizeMedium,
              isBold: false,
            ),
          ),
          const SizedBox(
            height: marginExtraLarge,
          ),
          VButton(
            text: "Ok",
            textColor: VColor.white,
            buttonColor: VColor.primary,
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
