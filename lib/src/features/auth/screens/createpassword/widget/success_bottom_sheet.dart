import 'package:flutter/material.dart';
import 'package:safari_app/src/app_navigator.dart';
import 'package:safari_app/src/shared/app_button.dart';
import 'package:safari_app/src/utils/constant/images.dart';
import 'package:safari_app/src/utils/constant/colors.dart';

class SuccessBottomSheet {
  static void show(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) {
        return Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: width * 0.1),
            padding: EdgeInsets.all(width * 0.05),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// Icon Container
                Container(
                  height: height * 0.11,
                  width: height * 0.11,
                  decoration: BoxDecoration(
                    color: AppColors.orange.withOpacity(0.12),
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.orange, width: 1),
                  ),
                  child: Center(
                    child: Image.asset(
                      AppImages.verifyImage,
                      height: height * 0.07,
                      width: height * 0.07,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                SizedBox(height: height * 0.035),

                /// Title
                const Text(
                  "Registration Successfully",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: height * 0.015),

                /// Subtitle
                const Text(
                  "Thank you for signing up. We're excited to have you with us. "
                  "You can now login and start exploring all the features we have to offer.",
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColors.grey,
                    height: 1.4,
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: height * 0.04),

                /// Button
                SizedBox(
                  width: double.infinity,
                  height: height * 0.06,
                  child: AppButton(
                    text: "Welcome!",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AppNavigator(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
