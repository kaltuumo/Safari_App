import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:safari_app/src/features/pages/screens/support/widget/support_option_widget.dart';
import 'package:safari_app/src/utils/constant/colors.dart';

class SupportPage extends StatefulWidget {
  const SupportPage({super.key});

  @override
  State<SupportPage> createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  bool isParcel = true;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FA),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.05,
            vertical: width * 0.1,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
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
                    SizedBox(width: width * 0.1),
                    Text(
                      "Support Center",
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18),

                // Parcel / Letter toggle
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      _supportButton('Parcel', true),
                      const SizedBox(width: 10),
                      _supportButton('Letter', false),
                    ],
                  ),
                ),

                SizedBox(height: height * 0.025),

                // Support Option Widgets with primary color
                SupportOptionWidget(
                  icon: Icons.headset_mic,
                  title: "Contact Support",
                  iconColor: AppColors.primaryColor,
                  onTap: () {
                    print("Support tapped");
                  },
                ),

                SupportOptionWidget(
                  icon: Icons.help_outline,
                  title: "FAQ",
                  iconColor: AppColors.primaryColor,
                  onTap: () {},
                ),

                SupportOptionWidget(
                  icon: FontAwesomeIcons.whatsapp,
                  title: "WhatsApp",
                  iconColor: AppColors.primaryColor,
                  onTap: () => print("WhatsApp tapped"),
                ),

                SupportOptionWidget(
                  icon: FontAwesomeIcons.facebookF,
                  title: "Facebook",
                  iconColor: AppColors.primaryColor,
                  onTap: () => print("Facebook tapped"),
                ),

                SupportOptionWidget(
                  icon: FontAwesomeIcons.twitter,
                  title: "Twitter",
                  iconColor: AppColors.primaryColor,
                  onTap: () => print("Twitter tapped"),
                ),

                SupportOptionWidget(
                  icon: FontAwesomeIcons.instagram,
                  title: "Instagram",
                  iconColor: AppColors.primaryColor,
                  onTap: () => print("Instagram tapped"),
                ),

                SupportOptionWidget(
                  icon: Icons.web,
                  title: "Website",
                  iconColor: AppColors.primaryColor,
                  onTap: () => print("Website tapped"),
                ),

                SizedBox(height: height * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Parcel / Letter button
  Widget _supportButton(String text, bool type) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isParcel = type;
          });
        },
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: (isParcel == type) ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
