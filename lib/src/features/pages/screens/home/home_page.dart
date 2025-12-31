import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:safari_app/src/utils/constant/images.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FA),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.045,
            vertical: height * 0.02,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.015),

                /// Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: width * 0.085,
                          height: width * 0.085,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Icon(
                            Icons.sort_outlined,
                            color: Colors.grey.shade600,
                            size: width * 0.05,
                          ),
                        ),
                        SizedBox(width: width * 0.025),
                        Image.asset(
                          AppImages.logo,
                          width: width * 0.24,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                    Container(
                      width: width * 0.085,
                      height: width * 0.085,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Icon(
                        Iconsax.notification,
                        color: Colors.black87,
                        size: width * 0.05,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: height * 0.025),

                /// Search
                TextField(
                  decoration: InputDecoration(
                    hintText: "Track your package",
                    hintStyle: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: width * 0.038,
                    ),
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: const Icon(Icons.qr_code_scanner),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(width * 0.12),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: height * 0.018,
                    ),
                  ),
                ),

                SizedBox(height: height * 0.028),

                /// Banner
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(width * 0.055),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(width * 0.045),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.inbox,
                            color: Colors.white,
                            size: width * 0.058,
                          ),
                          SizedBox(width: width * 0.03),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Get ready",
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.9),
                                  fontSize: width * 0.037,
                                ),
                              ),
                              Text(
                                "Move on!",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: width * 0.048,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              width * 0.02,
                            ), // ⬅️ soft & modern
                          ),
                          padding: EdgeInsets.symmetric(
                            // vertical: height * 0.01,
                            horizontal: width * 0.03,
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Check Rates",
                          style: TextStyle(
                            fontSize: width * 0.036,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: height * 0.03),

                /// Actions
                Row(
                  children: [
                    _actionCard(
                      icon: Icons.local_shipping,
                      title: "New\nShipment",
                      width: width,
                      height: height,
                    ),
                    SizedBox(width: width * 0.03),
                    _actionCard(
                      icon: Icons.shopping_bag,
                      title: "Buy it\nFor me",
                      width: width,
                      height: height,
                    ),
                  ],
                ),

                SizedBox(height: height * 0.035),

                /// Recent Activities
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recent Activities",
                      style: TextStyle(
                        fontSize: width * 0.045,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      "See All",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: height * 0.02),

                _activityItem(
                  code: "1234567890AB",
                  subtitle: "Out for Delivery",
                  status: "On Process",
                  statusColor: Colors.orange,
                  width: width,
                  height: height,
                ),
                _activityItem(
                  code: "1122334455AB",
                  subtitle: "Package Delivered",
                  status: "Delivered",
                  statusColor: Colors.green,
                  width: width,
                  height: height,
                ),
                _activityItem(
                  code: "5566778899AB",
                  subtitle: "Order Cancelled",
                  status: "Cancelled",
                  statusColor: Colors.red,
                  width: width,
                  height: height,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Action Card
  Widget _actionCard({
    required IconData icon,
    required String title,
    required double width,
    required double height,
  }) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.035,
          vertical: height * 0.028,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(width * 0.045),
          border: Border.all(color: Colors.redAccent.withOpacity(0.35)),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: width * 0.055,
              backgroundColor: Colors.red.withOpacity(0.12),
              child: Icon(icon, color: Colors.red, size: width * 0.06),
            ),
            SizedBox(width: width * 0.025),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: width * 0.042,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Activity Item
  Widget _activityItem({
    required String code,
    required String subtitle,
    required String status,
    required Color statusColor,
    required double width,
    required double height,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: height * 0.015),
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.03,
        vertical: height * 0.022,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(width * 0.04),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: width * 0.055,
            backgroundColor: Colors.grey.withOpacity(0.12),
            child: Icon(
              Icons.inventory_2_outlined,
              size: width * 0.06,
              color: Colors.black54,
            ),
          ),
          SizedBox(width: width * 0.025),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  code,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: width * 0.04,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: height * 0.004),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: width * 0.036,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.032,
              vertical: height * 0.006,
            ),
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.12),
              borderRadius: BorderRadius.circular(width * 0.06),
            ),
            child: Text(
              status,
              style: TextStyle(
                color: statusColor,
                fontSize: width * 0.036,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
