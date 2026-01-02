import 'package:flutter/material.dart';
import 'package:safari_app/src/features/auth/screens/googleaccount/google_account_page.dart';
import 'package:safari_app/src/features/auth/screens/signin/signin_page.dart';
import 'package:safari_app/src/shared/app_button.dart';
import 'package:safari_app/src/utils/constant/images.dart';
import 'package:safari_app/src/utils/constant/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FA),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.08),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.04),

                /// Title
                Text(
                  "Get Started",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(height: 8),

                /// Subtitle
                Text(
                  "Sign up using your email address or quickly log in with your social media account for a seamless experience.",
                  style: TextStyle(fontSize: 14, color: AppColors.grey),
                ),
                SizedBox(height: height * 0.01),

                /// Center Image
                Center(
                  child: Image.asset(
                    AppImages.splash,
                    height: height * 0.32,
                    width: width * 0.8,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: height * 0.04),

                /// Create Account Button
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GoogleAccountPage(),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                    width: double.infinity,
                    height: height * 0.057,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: AppColors.primaryColor,
                        width: 1,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Create Account",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height * 0.015),

                /// Sign In Button
                Container(
                  margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                  width: double.infinity,
                  height: height * 0.055,
                  child: AppButton(
                    text: "Sign in",
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
                SizedBox(height: height * 0.025),

                /// Divider
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        color: AppColors.grey.withOpacity(0.3),
                        margin: EdgeInsets.only(left: width * 0.05, right: 6),
                      ),
                    ),
                    Text(
                      "Or continue with",
                      style: TextStyle(color: AppColors.grey),
                    ),
                    Expanded(
                      child: Container(
                        height: 1,
                        color: AppColors.grey.withOpacity(0.3),
                        margin: EdgeInsets.only(left: 6, right: width * 0.05),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.025),

                /// Social Buttons
                socialButton(
                  context,
                  imageAsset: AppImages.appleLogo,
                  text: "Sign in with Apple",
                ),
                SizedBox(height: height * 0.015),
                socialButton(
                  context,
                  imageAsset: AppImages.googleLogo,
                  text: "Sign in with Google",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const SignInPage()),
                    );
                  },
                ),
                SizedBox(height: height * 0.03),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Social Button Widget
  Widget socialButton(
    BuildContext context, {
    required String text,
    required String imageAsset,
    VoidCallback? onPressed,
  }) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onPressed ?? () {},
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: width * 0.05),
        width: double.infinity,
        height: height * 0.055,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.grey.withOpacity(0.3)),
        ),
        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imageAsset, width: width * 0.05, height: width * 0.05),
            SizedBox(width: width * 0.025),
            Text(
              text,
              style: TextStyle(
                color: AppColors.black,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
