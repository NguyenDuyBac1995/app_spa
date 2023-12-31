import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'utils.dart';

class StyleApp {
  static TextStyle textStyle400(
      {Color color = Colors.black,
      double fontSize = 14,
      FontStyle fontStyle = FontStyle.normal,
      TextDecoration decoration = TextDecoration.none}) {
    return GoogleFonts.barlow(
      color: color,
      fontSize: fontSize,
      fontStyle: fontStyle,
      fontWeight: FontWeight.w400,
      decoration: decoration,
    );
  }

  static TextStyle textStyle500(
      {Color color = Colors.black,
      double fontSize = 14,
      TextDecoration decoration = TextDecoration.none}) {
    return GoogleFonts.barlow(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
      decoration: decoration,
    );
  }

  static TextStyle textStyle600(
      {Color color = Colors.black,
      double fontSize = 14,
      TextDecoration decoration = TextDecoration.none}) {
    return GoogleFonts.barlow(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
      decoration: decoration,
    );
  }

  static TextStyle textStyle700(
      {Color color = Colors.black,
      double fontSize = 14,
      TextDecoration decoration = TextDecoration.none}) {
    return GoogleFonts.barlow(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.w700,
      decoration: decoration,
    );
  }

  static TextStyle textStyle900(
      {Color color = Colors.black,
      double fontSize = 14,
      TextDecoration decoration = TextDecoration.none}) {
    return GoogleFonts.barlow(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.w900,
      decoration: decoration,
    );
  }

  static TextStyle styleGilroy700(
      {Color color = Colors.black,
      double fontSize = 14,
      TextDecoration decoration = TextDecoration.none}) {
    return safeGoogleFont(
      'SVN-Gilroy',
      fontSize: fontSize,
      fontWeight: FontWeight.w700,
      height: (fontSize + 1) / fontSize,
      letterSpacing: 0.001,
      color: color,
    );
  }
}
