import 'package:flutter/cupertino.dart';
import 'package:pozitive/Core/AppConstact/appColors.dart';
import 'package:pozitive/Core/AppConstact/sizeConfig.dart';

class AppStyle {
  static final TextStyle headerTextstyle = TextStyle(
    fontSize: SizeConfig.screenHeight * .02,
  );
  static final TextStyle smallRedTextStyle =
      TextStyle(fontSize: SizeConfig.screenHeight * .02, color: AppColors.red);
}
