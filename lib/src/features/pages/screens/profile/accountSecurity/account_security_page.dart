import 'package:flutter/material.dart';
import 'package:safari_app/src/features/auth/screens/resetpassword/reset_password_page.dart';
import 'package:safari_app/src/shared/app_button.dart';
import 'package:safari_app/src/utils/constant/colors.dart';

class AccountSecurityPage extends StatefulWidget {
  const AccountSecurityPage({super.key});

  @override
  State<AccountSecurityPage> createState() => _AccountSecurityPageState();
}

class _AccountSecurityPageState extends State<AccountSecurityPage> {
  bool twoFactor = false;
  bool biometric = false;
  bool emailAlert = true;
  bool rememberPassword = true;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FA),

      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.05,
          vertical: width * 0.1,
        ),
        child: Column(
          children: [
            const SizedBox(height: 16),
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
                  "Account Security",
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            /// 🔐 ONE CONTAINER WITH DIVIDERS
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                children: [
                  _securityRow(
                    title: "Remember Password",
                    value: rememberPassword,
                    onChanged: (v) => setState(() => rememberPassword = v),
                  ),
                  _divider(),
                  _securityRow(
                    title: "Face ID",
                    value: twoFactor,
                    onChanged: (v) => setState(() => twoFactor = v),
                  ),
                  _divider(),

                  _securityRow(
                    title: "Biometric ID",
                    value: biometric,
                    onChanged: (v) => setState(() => biometric = v),
                  ),
                  _divider(),

                  _securityRow(
                    title: "Email Security Alerts",
                    value: emailAlert,
                    onChanged: (v) => setState(() => emailAlert = v),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            AppButton(
              text: "Change Password",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ResetPasswordPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  /// ================= SINGLE ROW =================
  Widget _securityRow({
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 18, color: AppColors.black),
            ),
          ),

          /// 🔘 Smaller Switch
          Transform.scale(
            scale: 0.85,
            child: Switch(
              value: value,
              onChanged: onChanged,
              activeColor: AppColors.secondaryColor,
              inactiveTrackColor: Colors.grey.shade300,
              inactiveThumbColor: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  /// ================= DIVIDER =================
  Widget _divider() {
    return const Divider(
      height: 1,
      thickness: 1,
      indent: 14,
      endIndent: 14,
      color: Color(0xFFE5E7EB),
    );
  }
}
