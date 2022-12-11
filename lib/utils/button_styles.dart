import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../main.dart';

class AppButtonsStyle {
  final elevatedButton = ElevatedButton.styleFrom(
    elevation: 2,
    padding: EdgeInsets.symmetric(vertical: 1.5.h),
    textStyle: appFontStyles.smallBodyStyle,
    foregroundColor: appColors.whiteColor,
    backgroundColor: appColors.blueColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.sp),
    ),
  );
}
