import 'package:animations/animations.dart';
import 'package:cryppto_demo/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/api_service_controller.dart';
import '../widgets/coin_widget.dart';
import 'detail_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final controller = Get.put(ApiServiceController());
  @override
  void initState() {
    getData();
    super.initState();
  }

  Future getData() async {
    await controller.getCurrency();
    await controller.getCryptoData();
  }

  @override
  Widget build(BuildContext context) {
    final apiController = Get.put(ApiServiceController());
    return Scaffold(
      backgroundColor: appColors.shadowBlue,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "My Wallet",
                style: appFontStyles.titleStyle,
              ),
              SizedBox(height: 4.h),
              Expanded(
                child: FutureBuilder(
                  future: getData(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting ||
                        controller.coinList!.isEmpty) {
                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: apiController.coinList!.length,
                        itemBuilder: (BuildContext context, int index) {
                          final coin = apiController.coinList![index];
                          return Container(
                            margin: EdgeInsets.only(bottom: 1.5.h),
                            child: OpenContainer(
                                closedElevation: 1,
                                transitionDuration: const Duration(seconds: 1),
                                closedShape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.sp),
                                ),
                                transitionType:
                                    ContainerTransitionType.fadeThrough,
                                closedBuilder: ((context, action) {
                                  return CoinWidget(
                                    coin: coin,
                                    controler: apiController,
                                  );
                                }),
                                openBuilder: (context, action) {
                                  return DetailScreen(coinModel: coin);
                                }),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
