import 'package:demo_project/utils/color_class.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  var splashStyle = const TextStyle(
      letterSpacing: 1,
      fontSize: 40,
      fontFamily: "Montserrat",
      color: Colors.white,
      fontStyle: FontStyle.italic);

  var appBarStyle = TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontFamily: "Montserrat",
  );

  var barTextStyle = TextStyle(
    color: AppColor().appColor,
    fontSize: 20,
    fontFamily: "Montserrat",
  );

  var titleStyle = TextStyle(
    color: AppColor().appColor,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    fontFamily: "Montserrat",
  );

  var priceStyle = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    fontFamily: "Montserrat",
  );

  var subTitleStyle = const TextStyle(
    fontSize: 12,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.w300,
    fontFamily: "Montserrat",
  );

  var descriptionStyle = const TextStyle(
    fontSize: 14,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.w400,
    fontFamily: "Montserrat",
  );
}
