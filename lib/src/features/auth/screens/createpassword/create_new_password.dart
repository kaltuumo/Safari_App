import 'package:flutter/material.dart';
import 'package:safari_app/src/features/auth/screens/createpassword/widget/success_bottom_sheet.dart';
import 'package:safari_app/src/shared/app_button.dart';
import 'package:safari_app/src/utils/constant/images.dart';
import 'package:safari_app/src/utils/constant/colors.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
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
                const Text(
                  "Create New Password",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),

                const SizedBox(height: 4),

                /// Description
                const Text(
                  "Choose a strong new password for your account. Make sure it's unique and different from your previous passwords to keep your account secure.",
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.grey,
                    height: 1.3,
                  ),
                ),

                SizedBox(height: height * 0.03),

                /// Password Field
                const Text(
                  "Password",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                ),
                SizedBox(height: height * 0.008),
                TextField(
                  obscureText: isPasswordHidden,
                  decoration: InputDecoration(
                    hintText: "Enter your password",
                    filled: true,
                    fillColor: AppColors.white,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: width * 0.04,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: AppColors.grey.withOpacity(0.3),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: AppColors.grey.withOpacity(0.3),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: AppColors.orange),
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          isPasswordHidden = !isPasswordHidden;
                        });
                      },
                      child: Icon(
                        isPasswordHidden
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: AppColors.grey,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: height * 0.02),

                /// Confirm Password Field
                const Text(
                  "Confirm Password",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                ),
                SizedBox(height: height * 0.008),
                TextField(
                  obscureText: isPasswordHidden,
                  decoration: InputDecoration(
                    hintText: "Enter your password",
                    filled: true,
                    fillColor: AppColors.white,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: width * 0.04,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: AppColors.grey.withOpacity(0.3),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: AppColors.grey.withOpacity(0.3),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: AppColors.orange),
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          isPasswordHidden = !isPasswordHidden;
                        });
                      },
                      child: Icon(
                        isPasswordHidden
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: AppColors.grey,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: height * 0.03),

                /// Submit Button
                SizedBox(
                  width: double.infinity,
                  height: height * 0.061,
                  child: AppButton(
                    text: "Submit",
                    onPressed: () {
                      SuccessBottomSheet.show(context);
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
}
