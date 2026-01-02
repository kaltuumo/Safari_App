import 'package:flutter/material.dart';
import 'package:safari_app/src/features/auth/screens/signin/signin_page.dart';
import 'package:safari_app/src/shared/app_button.dart';
import 'package:safari_app/src/utils/constant/images.dart';
import 'package:safari_app/src/utils/constant/colors.dart';

class ResetPasswordChanged extends StatefulWidget {
  const ResetPasswordChanged({super.key});

  @override
  State<ResetPasswordChanged> createState() => _ResetPasswordChanged();
}

class _ResetPasswordChanged extends State<ResetPasswordChanged> {
  bool isPasswordHidden = true; // ✅ Move to state

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FA),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.05,
              vertical: height * 0.29,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Center Image
                Center(
                  child: Image.asset(
                    AppImages.passwordIcon,
                    height: height * 0.1,
                    fit: BoxFit.contain,
                  ),
                ),

                SizedBox(height: height * 0.03),

                /// Title
                Center(
                  child: Text(
                    "Password Changed",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black, // ✅ Use AppColors
                    ),
                  ),
                ),

                SizedBox(height: height * 0.03),

                /// Description
                Text(
                  "Your password has been changed successfully",
                  style: TextStyle(
                    fontSize: width * 0.04,
                    color: AppColors.grey, // ✅ Use AppColors
                    height: 1.3,
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: height * 0.03),

                /// Back to login Button
                SizedBox(
                  width: double.infinity,
                  height: height * 0.063,
                  child: AppButton(
                    text: "Back to Login",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignInPage(),
                        ),
                      );
                    },
                  ),
                ),

                SizedBox(height: height * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Optional success bottom sheet
  void showSuccessBottomSheet(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: width * 0.1),
            padding: EdgeInsets.all(width * 0.05),
            decoration: BoxDecoration(
              color: AppColors.white, // ✅ Use AppColors
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Icon Circle
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
                Text(
                  "Registration Successful",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor, // ✅ Use AppColors
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: height * 0.015),

                /// Subtitle
                Text(
                  "Thank you for signing up. We're excited to have you with us. "
                  "You can now login and start exploring all the features we have to offer.",
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColors.grey, // ✅ Use AppColors
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
                      Navigator.pop(context);
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
