import 'package:cryppto_demo/controllers/api_service_controller.dart';
import 'package:cryppto_demo/main.dart';
import 'package:cryppto_demo/models/coin_model.dart';
import 'package:cryppto_demo/utils/widgets/coin_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../utils/widgets/app_elevated_button.dart';
import '../utils/widgets/page_title.dart';
import '../utils/widgets/price_card.dart';

class DetailScreen extends StatelessWidget {
  final CoinModel? coinModel;
  const DetailScreen({required this.coinModel, super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController volumeController = TextEditingController();
    ApiServiceController controller = Get.find<ApiServiceController>();
    final ValueNotifier<num> price =
        ValueNotifier<num>(coinModel!.currentPrice!);
    double? volume = 1.0;
    return Scaffold(
      backgroundColor: appColors.shadowColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const PageTitle(title: "Convert"),
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
                    price.value = volume! * coinModel!.currentPrice!;
                  },
                  title: "Submit",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
