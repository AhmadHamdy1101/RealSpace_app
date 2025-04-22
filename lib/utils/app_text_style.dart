import 'package:flutter/material.dart';
import 'package:projects/extensions/responsive_font_size.dart';

import '../constants/Colors.dart';

abstract class AppStyles {
  static TextStyle styleBoldwhite20(BuildContext context) => TextStyle(
      fontSize: 20.toResponsiveFontSize(context),
      fontWeight: FontWeight.bold,
      color: Colors_app.white_color
  );
  static TextStyle styleBoldOrange15(BuildContext context) => TextStyle(
      fontSize: 15.toResponsiveFontSize(context),
      fontWeight: FontWeight.bold,
      color: Colors_app.orange_color
  );
  static TextStyle styleBoldBlack19(BuildContext context) => TextStyle(
    fontSize:19.toResponsiveFontSize(context),
    fontWeight: FontWeight.bold,
  );
  static TextStyle styleRegularGray15(BuildContext context) => TextStyle(
      fontSize:15.toResponsiveFontSize(context),
      color: Colors.grey[400]
  );

  static TextStyle styleBoldBlack20(BuildContext context) =>TextStyle(
      fontSize: 20.toResponsiveFontSize(context),
      fontWeight: FontWeight.bold
  );
  static TextStyle styleSeprodisplayHave50(BuildContext context) =>TextStyle(
    fontFamily: 'seprodisplay',
    color: Colors_app.blcak_color,
    fontWeight: FontWeight.w800,
    fontSize: 50.toResponsiveFontSize(context),
  );

  static TextStyle styleSeprodisplayRegural20(BuildContext context) =>
      TextStyle(
        fontFamily: 'seprodisplay',
        color: Colors_app.blcak_color,
        fontWeight: FontWeight.w400,
        fontSize: 20.toResponsiveFontSize(context),
      );

  static TextStyle styleSeprodisplayRegural36(BuildContext context) =>
      TextStyle(
          color: Colors_app.white_color,
          fontSize: 36.toResponsiveFontSize(context),
          fontWeight: FontWeight.w400
      );

}