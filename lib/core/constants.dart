import 'package:flutter/widgets.dart';

const String imagePath = "assets/image/";
const String iconPath = "assets/icons/";
const kAnimationDuration = Duration(milliseconds: 200);

int taxPercentage = 11;

const double maxScreenWidth = 800;

const double textSizeSuperSmall = 9.0;
const double textSizeSmall = 11.0;
const double textSizeMedium = 13.0;
const double textSizeLarge = 15.0;
const double textSizeExtraLarge = 18.0;
const double textSizeSuperLarge = 21.0;

const double radiusSmall = 8.0;
const double radiusMedium = 10.0;
const double radiusLarge = 12.0;
const double radiusExtraLarge = 16.0;
const double radiusSuperLarge = 20.0;
const double radiusMax = 25.0;

const double paddingSuperSmall = 5.0;
const double paddingSmall = 10.0;
const double paddingMedium = 14.0;
const double paddingLarge = 18.0;
const double paddingExtraLarge = 24.0;

const double marginSuperSmall = 5.0;
const double marginSmall = 10.0;
const double marginMedium = 14.0;
const double marginLarge = 18.0;
const double marginExtraLarge = 24.0;
const double marginViewTop = 30.0;

Widget spaceVerticalSuperSmall = const SizedBox(height: marginSuperSmall);
Widget spaceVerticalSmall = const SizedBox(height: marginSmall);
Widget spaceVerticalMedium = const SizedBox(height: marginMedium);
Widget spaceVerticalLarge = const SizedBox(height: marginLarge);
Widget spaceVerticalSuperLarge = const SizedBox(height: marginExtraLarge);
Widget spaceVerticalCustom(double value) => SizedBox(height: value);

Widget spaceHorizontalSuperSmall = const SizedBox(width: marginSuperSmall);
Widget spaceHorizontalSmall = const SizedBox(width: marginSmall);
Widget spaceHorizontalMedium = const SizedBox(width: marginMedium);
Widget spaceHorizontalLarge = const SizedBox(width: marginLarge);
Widget spaceHorizontalSuperLarge = const SizedBox(width: marginExtraLarge);

const double imageSizeIcon = 7.0;
const double imageSizeBack = 15.0;
const double imageSizeSmall = 40.0;
const double imageSizeMedium = 50.0;
const double imageSizeLarge = 120.0;

const double defaultHeightBackroundPrimary = 195.0;
const double defaultHeightContainerCard = 150.0;
const double defaultProfileCard = 85.0;
const double defaultWidthContainerCard = 335.0;
