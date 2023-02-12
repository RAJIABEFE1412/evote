import 'package:flutter/widgets.dart' show TextStyle, FontWeight;

class EvoteFonts {
  ///
  /// FONT-FAMILY MARK PRO
  ///
  static const markPro = "Roboto";
}

class EvoteTextStyle {
  static TextStyle light = TextStyle(
    fontFamily: EvoteFonts.markPro,
    fontWeight: FontWeight.w100,
  );

  static TextStyle medium = TextStyle(
    // GoogleFonts.oEvoteSans(
    fontWeight: FontWeight.w500,
    fontFamily: EvoteFonts.markPro,
  );

  static final TextStyle bold = TextStyle(
    fontWeight: FontWeight.w700,
    fontFamily: EvoteFonts.markPro,
  );

  static final TextStyle black = TextStyle(
    fontWeight: FontWeight.w900,
    fontFamily: EvoteFonts.markPro,
  );
}
