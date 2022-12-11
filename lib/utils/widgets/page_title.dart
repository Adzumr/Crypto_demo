import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../main.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({
    required this.title,
    Key? key,
  }) : super(key: key);
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.adaptive.arrow_back,
          ),
        ),
        Text(
          "$title",
          style: appFontStyles.bodyStyle.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox.shrink()
      ],
    );
  }
}
