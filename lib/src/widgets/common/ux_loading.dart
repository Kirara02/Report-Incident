import 'package:flutter/material.dart';
import 'package:report_incident/src/config/constant.dart';
import 'package:lottie/lottie.dart';

class UXLoading extends StatelessWidget {
  const UXLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            LottieBuilder.asset(
              "assets/lottie/liquid-loading.json",
              width: 140,
              height: 140,
            ),
            const Text(
              'Mohon Tunggu',
              style: TextStyle(
                  fontSize: AppConstants.kFontSizeL,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 8.0,
            ),
            const Text(
              'Sedang menyiapkan data...',
              style: TextStyle(
                  fontSize: AppConstants.kFontSizeM,
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}
