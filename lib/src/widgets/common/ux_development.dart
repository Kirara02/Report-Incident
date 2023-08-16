import 'package:flutter/material.dart';
import 'package:report_incident/src/config/constant.dart';
import 'package:report_incident/src/config/theme/colors.dart';
import 'package:lottie/lottie.dart';

class UXDevelopment extends StatelessWidget {
  final bool showButton;
  const UXDevelopment({super.key, this.showButton = true});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LottieBuilder.asset(
            "assets/lottie/under-contruction.json",
            width: 320,
            height: 320,
          ),
          const Flexible(
            child: Text(
              "Segera Hadir!",
              style: TextStyle(
                  fontSize: AppConstants.kFontSizeXL,
                  color: AppColors.biru2,
                  fontWeight: FontWeight.w700),
            ),
          ),
          const Text(
            textAlign: TextAlign.center,
            'Layanan ini sedang dalam tahap \n pengembangan, nantikan fitur ini pada\nupdate berikutnya ',
            style: TextStyle(
                fontSize: AppConstants.kFontSizeL, color: UIColors.grey_60),
          ),
          Visibility(
            visible: showButton,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  AppColors.biru2,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Kembali',
                style: TextStyle(
                    fontSize: AppConstants.kFontSizeL, color: UIColors.white),
              ),
            ),
          )
        ],
      )),
    );
  }
}
