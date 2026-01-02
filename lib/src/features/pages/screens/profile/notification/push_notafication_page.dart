import 'package:flutter/material.dart';
import 'package:safari_app/src/utils/constant/colors.dart';

class PushNotaficationPage extends StatefulWidget {
  const PushNotaficationPage({super.key});

  @override
  State<PushNotaficationPage> createState() => _PushNotaficationPageState();
}

class _PushNotaficationPageState extends State<PushNotaficationPage> {
  bool Notification = false;
  bool Sound = false;
  bool Vibrate = true;
  bool specialOffers = true;
  bool payment = true;
  bool cashBack = true;
  bool appUpdates = true;

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
                  "Push Notification",
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
                    title: "Notifications",
                    value: Notification,
                    onChanged: (v) => setState(() => Notification = v),
                  ),
                  _divider(),
                  _securityRow(
                    title: "Sound",
                    value: Sound,
                    onChanged: (v) => setState(() => Sound = v),
                  ),
                  _divider(),

                  _securityRow(
                    title: "Vibrate",
                    value: Vibrate,
                    onChanged: (v) => setState(() => Vibrate = v),
                  ),
                  _divider(),

                  _securityRow(
                    title: "Special Offers",
                    value: specialOffers,
                    onChanged: (v) => setState(() => specialOffers = v),
                  ),
                  _divider(),
                  _securityRow(
                    title: "Payment",
                    value: payment,
                    onChanged: (v) => setState(() => payment = v),
                  ),
                  _divider(),
                  _securityRow(
                    title: "Cashback",
                    value: cashBack,
                    onChanged: (v) => setState(() => cashBack = v),
                  ),
                  _divider(),
                  _securityRow(
                    title: "App Updates",
                    value: Sound,
                    onChanged: (v) => setState(() => Sound = v),
                  ),
                ],
              ),
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
