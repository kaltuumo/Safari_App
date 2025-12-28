// file: google_account_page.dart
import 'package:flutter/material.dart';
import 'package:safari_app/features/auth/screens/otp/otp_page.dart';
import 'package:safari_app/shared/app_button.dart';
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
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.only(left: 30), // padding dhinaca bidix
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // qoraalka dhinaca bidix
                    children: const [
                      Text(
                        "Join Us Today!",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          height: 1.5, // line spacing
                        ),
                      ),
                      SizedBox(height: 5), // spacing u dhexeeya labada Text
                      Text(
                        "Create Account in a Few Simple Steps and Unlock Access to Exclusive Features.",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          height: 1.5, // line spacing
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                // Custom Styled TextField Container
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 1,
                  ),
                  child: Row(
                    children: [
                      const Text("🇸🇴 +252", style: TextStyle(fontSize: 16)),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          controller: phoneController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            hintText: "Enter your number",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                AppButton(
                  text: "Send Code",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const OtpPage()),
                    );
                  },
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: Divider(color: Colors.grey[300], thickness: 1),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "Or Continue With",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ),
                    Expanded(
                      child: Divider(color: Colors.grey[300], thickness: 1),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                // Social Buttons Row (icon-only)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialButton(
                      iconWidget: Image.asset(
                        AppImages.googleLogo,
                        width: 24,
                        height: 24,
                      ),
                      onPressed: () {},
                    ),
                    SizedBox(width: 20),
                    SocialButton(
                      iconWidget: Image.asset(
                        AppImages.appleLogo,
                        width: 30,
                        height: 30,
                      ),
                      onPressed: () {},
                    ),
                    SizedBox(width: 20),

                    SocialButton(
                      iconWidget: Image.asset(
                        AppImages.facebookLogo,
                        width: 24,
                        height: 24,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account? ",
                      style: TextStyle(color: Colors.grey),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigate to Sign In page
                      },
                      child: const Text(
                        "Sign In",
                        style: TextStyle(
                          color: const Color(0xFFC3161C),
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

/// Custom Social Button (icon-only, rounded)
class SocialButton extends StatelessWidget {
  final Widget iconWidget;
  final VoidCallback onPressed;

  const SocialButton({
    super.key,
    required this.iconWidget,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50, // square button
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          side: const BorderSide(color: Colors.grey),
          backgroundColor: Colors.white,
          padding: EdgeInsets.zero,
        ),
        child: iconWidget,
      ),
    );
  }
}
