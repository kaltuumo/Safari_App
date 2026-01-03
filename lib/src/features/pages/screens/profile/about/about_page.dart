import 'package:flutter/material.dart';
import 'package:safari_app/src/features/pages/screens/profile/about/widget/about_item.dart';
import 'package:safari_app/src/utils/constant/colors.dart';
import 'package:safari_app/src/utils/constant/images.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.05,
          vertical: width * 0.1,
        ),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  borderRadius: BorderRadius.circular(999),
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(999),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x12000000),
                          blurRadius: 14,
                          offset: Offset(0, 8),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 18,
                      color: Color(0xFF111827),
                    ),
                  ),
                ),
                SizedBox(width: width * 0.25),
                Text(
                  "About Us",
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),

            /// LOGO
            Center(
              child: Column(
                children: [
                  Image.asset(
                    AppImages.logo,
                    width: width * 0.4,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Sendir v1.53.0",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            /// MENU LIST
            Expanded(
              child: ListView(
                children: const [
                  AboutItem(title: "Developer"),
                  AboutItem(title: "Partner"),
                  AboutItem(title: "Accessibility"),
                  AboutItem(title: "Terms of Use"),
                  AboutItem(title: "Feedback"),
                  AboutItem(title: "Rate us"),
                  AboutItem(title: "Visit Our Website"),
                  AboutItem(title: "Follow us On Social Media"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
