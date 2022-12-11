import 'package:currency_formatter/currency_formatter.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../main.dart';
import '../constants.dart';

class PriceCard extends StatelessWidget {
  const PriceCard({
    Key? key,
    required this.volumeController,
    required this.price,
  }) : super(key: key);

  final TextEditingController volumeController;
  final ValueNotifier<num> price;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      shadowColor: appColors.blueColor,
      color: appColors.blueColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.sp),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(15.sp),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.sp),
        ),
        tileColor: appColors.whiteColor,
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "Volume",
              style: appFontStyles.titleStyle,
            ),
            Text(
              volumeController.text.isEmpty ? "1.0" : volumeController.text,
              overflow: TextOverflow.ellipsis,
              style: appFontStyles.bodyStyle,
            ),
          ],
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Price",
              style: appFontStyles.titleStyle,
            ),
            Text(
              CurrencyFormatter.format(
                "${price.value}",
                nairaSettings,
              ),
              overflow: TextOverflow.visible,
              style: appFontStyles.bodyStyle,
            ),
          ],
        ),
      ),
    );
  }
}
