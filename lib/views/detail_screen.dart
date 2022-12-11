import 'package:cryppto_demo/controllers/api_service_controller.dart';
import 'package:cryppto_demo/main.dart';
import 'package:cryppto_demo/models/coin_model.dart';
import 'package:cryppto_demo/widgets/coin_widget.dart';
import 'package:currency_formatter/currency_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../utils/constants.dart';
import '../widgets/app_elevated_button.dart';

class DetailScreen extends StatelessWidget {
  final CoinModel? coinModel;
  const DetailScreen({required this.coinModel, super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController volumeController = TextEditingController();
    ApiServiceController controller = Get.find<ApiServiceController>();
    final ValueNotifier<double> price = ValueNotifier<double>(
        coinModel!.currentPrice! * controller.nairaPrice!);
    double? volume = 1.0;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: appColors.shadowColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(25.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
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
                    "Convert",
                    style: appFontStyles.bodyStyle.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox.shrink()
                ],
              ),
              SizedBox(height: 4.h),
              Card(
                elevation: 0.5,
                shadowColor: appColors.blueColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.sp),
                ),
                child: CoinWidget(
                  coin: coinModel!,
                  controler: controller,
                ),
              ),
              SizedBox(height: 8.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ValueListenableBuilder(
                    valueListenable: price,
                    builder:
                        (BuildContext context, dynamic value, Widget? child) {
                      return PriceCard(
                        volumeController: volumeController,
                        price: price,
                      );
                    },
                  ),
                  SizedBox(height: 2.h),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp("[0-9.]")),
                    ],
                    decoration: appTextFieldStyle.appTextFieldStyle,
                    controller: volumeController,
                    onChanged: (value) {
                      volume = double.tryParse(volumeController.text);
                    },
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              AppElevatedButton(
                onPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();

                  final unitInNaira =
                      coinModel!.currentPrice! * controller.nairaPrice!;
                  price.value = volume! * unitInNaira;
                },
                title: "Submit",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PriceCard extends StatelessWidget {
  const PriceCard({
    Key? key,
    required this.volumeController,
    required this.price,
  }) : super(key: key);

  final TextEditingController volumeController;
  final ValueNotifier<double> price;

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
