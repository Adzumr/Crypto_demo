import 'package:cryppto_demo/controllers/api_service_controller.dart';
import 'package:cryppto_demo/utils/constants.dart';
import 'package:currency_formatter/currency_formatter.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../main.dart';
import '../models/coin_model.dart';

class CoinWidget extends StatelessWidget {
  const CoinWidget({
    Key? key,
    required this.coin,
    required this.controler,
  }) : super(key: key);

  final CoinModel coin;
  final ApiServiceController controler;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(20.sp),
      trailing: Image(
        image: NetworkImage(coin.image!),
        height: 5.h,
        fit: BoxFit.contain,
      ),
      title: Text(
        "${coin.name}",
        style: appFontStyles.titleStyle,
      ),
      subtitle: Text(
        CurrencyFormatter.format(
            coin.currentPrice! * controler.nairaPrice!, nairaSettings),
        // coin.currentPrice == null
        //     ? "0.0"
        //     : (coin.currentPrice! * controler.nairaPrice!)
        //         .toStringAsFixed(2),
        style: appFontStyles.bodyStyle,
      ),
    );
  }
}
