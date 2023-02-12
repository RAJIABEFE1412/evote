import 'package:flutter/material.dart';

class EvoteColors {
  static const MaterialColor primary = const MaterialColor(
    0xFFFFFFFF,
    const <int, Color>{
      50: const Color(0xFFFFFFFF),
      100: const Color(0xFFFFFFFF),
      200: const Color(0xFFFFFFFF),
      300: const Color(0xFFFFFFFF),
      400: const Color(0xFFFFFFFF),
      500: const Color(0xFFFFFFFF),
      600: const Color(0xFFFFFFFF),
      700: const Color(0xFFFFFFFF),
      800: const Color(0xFFFFFFFF),
      900: const Color(0xFFFFFFFF),
    },
  );

  static const MaterialColor secondary = const MaterialColor(
    0xFF051C3F,
    const <int, Color>{
      50: const Color.fromRGBO(77, 59, 145, 0.1),
      100: const Color.fromRGBO(77, 59, 145, 0.2),
      200: const Color.fromRGBO(77, 59, 145, 0.3),
      300: const Color.fromRGBO(77, 59, 145, 0.4),
      400: const Color.fromRGBO(77, 59, 145, 0.5),
      500: const Color.fromRGBO(77, 59, 145, 0.6),
      600: const Color.fromRGBO(77, 59, 145, 0.7),
      700: const Color.fromRGBO(77, 59, 145, 0.8),
      800: const Color.fromRGBO(77, 59, 145, 0.9),
      900: const Color.fromRGBO(77, 59, 145, 1),
    },
  );

  static const Color transparent = Color(0x00);
  static const Color transparentBlack = Color(0x30000000);
  static const Color transparentDark = Color(0x55000000);
  static const Color transparentPage = Color(0x22FFFFFF);
  static const Color transparentGrey = Color(0x108A8A8F);
  static const Color purple = Color(0xFF4D3B91);
  static const Color teal = Color(0xFF40E6D1);
  static const Color purpleLight = Color(0xFF5166FF);
  static const Color purplePale = Color(0xFFF2EFFF);
  static const Color purplePaleDark = Color(0xFFE8E2FF);
  static const Color gray = Color(0xFFE0E0E0);
  static const Color darkGray = Color(0xFF8A8A8F);
  static const Color greyText = Color(0xFF919191);
  static const Color grayBorder = Color(0xFFEFEFEF);
  static const Color grayBorder2 = Color(0xFFEAEAEA);
  static const Color grayBtn = Color(0xFFF3F3F3);
  static const lightBluebackground = Color(0xFFD9E0EA);
  static const lightestBluebackground = Color(0x23D9E0EA);
  static const Color grayScaffold = Color(0xFFF2F3F8);
  static const Color blue = Color(0xFF035AA6);
  static const Color navy = Color(0xFF03435F);
  static const Color lightGreen = Color(0xFFE4F6EB);
  static const Color blueSky = Color(0xFFE9F3FF);
  static const Color blueBorder = Color(0xFF007AFF);
  static const Color blueLight = Color(0xFF69A6E6);
  static const Color blueText = Color(0xFF183F82);
  static const Color blueDeep = Color(0xFF1C4482);
  static const Color bnb = Color(0xFF183C75);
  static const blueGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF4888EC),
      blueText,
    ],
  );
  static const whiteGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Colors.white,
      Colors.white,
    ],
  );
  static const blackGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF3F3E3E),
      black,
    ],
  );
  static const greyGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      gray,
      Color(0x55919191),
    ],
  );
  static const lightGreenGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFA6C521),
      Color(0xFF839A2C),
    ],
  );
  static const orangeGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFF97D00),
      Color(0xD2F57E15),
    ],
  );
  static const deepGreenGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF007D55),
      Color(0xff305F32),
    ],
  );
  static const Color yellow = Color(0xFFFFE3AC);
  static const Color orange = Color(0xFFFF8201);
  static const Color yellowLight = Color(0xFFFFF2E6);
  static const Color yellowDark = Color(0xFFF2994A);
  static const Color yellowPale = Color(0xFFFFF6DB);
  static const Color yellowPaleDark = Color(0xFFFFEEBB);
  static const Color lightRed = Color(0xFFFCD7D7);
  static const Color moneeAsh = Color(0xFF979797);
  static const Color red = Color(0xFFF35656);
  static const Color redLight = Color(0xFFFEB9B9);
  static const Color velvet = Color(0xFFCB2026);
  static const Color lightPurple = Color(0xFFF3F0FF);
  static const Color pink = Color(0xFFFFDDFC);
  static const Color green = Color(0xFF00AB09);
  static const Color moneeGrey = Color(0xFFF6F7FB);
  static const Color greenPale = Color(0xFFDEFFEC);
  static const Color greenPaleDark = Color(0xFFB9FFD7);
  static const Color greenDark = Color(0xff305F32);
  static const Color white = Color(0xFFFFFFFF);
  static const Color moneeNavyLight = Color(0xFF1E3352);
  static const Color black = Color(0xFF212121);
  static const Color blackBg = Color(0xA01A1919);
  static const Color divider = Color(0xFFDADADA);
  static const Color overlay = Color(0x752B2A2A);
  static const Color dividerDark = Color(0xFFB9B9B9);
  static const Color darkGrey = Color(0xFF656F78);
  static const Color lightGrey = Color(0xff666666);
  static const Color boderGrey = Color(0x99949494);

  static const purpleGradient = LinearGradient(
    colors: [
      Color(0xFF2C1B68),
      Color.fromRGBO(66, 27, 104, 0.85),
    ],
    stops: [
      0,
      1.14,
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
