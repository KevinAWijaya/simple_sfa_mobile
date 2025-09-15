import 'package:flutter/widgets.dart';
import 'package:simple_sfa_mobile/core/theme/color.dart';

class VText extends StatelessWidget {
  final String? title;
  final double? fontSize;
  final TextOverflow? overflow;
  final TextAlign? align;
  final TextDecoration? decoration;
  final int? maxLines;
  final Color? color;
  final bool? isBold;
  final FontStyle? fontStyle;
  final FontWeight? fontWeight;
  final VoidCallback? onPressed;

  const VText(
    this.title, {
    super.key,
    this.fontSize,
    this.overflow,
    this.onPressed,
    this.decoration,
    this.maxLines,
    this.align,
    this.color = VColor.black,
    this.fontWeight,
    this.fontStyle,
    this.isBold = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Text(
        title!,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontStyle: fontStyle,
          fontWeight: fontWeight ?? (isBold! ? FontWeight.bold : FontWeight.normal),
          decoration: decoration,
          decorationColor: VColor.black,
        ),
        overflow: overflow,
        textAlign: align,
        maxLines: maxLines,
      ),
    );
  }
}
