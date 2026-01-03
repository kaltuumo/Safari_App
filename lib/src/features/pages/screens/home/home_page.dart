import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:safari_app/src/features/pages/screens/home/checkRates/check_rates_page.dart';
import 'package:safari_app/src/features/pages/screens/home/widget/action_card.dart';
import 'package:safari_app/src/features/pages/screens/home/widget/activity_item.dart';
import 'package:safari_app/src/features/pages/screens/home/widget/shrimp_bottomsheet.dart';
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
            // vertical: height * 0.019,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.04),

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
                            Icons.menu,
                            color: AppColors.grey,
                            size: width * 0.05,
                          ),
                        ),
                        SizedBox(width: width * 0.026),
                        Image.asset(
                          AppImages.logo,
                          width: width * 0.25,
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
                      fontSize: width * 0.04,
                    ),
                    prefixIcon: const Icon(Icons.search, color: AppColors.grey),
                    suffixIcon: const Icon(
                      Iconsax.scan,
                      color: AppColors.primaryColor,
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
                            Iconsax.box,
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
                    ActionCard(
                      icon: Icons.local_shipping,
                      title: "New\nShipment",
                      width: width,
                      height: height,
                      onTap: () {
                        showNewShipmentBottomSheet(context);
                      },
                    ),

                    SizedBox(width: width * 0.03),
                    ActionCard(
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

                ActivityItem(
                  code: "1234567890AB",
                  subtitle: "Out for Delivery",
                  status: "On Process",
                  statusColor: AppColors.primaryColor,
                  width: width,
                  height: height,
                ),
                ActivityItem(
                  code: "1122334455AB",
                  subtitle: "Package Delivered",
                  status: "Delivered",
                  statusColor: AppColors.green,
                  width: width,
                  height: height,
                ),
                ActivityItem(
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
}
