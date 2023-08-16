import 'package:flutter/material.dart';

import '../../utils/color_utils.dart';

class AppColors {
  static final MaterialColor primaryColors =
      ColorUtility.generateMaterialColor(primary);

  static const Color primary = Color(0xFFFFFFFF);
  static const Color primaryLight = Color(0xff7209b7);
  static const Color primaryDark = Color(0xff06283D);
  static const Color danger = Color(0xffE76161);
  static const Color pink = Color(0xffCF497A);
  static const Color greenAccent = Color(0xff00A884);
  static const Color green = Color(0xff92C000);
  static const Color greenMuda = Color(0xffF6FDCA);
  static const Color yellow = Color(0xffFFC300);
  static const Color grey = Color(0xff575757);
  static const Color biru1 = Color(0xff0074AE);
  static const Color biru2 = Color(0xff3C96E1);
  static const Color orange = Color(0xffF3A127);
  static const Color red = Color(0xffDB3A2E);
  static const Color deepGreen = Color(0xFF009C4D);
  static const Color gojekGreen = Color(0xFFDFFAD1);
  static const Color gojekRed = Color(0xFFFDE0DE);
  static const Color gojekYellow = Color(0xFFFFF7CC);
  static const Color gojekBlue = Color(0xFFC8F7FA);
}

class UIColors {
  static const Color white = Color(0xFFFFFFFF);
  static const Color text = Color(0xFF404040);
  static const Color grey_20 = Color(0xFFF0F3F6);
  static const Color grey_40 = Color(0xFFD1D5DB);
  static const Color grey_60 = Color(0xFFADB3BC);
  static const Color grey_80 = Color(0xFF50555C);
  static const Color grey_100 = Color(0xFF111111);
  static const Color custom_grey1 = Color(0xFFC4C4C4);

  static const Color defaultScaffoldBackgroundColor = Color(0xfffafafa);

  static const Color shimmerBaseColor = Color.fromARGB(255, 224, 224, 224);
  static const Color shimmerHighlightColor = Color.fromARGB(255, 241, 244, 245);
}
