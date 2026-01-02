import 'package:flutter/material.dart';
import 'package:safari_app/src/app_navigator.dart';
import 'package:safari_app/src/features/auth/screens/forgetpassword/forget_password_page.dart';
import 'package:safari_app/src/features/auth/screens/googleaccount/google_account_page.dart';
import 'package:safari_app/src/shared/app_button.dart';
import 'package:safari_app/src/shared/custom_social_button.dart';
import 'package:safari_app/src/utils/constant/images.dart';
import 'package:safari_app/src/utils/constant/colors.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isPhoneSelected = true;
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

    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FA),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.08,
            vertical: height * 0.1,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome Back!",
                style: TextStyle(
                  fontSize: width * 0.07,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Login to access your account and continue where\nyou left off. Enter your credentials below to get started.",
                style: TextStyle(
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
                      onTap: () => setState(() => isPhoneSelected = true),
                      child: Column(
                        children: [
                          Container(
                            height: height * 0.06,
                            alignment: Alignment.center,
                            child: Text(
                              "Phone Number",
                              style: TextStyle(
                                color: isPhoneSelected
                                    ? AppColors.primaryColor
                                    : AppColors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            height: 2,
                            color: isPhoneSelected
                                ? AppColors.primaryColor
                                : Colors.transparent,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: width * 0.05),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => isPhoneSelected = false),
                      child: Column(
                        children: [
                          Container(
                            height: height * 0.06,
                            alignment: Alignment.center,
                            child: Text(
                              "Email",
                              style: TextStyle(
                                color: !isPhoneSelected
                                    ? AppColors.primaryColor
                                    : AppColors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            height: 2,
                            color: !isPhoneSelected
                                ? AppColors.primaryColor
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
                _buildPhoneField(width, height),
                _buildPasswordField(width, height),
              ] else ...[
                _buildEmailField(width, height),
                _buildPasswordField(width, height),
              ],

              // Forget Password Text
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ForgetPasswordPage(),
                      ),
                    );
                  },
                  child: Text(
                    "Forget Password?",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              SizedBox(height: height * 0.03),

              /// Login Button
              SizedBox(
                width: double.infinity,
                height: height * 0.065,
                child: AppButton(
                  text: "Login",
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
              SizedBox(height: height * 0.03),

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
                  Text(
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
                    child: Text(
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

  /// Phone Input Field
  Widget _buildPhoneField(double width, double height) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Phone Number",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.black,
          ),
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
              Text(
                "🇸🇴 +252",
                style: TextStyle(fontSize: 16, color: AppColors.black),
              ),
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
      ],
    );
  }

  /// Email Input Field
  Widget _buildEmailField(double width, double height) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Email",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.black,
          ),
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
            children: [
              SizedBox(width: width * 0.045),
              Expanded(
                child: TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: "example@gmail.com",
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
    );
  }

  /// Password Input Field
  Widget _buildPasswordField(double width, double height) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Password",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.black,
          ),
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
              Expanded(
                child: TextField(
                  obscureText: isPasswordHidden,
                  decoration: const InputDecoration(
                    hintText: "Enter your password",
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () =>
                    setState(() => isPasswordHidden = !isPasswordHidden),
                child: Icon(
                  isPasswordHidden ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
