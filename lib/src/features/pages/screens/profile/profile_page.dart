import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:safari_app/src/features/auth/screens/profileinformation/profile_information_page.dart';
import 'package:safari_app/src/features/pages/screens/profile/accountSecurity/account_security_page.dart';
import 'package:safari_app/src/features/pages/screens/profile/notification/push_notafication_page.dart';
import 'package:safari_app/src/features/pages/screens/profile/privacy&policy/privacy_policy_page.dart';
import 'package:safari_app/src/features/pages/screens/support/support_page.dart';
import 'package:safari_app/src/utils/constant/colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FA),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.09,
            vertical: height * 0.08,
          ),
          child: Column(
            children: [
              /// Scrollable content
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// ================= HEADER =================
                      Row(
                        children: [
                          CircleAvatar(
                            radius: width * 0.075,
                            backgroundImage: const NetworkImage(
                              "https://i.pravatar.cc/300",
                            ),
                          ),
                          SizedBox(width: width * 0.04),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Mohamed Hashi",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.black,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "+252 615764252",
                                style: TextStyle(
                                  color: AppColors.grey,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      SizedBox(height: height * 0.04),

                      /// ================= PERSONAL INFO =================
                      _sectionTitle(
                        "Personal Info",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfileInformationPage(),
                            ),
                          );
                        },
                      ),
                      _settingItem(
                        icon: Iconsax.user,
                        title: "Personal Data",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfileInformationPage(),
                            ),
                          );
                        },
                      ),
                      _settingItem(
                        icon: Iconsax.lock,
                        title: "Account Security",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AccountSecurityPage(),
                            ),
                          );
                        },
                      ),

                      SizedBox(height: height * 0.025),

                      /// ================= GENERAL =================
                      _sectionTitle("General"),
                      _settingItem(icon: Iconsax.global, title: "Language"),
                      _settingItem(
                        icon: Iconsax.notification,
                        title: "Push Notification",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PushNotaficationPage(),
                            ),
                          );
                        },
                      ),
                      _settingItem(
                        icon: Iconsax.trash,
                        title: "Clear Cache",
                        trailingText: "88 MB",
                      ),

                      SizedBox(height: height * 0.025),

                      /// ================= ABOUT =================
                      _sectionTitle("About"),
                      _settingItem(
                        icon: Iconsax.message_question,
                        title: "Support Center",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SupportPage(),
                            ),
                          );
                        },
                      ),
                      _settingItem(
                        icon: Iconsax.shield_tick,
                        title: "Privacy & Policy",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PrivacyPolicyPage(),
                            ),
                          );
                        },
                      ),
                      _settingItem(
                        icon: Iconsax.info_circle,
                        title: "About App",
                      ),

                      SizedBox(height: height * 0.02),
                    ],
                  ),
                ),
              ),

              /// ================= LOGOUT =================
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: height * 0.018),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppColors.secondaryColor),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Iconsax.logout, color: AppColors.secondaryColor),
                    SizedBox(width: 10),
                    Text(
                      "Logout",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.02),
            ],
          ),
        ),
      ),
    );
  }

  /// ================= SECTION TITLE =================
  Widget _sectionTitle(String title, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Text(
          title,
          style: const TextStyle(
            color: AppColors.grey,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  /// ================= SETTING ITEM =================
  Widget _settingItem({
    required IconData icon,
    required String title,
    String? trailingText,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, color: AppColors.grey, size: 22),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
            ),
            if (trailingText != null)
              Text(
                trailingText,
                style: const TextStyle(color: AppColors.grey, fontSize: 13),
              ),
            const SizedBox(width: 6),
            const Icon(
              Icons.arrow_forward_ios,
              size: 14,
              color: AppColors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
