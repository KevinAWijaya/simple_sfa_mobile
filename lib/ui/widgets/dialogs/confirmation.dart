import 'package:flutter/material.dart';
import 'package:simple_sfa_mobile/core/constants.dart';
import 'package:simple_sfa_mobile/core/theme/color.dart';
import 'package:simple_sfa_mobile/ui/widgets/button.dart';

class CustomConfirmDialog extends StatelessWidget {
  final String title;
  final String message;
  final String positiveText;
  final String negativeText;
  final VoidCallback? onPressedOk;
  final VoidCallback? onPressedCancel;

  const CustomConfirmDialog({
    Key? key,
    required this.title,
    required this.message,
    this.positiveText = "YA",
    this.negativeText = "TIDAK",
    required this.onPressedOk,
    required this.onPressedCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: VColor.background,
      insetPadding: const EdgeInsets.all(marginLarge),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(radiusLarge)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(paddingLarge),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: textSizeLarge,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            spaceVerticalMedium,
            Image.asset(
              "${imagePath}thinking-person.png",
              height: 120,
            ),
            spaceVerticalMedium,
            Text(
              message,
              style: const TextStyle(fontSize: textSizeMedium),
              textAlign: TextAlign.center,
            ),
            spaceVerticalSuperLarge,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                VButton(
                  text: negativeText,
                  onTap: onPressedCancel,
                  textColor: VColor.primary,
                  buttonColor: VColor.white,
                  borderColor: VColor.primary,
                  borderWitdh: 5,
                ),
                VButton(
                  text: positiveText,
                  onTap: onPressedOk,
                  textColor: VColor.white,
                  buttonColor: VColor.primary,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
