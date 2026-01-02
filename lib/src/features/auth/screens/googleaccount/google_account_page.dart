import 'package:flutter/material.dart';
import 'package:safari_app/src/features/auth/screens/otp/otp_page.dart';
import 'package:safari_app/src/features/auth/screens/signin/signin_page.dart';
import 'package:safari_app/src/shared/app_button.dart';
import 'package:safari_app/src/shared/custom_social_button.dart';
import 'package:safari_app/src/utils/constant/colors.dart';
import 'package:safari_app/src/utils/constant/images.dart';

class GoogleAccountPage extends StatefulWidget {
  const GoogleAccountPage({super.key});

  @override
  State<GoogleAccountPage> createState() => _GoogleAccountPageState();
}

class _GoogleAccountPageState extends State<GoogleAccountPage> {
  final TextEditingController phoneController = TextEditingController();

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
              horizontal: width * 0.09,
              vertical: height * 0.06,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.02),

                /// Title
                const Text(
                  "Join Us Today!",
                  style: TextStyle(
                    color: AppColors.black, // ✅ Use AppColors
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    height: 1.5,
                  ),
                ),

                const SizedBox(height: 6),

                const Text(
                  "Create Account in a Few Simple Steps and Unlock Access to Exclusive Features.",
                  style: TextStyle(
                    color: AppColors.grey, // ✅ Use AppColors
                    fontSize: 16,
                    height: 1.5,
                  ),
                ),

                SizedBox(height: height * 0.04),

                /// Phone label
                const Text(
                  "Phone Number",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black, // ✅ Use AppColors
                  ),
                ),

                SizedBox(height: height * 0.01),

                /// Phone input
                Container(
                  width: double.infinity,
                  height: height * 0.061,
                  padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.grey.withOpacity(0.3)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const Text(
                        "🇸🇴 +252",
                        style: TextStyle(color: AppColors.grey, fontSize: 16),
                      ),
                      Container(
                        height: 24,
                        width: 1,
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        color: AppColors.grey.withOpacity(0.3),
                      ),
                      Expanded(
                        child: TextField(
                          controller: phoneController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            hintText: "Enter your number",
                            hintStyle: TextStyle(color: AppColors.grey),
                            border: InputBorder.none,
                            isDense: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: height * 0.03),

                /// Send Code Button
                SizedBox(
                  width: double.infinity,
                  height: height * 0.061,
                  child: AppButton(
                    text: "Send Code",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const OtpPage()),
                      );
                    },
                  ),
                ),

                SizedBox(height: height * 0.04),

                /// Divider
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        color: AppColors.grey.withOpacity(0.3),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "Or continue with",
                        style: TextStyle(color: AppColors.grey),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 1,
                        color: AppColors.grey.withOpacity(0.3),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: height * 0.03),

                /// Social buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomSocialButton(
                      size: width * 0.13,
                      iconWidget: Image.asset(
                        AppImages.googleLogo,
                        width: width * 0.06,
                      ),
                      onPressed: () {},
                    ),
                    SizedBox(width: width * 0.05),
                    CustomSocialButton(
                      size: width * 0.13,
                      iconWidget: Image.asset(
                        AppImages.appleLogo,
                        width: width * 0.06,
                        fit: BoxFit.contain,
                      ),
                      onPressed: () {},
                    ),
                    SizedBox(width: width * 0.05),
                    CustomSocialButton(
                      size: width * 0.13,
                      iconWidget: Image.asset(
                        AppImages.facebookLogo,
                        width: width * 0.06,
                        fit: BoxFit.contain,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),

                SizedBox(height: height * 0.03),

                /// Bottom text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account? ",
                      style: TextStyle(color: AppColors.grey),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignInPage(),
                          ),
                        );
                      },
                      child: const Text(
                        "Sign In",
                        style: TextStyle(
                          color: AppColors.primaryColor, // ✅ Use AppColors
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
