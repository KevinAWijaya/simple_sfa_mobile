import 'package:flutter/material.dart';
import 'package:simple_sfa_mobile/core/constants.dart';
import 'package:simple_sfa_mobile/core/theme/color.dart';
import 'package:simple_sfa_mobile/ui/widgets/text.dart';

class VButton extends StatelessWidget {
  const VButton({
    super.key,
    required this.text,
    this.textColor = VColor.white,
    this.textSize = textSizeSmall,
    this.icon,
    this.iconColor = VColor.white,
    this.iconSize = textSizeMedium,
    this.onTap,
    this.buttonColor = VColor.secondary,
    this.borderColor = VColor.transparent,
    this.borderWitdh = 0,
    this.disabled = false,
  });

  final Color buttonColor;

  final String text;
  final Color textColor;
  final double textSize;

  final IconData? icon;
  final Color iconColor;
  final double iconSize;

  final Color borderColor;
  final double borderWitdh;

  final bool disabled;

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: disabled ? null : onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: marginMedium, vertical: marginSmall),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor, strokeAlign: borderWitdh),
          borderRadius: BorderRadius.circular(radiusSmall),
          color: disabled ? VColor.secondaryOpacity : buttonColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: icon != null,
              child: Container(
                margin: const EdgeInsets.only(right: marginSuperSmall),
                child: Icon(
                  icon,
                  color: iconColor,
                  size: iconSize,
                ),
              ),
            ),
            VText(
              text,
              fontSize: textSize,
              isBold: true,
              color: textColor,
            ),
          ],
        ),
      ),
    );
  }
}
