import 'package:flutter/material.dart';
import 'package:safari_app/features/auth/screens/googleaccount/google_account_page.dart';
import 'package:safari_app/shared/app_button.dart';
import 'package:safari_app/utils/constant/images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),

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

              const SizedBox(height: 30),

              Center(
                child: Image.asset(
                  AppImages.splash,
                  height: 260,
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GoogleAccountPage(),
                      ),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.red),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
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

              const SizedBox(height: 12),
              AppButton(
                text: "Sign in",
                onPressed: () {
                  // Navigate to Login
                },
              ),

              const SizedBox(height: 20),

              /// Divider
              Row(
                children: const [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      "Or continue with",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Expanded(child: Divider()),
                ],
              ),

              const SizedBox(height: 20),

              /// Apple Sign In
              socialButton(icon: Icons.apple, text: "Sign in with Apple"),

              const SizedBox(height: 12),

              /// Google Sign In
              socialButton(
                icon: Icons.g_mobiledata,
                text: "Sign in with Google",
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Social Button Widget
  Widget socialButton({required IconData icon, required String text}) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: OutlinedButton.icon(
        onPressed: () {},
        icon: Icon(icon, color: Colors.black),
        label: Text(text, style: const TextStyle(color: Colors.black)),
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}
