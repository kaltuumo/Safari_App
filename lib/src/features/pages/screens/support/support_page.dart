import 'package:flutter/material.dart';
import 'package:safari_app/src/features/pages/screens/support/widget/support_option_widget.dart';
import 'package:safari_app/src/utils/constant/colors.dart';
import 'package:safari_app/src/utils/constant/images.dart';

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
                // Row with gray background
                Container(
                  padding: const EdgeInsets.all(4), // inner padding
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200, // ✅ gray background
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

                SizedBox(height: height * 0.025), // ✅ Yaraynta space
                // Support Option Containers
                SupportOptionWidget(
                  imagePath: AppImages.facebookLogo,
                  imageColor: AppColors.primaryColor, // midabka sawirka
                  // path ka sawirkaaga
                  title: 'Facebook',
                  onTap: () {
                    print('Parcel tapped');
                  },
                ),

                // SupportOptionWidget(
                //   icon: Iconsax.sms,
                //   title: "Whatsapp",
                //   onTap: () => print("Whatsapp tapped"),
                // ),
                // SupportOptionWidget(
                //   icon: Icons.help_outline,
                //   title: "FAQ",
                //   onTap: () => print("FAQ tapped"),
                // ),
                // SupportOptionWidget(
                //   icon: Icons.web_stories,
                //   title: "Website",
                //   onTap: () => print("Website tapped"),
                // ),
                // SupportOptionWidget(
                //   icon: Icons.facebook,
                //   title: "Facebook",
                //   onTap: () => print("Facebook tapped"),
                // ),
                // SupportOptionWidget(
                //   icon: Icons.face,
                //   title: "Twitter",
                //   onTap: () => print("Twitter tapped"),
                // ),
                // SupportOptionWidget(
                //   icon: Icons.camera_alt_outlined,
                //   title: "Instagram",
                //   onTap: () => print("Instagram tapped"),
                // ),
                SizedBox(height: height * 0.02), // ✅ Space hooska ugu yar
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Shipment Type Button
  Widget _supportButton(String text, bool type) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isParcel = type; // update selected type
          });
        },
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: (isParcel == type) ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 8),
              Text(
                text,
                style: TextStyle(
                  color: (isParcel == type)
                      ? Colors.black
                      : Colors
                            .black, // ✅ white text if selected, black otherwise
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
