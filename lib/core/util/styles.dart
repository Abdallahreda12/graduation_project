import 'package:flutter/material.dart';

abstract class AppStyles {
  static TextStyle urbanistReqular16(BuildContext context) {
    return TextStyle(
        color: Colors.black,
        fontSize: getResposiveFontSize(context, fontsize: 16),
        fontFamily: 'Urbanist',
        fontWeight: FontWeight.w400);
  }

  static TextStyle urbanistReqular14(BuildContext context) {
    return TextStyle(
        color: Colors.black,
        fontSize: getResposiveFontSize(context, fontsize: 14),
        fontFamily: 'Urbanist',
        fontWeight: FontWeight.w400);
  }

  static TextStyle urbanistMedium14(BuildContext context) {
    return TextStyle(
        color: Colors.black,
        fontSize: getResposiveFontSize(context, fontsize: 14),
        fontFamily: 'Urbanist',
        fontWeight: FontWeight.w500);
  }

  static TextStyle urbanistSemiBold14(BuildContext context) {
    return TextStyle(
        color: Colors.black,
        fontSize: getResposiveFontSize(context, fontsize: 14),
        fontFamily: 'Urbanist',
        fontWeight: FontWeight.w600);
  }

  static TextStyle urbanistItalic18(BuildContext context) {
    return TextStyle(
        fontStyle: FontStyle.italic,
        color: Colors.black,
        fontSize: getResposiveFontSize(context, fontsize: 18),
        fontFamily: 'Urbanist',
        fontWeight: FontWeight.w400);
  }

  static TextStyle urbanistMedium22(BuildContext context) {
    return TextStyle(
        color: const Color(0xff16A99F),
        fontSize: getResposiveFontSize(context, fontsize: 22),
        fontFamily: 'Urbanist',
        fontWeight: FontWeight.w500);
  }

  static TextStyle urbanistReqular32(BuildContext context) {
    return TextStyle(
        color: Colors.black,
        fontSize: getResposiveFontSize(context, fontsize: 32),
        fontFamily: 'Urbanist',
        fontWeight: FontWeight.w400);
  }

  static TextStyle sansReqular48(BuildContext context) {
    return TextStyle(
        color: Colors.black,
        fontSize: getResposiveFontSize(context, fontsize: 48),
        fontFamily: 'RacingSansOne',
        fontWeight: FontWeight.w400);
  }
}

double getResposiveFontSize(BuildContext context, {required double fontsize}) {
  double scaleFactor = getScaleFactor(context);
  double resposiveFontSize = fontsize * scaleFactor;

  double lowerLimit = fontsize * 0.8;
  double upperLimit = fontsize * 1.2;

  return resposiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(BuildContext context) {
  // var dispatcher = PlatformDispatcher.instance;
  // var physicalWidth = dispatcher.views.first.physicalSize.width;
  // var devicePixelRatio = dispatcher.views.first.devicePixelRatio;

  double width = MediaQuery.sizeOf(context).width;
  if (width < 800) {
    return width / 360;
  } else if (width < 1300) {
    return width / 600;
  } else {
    return width / 900;
  }
}

//desktopLayout ->1300
//tablet layout ->800
