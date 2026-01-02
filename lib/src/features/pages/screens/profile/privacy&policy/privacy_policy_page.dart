import 'package:flutter/material.dart';
import 'package:safari_app/src/utils/constant/colors.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FA),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.05,
            vertical: width * 0.1,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context); // Dib ugu laab page-ka hore
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
                  SizedBox(width: width * 0.1),
                  Text(
                    "Privacy & Policy Center",
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                "Introduction",
                style: TextStyle(
                  fontSize: width * 0.05,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: height * 0.01),
              Text(
                "We value your privacy and are committed to protecting your personal information. This Privacy Policy explains how we collect, use, and safeguard your data.",
                style: TextStyle(
                  fontSize: width * 0.038,
                  color: AppColors.grey,
                  height: 1.5,
                ),
              ),
              SizedBox(height: height * 0.03),

              Text(
                "Information We Collect",
                style: TextStyle(
                  fontSize: width * 0.045,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: height * 0.01),
              Text(
                "• Personal information you provide (name, email, etc.)\n"
                "• Usage data (how you interact with our app)\n"
                "• Cookies and analytics data",
                style: TextStyle(
                  fontSize: width * 0.038,
                  color: AppColors.grey,
                  height: 1.5,
                ),
              ),
              SizedBox(height: height * 0.03),

              Text(
                "How We Use Information",
                style: TextStyle(
                  fontSize: width * 0.045,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: height * 0.01),
              Text(
                "We use the information we collect to:\n"
                "• Provide and improve our services\n"
                "• Personalize your experience\n"
                "• Communicate with you about updates and offers",
                style: TextStyle(
                  fontSize: width * 0.038,
                  color: AppColors.grey,
                  height: 1.5,
                ),
              ),
              SizedBox(height: height * 0.03),

              Text(
                "Security",
                style: TextStyle(
                  fontSize: width * 0.045,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: height * 0.01),
              Text(
                "We implement industry-standard measures to protect your information from unauthorized access, disclosure, or destruction.",
                style: TextStyle(
                  fontSize: width * 0.038,
                  color: AppColors.grey,
                  height: 1.5,
                ),
              ),
              SizedBox(height: height * 0.03),

              Text(
                "Changes to This Policy",
                style: TextStyle(
                  fontSize: width * 0.045,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: height * 0.01),
              Text(
                "We may update this Privacy Policy from time to time. We encourage you to review it periodically for any changes.",
                style: TextStyle(
                  fontSize: width * 0.038,
                  color: AppColors.grey,
                  height: 1.5,
                ),
              ),
              SizedBox(height: height * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}
