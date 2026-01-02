import 'package:flutter/material.dart';
import 'package:safari_app/src/shared/app_button.dart';
import 'package:safari_app/src/utils/constant/images.dart';
import 'package:safari_app/src/utils/constant/colors.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  bool isPasswordHidden = true;
  bool isConfirmHidden = true;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FA),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.06),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.13),

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
                    "Reset Password",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.011),

                /// Description
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    "Please type something you'll remember",
                    style: TextStyle(
                      fontSize: width * 0.041,
                      color: AppColors.grey,
                      height: 1.3,
                    ),
                  ),
                ),

                SizedBox(height: height * 0.02),

                /// Password Field
                Text(
                  "New Password",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                ),
                SizedBox(height: height * 0.008),
                _buildPasswordField(
                  width,
                  controller: passwordController,
                  isConfirm: false,
                  hintText: "must be 8 characters",
                ),

                SizedBox(height: height * 0.02),

                /// Confirm Password Field
                Text(
                  "Confirm New Password",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                ),
                SizedBox(height: height * 0.008),
                _buildPasswordField(
                  width,
                  controller: confirmController,
                  isConfirm: true,
                  hintText: "repeat password",
                ),

                SizedBox(height: height * 0.03),

                /// Submit Button
                SizedBox(
                  width: double.infinity,
                  height: height * 0.061,
                  child: AppButton(
                    text: "Submit",
                    onPressed: () {
                      showSuccessBottomSheet(context);
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

  /// ================= PASSWORD FIELD =================
  Widget _buildPasswordField(
    double width, {
    TextEditingController? controller,
    bool isConfirm = false,
    required String hintText, // ✅ pass custom hint
  }) {
    return TextField(
      controller: controller,
      obscureText: isConfirm ? isConfirmHidden : isPasswordHidden,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: AppColors.grey), // ✅ use passed hint text
        filled: true,
        fillColor: AppColors.white,
        contentPadding: EdgeInsets.symmetric(
          horizontal: width * 0.04,
          vertical: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.grey.withOpacity(0.3)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.grey.withOpacity(0.3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.primaryColor),
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              if (isConfirm) {
                isConfirmHidden = !isConfirmHidden;
              } else {
                isPasswordHidden = !isPasswordHidden;
              }
            });
          },
          child: Icon(
            (isConfirm ? isConfirmHidden : isPasswordHidden)
                ? Icons.visibility_off
                : Icons.visibility,
            color: AppColors.grey,
          ),
        ),
      ),
    );
  }

  /// ================= SUCCESS BOTTOM SHEET =================
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
              color: AppColors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
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
                  "Password Reset Successfully",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: height * 0.015),

                /// Subtitle
                Text(
                  "Your password has been updated successfully. You can now login with your new password.",
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
                    text: "Continue",
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
