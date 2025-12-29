import 'package:flutter/material.dart';
import 'package:safari_app/features/auth/screens/otp/otp_page.dart';
import 'package:safari_app/shared/app_button.dart';
import 'package:safari_app/shared/custom_social_button.dart';
import 'package:safari_app/utils/constant/images.dart';

class GoogleAccountPage extends StatefulWidget {
  const GoogleAccountPage({super.key});

  @override
  State<GoogleAccountPage> createState() => _GoogleAccountPageState();
}

class _GoogleAccountPageState extends State<GoogleAccountPage> {
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // ✅ MediaQuery
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.03,
            vertical: height * 0.06,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.025),

                Padding(
                  padding: EdgeInsets.only(left: width * 0.06),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Join Us Today!",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          height: 1.5,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Create Account in a Few Simple Steps and Unlock Access to Exclusive Features.",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: height * 0.04),

                // Phone Number Input
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.05,
                  ), // same as button

                  child: const Text(
                    "Phone Number",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: height * 0.01),

                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: width * 0.05,
                  ), // same as button
                  width: double.infinity,
                  height: height * 0.061,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.withOpacity(0.3)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "🇸🇴 +252",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      // Divider
                      Container(
                        height: 24,
                        width: 1,
                        color: Colors.grey.withOpacity(0.3),
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                      ),
                      // SizedBox(width: width * 0.025),
                      Expanded(
                        child: TextField(
                          controller: phoneController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            hintText: "Enter your number",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: height * 0.03),

                // Send Code Button
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: width * 0.05,
                  ), // same as phone input
                  width: double.infinity,
                  height: height * 0.061,
                  child: AppButton(
                    text: "Send Code",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OtpPage(),
                        ),
                      );
                    },
                  ),
                ),

                SizedBox(height: height * 0.04),

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
                        height: width * 0.06,
                      ),
                      onPressed: () {},
                    ),
                    SizedBox(width: width * 0.05),
                    CustomSocialButton(
                      size: width * 0.13,
                      iconWidget: Image.asset(
                        AppImages.appleLogo,
                        width: width * 0.06,
                        height: width * 0.06,
                        fit: BoxFit.contain, // 👈 Important
                      ),
                      onPressed: () {},
                    ),
                    SizedBox(width: width * 0.05),
                    CustomSocialButton(
                      size: width * 0.13,
                      iconWidget: Image.asset(
                        AppImages.facebookLogo,
                        width: width * 0.06,
                        height: width * 0.06,
                        fit: BoxFit.contain, // 👈 Important
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
                      style: TextStyle(color: Colors.grey),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        "Sign In",
                        style: TextStyle(
                          color: Color(0xFFC3161C),
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
