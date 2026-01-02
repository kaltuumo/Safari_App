import 'package:flutter/material.dart';
import 'package:safari_app/src/features/auth/screens/forgetpassword/forget_passwors_verify.dart';
import 'package:safari_app/src/features/auth/screens/googleaccount/google_account_page.dart';
import 'package:safari_app/src/shared/app_button.dart';
import 'package:safari_app/src/shared/custom_social_button.dart';
import 'package:safari_app/src/utils/constant/images.dart';
import 'package:safari_app/src/utils/constant/colors.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPage();
}

class _ForgetPasswordPage extends State<ForgetPasswordPage> {
  bool isPhoneSelected = false; // <-- Email default
  bool isPasswordHidden = true;

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    phoneController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    const selectedColor = AppColors.primaryColor;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FA),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.08,
            vertical: height * 0.15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Forget Password",
                style: TextStyle(
                  fontSize: width * 0.07,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                isPhoneSelected
                    ? "Don't worry! Please enter your phone number associated with your account"
                    : "Don't worry! Please enter the email address associated with your account",
                style: const TextStyle(
                  color: AppColors.grey,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),

              SizedBox(height: height * 0.03),

              /// Toggle Phone / Email
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isPhoneSelected = true;
                        });
                      },
                      child: Column(
                        children: [
                          Container(
                            height: height * 0.06,
                            alignment: Alignment.center,
                            child: Text(
                              "Phone Number",
                              style: TextStyle(
                                color: isPhoneSelected
                                    ? selectedColor
                                    : AppColors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            height: 2,
                            color: isPhoneSelected
                                ? selectedColor
                                : Colors.transparent,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: width * 0.05),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isPhoneSelected = false;
                        });
                      },
                      child: Column(
                        children: [
                          Container(
                            height: height * 0.06,
                            alignment: Alignment.center,
                            child: Text(
                              "Email",
                              style: TextStyle(
                                color: !isPhoneSelected
                                    ? selectedColor
                                    : AppColors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            height: 2,
                            color: !isPhoneSelected
                                ? selectedColor
                                : Colors.transparent,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: height * 0.03),

              /// Input Fields
              if (isPhoneSelected) ...[
                Text(
                  "Phone Number",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: height * 0.012),
                  width: double.infinity,
                  height: height * 0.061,
                  padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border.all(color: AppColors.grey.withOpacity(0.2)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const Text("🇸🇴 +252", style: TextStyle(fontSize: 16)),
                      Container(
                        height: 24,
                        width: 1,
                        color: AppColors.grey.withOpacity(0.3),
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                      ),
                      Expanded(
                        child: TextField(
                          controller: phoneController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            hintText: "Enter your phone number",
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ] else ...[
                Text(
                  "Email",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: height * 0.012),
                  width: double.infinity,
                  height: height * 0.061,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border.all(color: AppColors.grey.withOpacity(0.3)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: width * 0.045),
                      const Expanded(
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: "Haqabtire@gmail.com",
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],

              SizedBox(height: height * 0.03),

              Container(
                margin: EdgeInsets.symmetric(horizontal: width * 0.01),
                width: double.infinity,
                height: height * 0.066,
                child: AppButton(
                  text: "Send Code",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ForgetPassworsVerify(
                          isPhoneSelected: isPhoneSelected,
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: height * 0.03),

              /// Divider
              SizedBox(
                width: width,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        color: AppColors.grey.withOpacity(0.3),
                        margin: EdgeInsets.only(left: width * 0.05, right: 6),
                      ),
                    ),
                    const Text(
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
                      height: width * 0.06,
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
                    "Don't have an account?",
                    style: TextStyle(color: AppColors.grey),
                  ),
                  SizedBox(width: width * 0.01),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const GoogleAccountPage(),
                        ),
                      );
                    },
                    child: const Text(
                      "Register",
                      style: TextStyle(
                        color: AppColors.primaryColor,
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
    );
  }
}
