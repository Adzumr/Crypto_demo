import 'package:flutter/material.dart';

import '../main.dart';

class AppTextFieldStyle {
  final appTextFieldStyle = InputDecoration(
    filled: true,
    fillColor: appColors.whiteColor,
    labelText: "Enter Volume",
    contentPadding: const EdgeInsets.all(20),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(
        color: appColors.blueColor,
      ),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(
        color: appColors.blueColor,
      ),
    ),
  );
}
