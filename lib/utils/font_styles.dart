import 'package:cryppto_demo/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class AppFontStyles {
  final bodyStyle = GoogleFonts.roboto(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: appColors.blackColor,
  );
  final smallBodyStyle = GoogleFonts.roboto(
    fontSize: 12.sp,
    fontWeight: FontWeight.normal,
    color: appColors.blackColor,
  );
  final titleStyle = GoogleFonts.robotoSlab(
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    color: appColors.blackColor,
  );
}
