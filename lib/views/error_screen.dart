import 'package:cryppto_demo/main.dart';
import 'package:cryppto_demo/utils/widgets/app_elevated_button.dart';
import 'package:cryppto_demo/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CustomErrorScreen extends StatelessWidget {
  // final FlutterErrorDetails errorDetails;

  const CustomErrorScreen({
    Key? key,
    // required this.errorDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(20.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('assets/error.png'),
            Text(
              'Oups!',
              textAlign: TextAlign.center,
              style: appFontStyles.titleStyle.copyWith(
                color: Colors.red,
                fontSize: 25.sp,
              ),
            ),
            SizedBox(height: 2.h),
            Text(
              'Oups! Something went wrong!',
              textAlign: TextAlign.center,
              style: appFontStyles.titleStyle.copyWith(
                color: Colors.red,
                fontSize: 18.sp,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              "We encountered an error and we've notified our engineering team about it. Sorry for the inconvenience caused.",
              textAlign: TextAlign.center,
              style: appFontStyles.bodyStyle.copyWith(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4.h),
            AppElevatedButton(
              onPressed: () {
                Get.to(() => const MainScreen());
              },
              title: "Go Home",
            )
          ],
        ),
      ),
    );
  }
}
