import 'package:flutter/material.dart';

class AppSize {
  BuildContext context;
  AppSize(this.context);
  double get width => MediaQuery.of(context).size.width;
  double get height => (MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top);
  EdgeInsetsGeometry get appPadding => EdgeInsets.symmetric(vertical: height * 0.01, horizontal: width * 0.025);
  double get largText1 => MediaQuery.of(context).size.width * 0.065;
  double get largText2 => MediaQuery.of(context).size.width * 0.06;
  double get largText3 => MediaQuery.of(context).size.width * 0.051;
  // * Medium Size * //
  double get mediumText1 => MediaQuery.of(context).size.width * 0.053;
  double get mediumText2 => MediaQuery.of(context).size.width * 0.05;
  double get mediumText3 => MediaQuery.of(context).size.width * 0.043;
  double get mediumText4 => MediaQuery.of(context).size.width * 0.04;
  // * Small Size * //
  double get smallText1 => MediaQuery.of(context).size.width * 0.038;
  double get smallText2 => MediaQuery.of(context).size.width * 0.035;
  double get smallText3 => MediaQuery.of(context).size.width * 0.032;
  double get smallText33 => MediaQuery.of(context).size.width * 0.032;
  double get smallText6 => MediaQuery.of(context).size.width * 0.03;
  double get smallText4 => MediaQuery.of(context).size.width * 0.028;
  double get smallText44 => MediaQuery.of(context).size.width * 0.028;
  double get smallText5 => MediaQuery.of(context).size.width * 0.023;
  double get smallText7 => MediaQuery.of(context).size.width * 0.02;
  double get buttonText1 => MediaQuery.of(context).size.width * 0.05;
  double get buttonText2 => MediaQuery.of(context).size.width * 0.043;
  double get buttonText3 => MediaQuery.of(context).size.width * 0.038;
}
