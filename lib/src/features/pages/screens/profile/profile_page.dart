import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

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
            horizontal: width * 0.05,
            vertical: height * 0.02,
          ),
          child: Column(
            children: [
              // Scrollable content
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
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "+252 615764252",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      SizedBox(height: height * 0.04),

                      /// ================= PERSONAL INFO =================
                      _sectionTitle("Personal Info"),
                      _settingItem(icon: Iconsax.user, title: "Personal Data"),
                      _settingItem(
                        icon: Iconsax.lock,
                        title: "Account Security",
                      ),

                      SizedBox(height: height * 0.025),

                      /// ================= GENERAL =================
                      _sectionTitle("General"),
                      _settingItem(icon: Iconsax.global, title: "Language"),
                      _settingItem(
                        icon: Iconsax.notification,
                        title: "Push Notification",
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
                      ),
                      _settingItem(
                        icon: Iconsax.shield_tick,
                        title: "Privacy & Policy",
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
                  border: Border.all(color: Colors.orange),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Iconsax.logout, color: Colors.orange),
                    SizedBox(width: 10),
                    Text(
                      "Logout",
                      style: TextStyle(
                        color: Colors.orange,
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
  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 13,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  /// ================= SETTING ITEM =================
  Widget _settingItem({
    required IconData icon,
    required String title,
    String? trailingText,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ),
          if (trailingText != null)
            Text(
              trailingText,
              style: const TextStyle(color: Colors.grey, fontSize: 13),
            ),
          const SizedBox(width: 6),
          const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
        ],
      ),
    );
  }
}
