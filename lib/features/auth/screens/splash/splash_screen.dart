import 'package:flutter/material.dart';
import 'package:safari_app/features/auth/screens/googleaccount/google_account_page.dart';
import 'package:safari_app/features/auth/screens/signin/signin_page.dart';
import 'package:safari_app/shared/app_button.dart';
import 'package:safari_app/utils/constant/images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ✅ MediaQuery width & height
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.04),

                /// Title
                const Text(
                  "Get Started",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 8),

                /// Subtitle
                const Text(
                  "Sign up using your email address or quickly log in with your social media account for a seamless experience.",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),

                SizedBox(height: height * 0.01),

                Center(
                  child: Image.asset(
                    AppImages.splash,
                    height: height * 0.32,
                    width: width * 0.8,
                    fit: BoxFit.contain,
                  ),
                ),

                SizedBox(height: height * 0.04),

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
                    width: width,
                    height: height * 0.063,
                    margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.red, width: 1),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      "Create Account",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: height * 0.015),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                  ), // margin dhinacyada
                  child: Container(
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
                ),

                SizedBox(height: height * 0.025),

                /// Divider
                SizedBox(
                  width: width,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Colors.grey.withOpacity(0.3),
                          margin: EdgeInsets.only(left: width * 0.05, right: 6),
                        ),
                      ),
                      const Text(
                        "Or continue with",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Colors.grey.withOpacity(0.3),
                          margin: EdgeInsets.only(left: 6, right: width * 0.05),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: height * 0.025),

                /// Apple Sign In
                socialButton(
                  context,
                  imageAsset: AppImages.appleLogo,
                  text: "Sign in with Google",
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Social Button Widget (pure Container-based, responsive)
  Widget socialButton(
    BuildContext context, {
    required String text,
    required String imageAsset, // icon path
    VoidCallback? onPressed,
  }) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onPressed ?? () {},
      child: Container(
        // Left & right margin
        margin: EdgeInsets.symmetric(horizontal: width * 0.05),
        width: double.infinity, // Buuxi width-ka available
        height: height * 0.055,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.withOpacity(0.3)),
        ),
        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imageAsset, width: width * 0.05, height: width * 0.05),
            SizedBox(width: width * 0.025),
            Text(
              text,
              style: const TextStyle(
                color: Colors.black,
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
