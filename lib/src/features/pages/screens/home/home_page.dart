import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:safari_app/src/features/pages/screens/home/check_rates_page.dart';
import 'package:safari_app/src/features/pages/screens/home/widget/tracking_details_page.dart';
import 'package:safari_app/src/shared/app_button.dart';
import 'package:safari_app/src/utils/constant/colors.dart';
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
                            color: AppColors.white,
                          ),
                          child: Icon(
                            Icons.sort_outlined,
                            color: AppColors.grey,
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
                        color: AppColors.white,
                      ),
                      child: Icon(
                        Iconsax.notification,
                        color: AppColors.black,
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
                      color: AppColors.grey,
                      fontSize: width * 0.038,
                    ),
                    prefixIcon: const Icon(Icons.search, color: AppColors.grey),
                    suffixIcon: const Icon(
                      Icons.qr_code_scanner,
                      color: AppColors.grey,
                    ),
                    filled: true,
                    fillColor: AppColors.white,
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
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.circular(width * 0.045),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.inbox,
                            color: AppColors.white,
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
                                  color: AppColors.white.withOpacity(0.9),
                                  fontSize: width * 0.037,
                                ),
                              ),
                              Text(
                                "Move on!",
                                style: TextStyle(
                                  color: AppColors.white,
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
                          backgroundColor: AppColors.white,
                          foregroundColor: AppColors.secondaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(width * 0.02),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: width * 0.03,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CheckRatesPage(),
                            ),
                          );
                        },
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
                      onTap: () {
                        showNewShipmentBottomSheet(context);
                      },
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
                        color: AppColors.black,
                      ),
                    ),
                    Text(
                      "See All",
                      style: TextStyle(
                        color: AppColors.primaryColor,
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
                  statusColor: AppColors.primaryColor,
                  width: width,
                  height: height,
                ),
                _activityItem(
                  code: "1122334455AB",
                  subtitle: "Package Delivered",
                  status: "Delivered",
                  statusColor: AppColors.green,
                  width: width,
                  height: height,
                ),
                _activityItem(
                  code: "5566778899AB",
                  subtitle: "Order Cancelled",
                  status: "Cancelled",
                  statusColor: AppColors.red,
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
    VoidCallback? onTap, // <-- ensure this is onTap, not onPressed
  }) {
    return Expanded(
      child: InkWell(
        onTap: onTap, // <-- use onTap here

        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.035,
            vertical: height * 0.028,
          ),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(width * 0.045),
            border: Border.all(color: AppColors.primaryColor.withOpacity(0.35)),
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: width * 0.055,
                backgroundColor: AppColors.primaryColor.withOpacity(0.12),
                child: Icon(
                  icon,
                  color: AppColors.primaryColor,
                  size: width * 0.06,
                ),
              ),
              SizedBox(width: width * 0.025),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: width * 0.042,
                    color: AppColors.black,
                  ),
                ),
              ),
            ],
          ),
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
        color: AppColors.white,
        borderRadius: BorderRadius.circular(width * 0.04),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: width * 0.055,
            backgroundColor: AppColors.grey.withOpacity(0.12),
            child: Icon(
              Icons.inventory_2_outlined,
              size: width * 0.06,
              color: AppColors.black.withOpacity(0.6),
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
                    color: AppColors.black,
                  ),
                ),
                SizedBox(height: height * 0.004),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: AppColors.grey,
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

/// ShipmentType enum outside the class
enum ShipmentType { domestic, international }

/// BottomSheet for New Shipment
Future<ShipmentType?> showNewShipmentBottomSheet(BuildContext context) {
  final height = MediaQuery.of(context).size.height;
  ShipmentType? selected;

  return showModalBottomSheet<ShipmentType>(
    context: context,
    isScrollControlled: true, // ✅ muhiim
    backgroundColor: Colors.transparent,
    builder: (ctx) {
      return StatefulBuilder(
        builder: (context, setState) {
          return SafeArea(
            top: false,
            child: SingleChildScrollView(
              // ✅ overflow fix
              child: Container(
                padding: const EdgeInsets.fromLTRB(20, 14, 20, 18),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // drag handle
                    Container(
                      width: 56,
                      height: 5,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE6E6E6),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    const SizedBox(height: 16),

                    const Text(
                      "New Shipment",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF111827),
                      ),
                    ),
                    const SizedBox(height: 10),

                    const Text(
                      "Where are you sending the Order?",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF6B7280),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 18),

                    Row(
                      children: [
                        Expanded(
                          child: _ChoiceCard(
                            title: "Domestic",
                            imagePath: AppImages.world,
                            isSelected: selected == ShipmentType.domestic,
                            onTap: () => setState(
                              () => selected = ShipmentType.domestic,
                            ),
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: _ChoiceCard(
                            title: "International",
                            imagePath: AppImages.world,
                            isSelected: selected == ShipmentType.international,
                            onTap: () {
                              setState(
                                () => selected = ShipmentType.international,
                              );

                              // Navigation to Tracking Page
                              Get.to(() => const TrackingDetailsPage());
                            },
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity,
                      height: height * 0.061,
                      child: AppButton(
                        text: "Continue",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const CheckRatesPage(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  );
}

class _ChoiceCard extends StatelessWidget {
  const _ChoiceCard({
    required this.title,
    required this.imagePath,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final String imagePath;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: 120,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFFE6E6E7),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              // ✅ image xad
              height: 36,
              child: Image.asset(imagePath),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
