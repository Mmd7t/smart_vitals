import 'package:flutter/material.dart';

class _ColorMaps {
  static final Map<int, Color> cWhite = {
    50: Color.fromRGBO(255, 255, 255, 0.1),
    100: Color.fromRGBO(255, 255, 255, 0.2),
    200: Color.fromRGBO(255, 255, 255, 0.3),
    300: Color.fromRGBO(255, 255, 255, 0.4),
    400: Color.fromRGBO(255, 255, 255, 0.5),
    500: Color.fromRGBO(255, 255, 255, 0.6),
    600: Color.fromRGBO(255, 255, 255, 0.7),
    700: Color.fromRGBO(255, 255, 255, 0.8),
    800: Color.fromRGBO(255, 255, 255, 0.9),
    900: Color.fromRGBO(255, 255, 255, 1),
  };

  static final Map<int, Color> cdarkwhite = {
    50: Color.fromRGBO(252, 253, 255, 0.1),
    100: Color.fromRGBO(252, 253, 255, 0.2),
    200: Color.fromRGBO(252, 253, 255, 0.3),
    300: Color.fromRGBO(252, 253, 255, 0.4),
    400: Color.fromRGBO(252, 253, 255, 0.5),
    500: Color.fromRGBO(252, 253, 255, 0.6),
    600: Color.fromRGBO(252, 253, 255, 0.7),
    700: Color.fromRGBO(252, 253, 255, 0.8),
    800: Color.fromRGBO(252, 253, 255, 0.9),
    900: Color.fromRGBO(252, 253, 255, 1),
  };

  static final Map<int, Color> cLightGreyMap = {
    50: Color.fromRGBO(241, 241, 241, 0.1),
    100: Color.fromRGBO(241, 241, 241, 0.2),
    200: Color.fromRGBO(241, 241, 241, 0.3),
    300: Color.fromRGBO(241, 241, 241, 0.4),
    400: Color.fromRGBO(241, 241, 241, 0.5),
    500: Color.fromRGBO(241, 241, 241, 0.6),
    600: Color.fromRGBO(241, 241, 241, 0.7),
    700: Color.fromRGBO(241, 241, 241, 0.8),
    800: Color.fromRGBO(241, 241, 241, 0.9),
    900: Color.fromRGBO(241, 241, 241, 1),
  };
  static final Map<int, Color> cDarkblueMap = {
    50: Color.fromRGBO(38, 69, 125, 0.1),
    100: Color.fromRGBO(38, 69, 125, 0.2),
    200: Color.fromRGBO(38, 69, 125, 0.3),
    300: Color.fromRGBO(38, 69, 125, 0.4),
    400: Color.fromRGBO(38, 69, 125, 0.5),
    500: Color.fromRGBO(38, 69, 125, 0.6),
    600: Color.fromRGBO(38, 69, 125, 0.7),
    700: Color.fromRGBO(38, 69, 125, 0.8),
    800: Color.fromRGBO(38, 69, 125, 0.9),
    900: Color.fromRGBO(38, 69, 125, 1),
  };

  static final Map<int, Color> cblackMap = {
    50: Color.fromRGBO(93, 93, 93, 0.1),
    100: Color.fromRGBO(93, 93, 93, 0.2),
    200: Color.fromRGBO(93, 93, 93, 0.3),
    300: Color.fromRGBO(93, 93, 93, 0.4),
    400: Color.fromRGBO(93, 93, 93, 0.5),
    500: Color.fromRGBO(93, 93, 93, 0.6),
    600: Color.fromRGBO(93, 93, 93, 0.7),
    700: Color.fromRGBO(93, 93, 93, 0.8),
    800: Color.fromRGBO(93, 93, 93, 0.9),
    900: Color.fromRGBO(93, 93, 93, 1),
  };

  static final Map<int, Color> clightGreenMap = {
    50: Color.fromRGBO(11, 177, 211, 0.1),
    100: Color.fromRGBO(11, 177, 211, 0.2),
    200: Color.fromRGBO(11, 177, 211, 0.3),
    300: Color.fromRGBO(11, 177, 211, 0.4),
    400: Color.fromRGBO(11, 177, 211, 0.5),
    500: Color.fromRGBO(11, 177, 211, 0.6),
    600: Color.fromRGBO(11, 177, 211, 0.7),
    700: Color.fromRGBO(11, 177, 211, 0.8),
    800: Color.fromRGBO(11, 177, 211, 0.9),
    900: Color.fromRGBO(11, 177, 211, 1),
  };
}

class AppColors {
  const AppColors();

  static final MaterialColor cLightGrey =
      MaterialColor(0xFFF1F1F1, _ColorMaps.cLightGreyMap);
  static final MaterialColor cDarkblue =
      MaterialColor(0xFF26457d, _ColorMaps.cDarkblueMap);
  static final MaterialColor cWhite =
      MaterialColor(0xFFFFFFFF, _ColorMaps.cWhite);
  static final MaterialColor cdarkwhite =
      MaterialColor(0xFFFCFDFF, _ColorMaps.cdarkwhite);
  static final MaterialColor cblack =
      MaterialColor(0xFF5D5D5D, _ColorMaps.cblackMap);
  static final MaterialColor clightGreen =
      MaterialColor(0xFF0BB1D3, _ColorMaps.clightGreenMap);
}

class AppFonts {
  const AppFonts();

  static final String _fontfamily = 'lato';
  static final String _fontfamilylogo = 'MarckScript';

  static final TextStyle logo = TextStyle(
    fontFamily: _fontfamilylogo,
    fontSize: 25.0,
  );
  static final TextStyle profile = TextStyle(
    fontFamily: _fontfamily,
    fontSize: 24.0,
  );
  static final TextStyle heading1 = TextStyle(
    fontSize: 64,
    fontFamily: _fontfamily,
  );
  static final TextStyle maintext = TextStyle(
    fontSize: 30,
    fontFamily: _fontfamily,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle buttonText = TextStyle(
    fontSize: 30,
    fontFamily: _fontfamily,
  );
  static final TextStyle appText = TextStyle(
    fontSize: 20,
    fontFamily: _fontfamily,
  );
  static final TextStyle captiontext2 = TextStyle(
    fontSize: 20,
    fontFamily: _fontfamily,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle forgot = TextStyle(
    fontSize: 16,
    fontFamily: _fontfamily,
  );

  static final TextStyle profileinfo = TextStyle(
    fontSize: 12,
    fontFamily: _fontfamily,
  );
  static final TextStyle boxText = TextStyle(
    fontSize: 14,
    fontFamily: _fontfamily,
  );
  static final TextStyle precentage = TextStyle(
    fontSize: 36,
    fontFamily: _fontfamily,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle captiontext = TextStyle(
    fontSize: 16,
    fontFamily: _fontfamily,
    fontWeight: FontWeight.bold,
  );
}
