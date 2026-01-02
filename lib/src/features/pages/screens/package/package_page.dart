import 'package:flutter/material.dart';
import 'package:safari_app/src/utils/constant/colors.dart';

class PackagePage extends StatefulWidget {
  const PackagePage({super.key});

  @override
  State<PackagePage> createState() => _PackagePageState();
}

class _PackagePageState extends State<PackagePage> {
  bool selectedTab = true; // true = From Me, false = To Me

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    // Data for From Me tab
    final fromMeOrders = [
      {
        "code": "1234567890AB",
        "subtitle": "Out for Delivery",
        "status": "On Process",
        "statusColor": AppColors.orange,
      },
      {
        "code": "1122334455AB",
        "subtitle": "Package Delivered",
        "status": "Delivered",
        "statusColor": AppColors.green,
      },
      {
        "code": "1122334455AB",
        "subtitle": "Package Cancelled",
        "status": "Cancelled",
        "statusColor": Colors.red,
      },
    ];

    // Data for To Me tab
    final toMeOrders = [
      {
        "code": "9988776655XY",
        "subtitle": "Package Pending",
        "status": "Pending",
        "statusColor": AppColors.orange,
      },
      {
        "code": "8877665544YZ",
        "subtitle": "Package Delivered",
        "status": "Delivered",
        "statusColor": AppColors.green,
      },
    ];

    final currentOrders = selectedTab ? fromMeOrders : toMeOrders;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FA),
      body: SafeArea(
        child: Column(
          children: [
            /// ================= HEADER =================
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.05,
                vertical: height * 0.035,
              ),
              decoration: BoxDecoration(
                color: AppColors.orange,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(28),
                  bottomRight: Radius.circular(28),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// ===== BACK ICON =====
                  Icon(Icons.arrow_back, color: AppColors.white, size: 22),
                  SizedBox(height: height * 0.02),

                  /// ===== TITLE + FILTER =====
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Orders History",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      /// FILTER ICON
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.white.withOpacity(0.25),
                        ),
                        child: const Icon(
                          Icons.tune,
                          color: AppColors.white,
                          size: 20,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: height * 0.025),

                  /// ===== SEARCH + QR (SIDE BY SIDE) =====
                  Row(
                    children: [
                      /// SEARCH BAR
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: width * 0.04,
                            vertical: height * 0.014,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.white.withOpacity(0.25),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.search,
                                color: AppColors.white.withOpacity(0.7),
                              ),
                              SizedBox(width: width * 0.025),
                              const Expanded(
                                child: Text(
                                  "Enter track number...",
                                  style: TextStyle(color: AppColors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(width: width * 0.03),

                      /// QR ICON
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.white.withOpacity(0.25),
                        ),
                        child: const Icon(
                          Icons.qr_code_scanner,
                          color: AppColors.white,
                          size: 22,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: height * 0.02),

            /// ================= TABS =================
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedTab = true;
                    });
                  },
                  child: _topTab("From Me", selectedTab),
                ),
                SizedBox(width: width * 0.15),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedTab = false;
                    });
                  },
                  child: _topTab("To Me", !selectedTab),
                ),
              ],
            ),

            SizedBox(height: height * 0.02),

            /// ================= FILTERS =================
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _filterChip("All", true),
                    _filterChip("Pending", false),
                    _filterChip("On Process", false),
                    _filterChip("Delivered", false),
                  ],
                ),
              ),
            ),

            SizedBox(height: height * 0.02),

            /// ================= ORDER LIST =================
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                itemCount: currentOrders.length,
                itemBuilder: (context, index) {
                  final order = currentOrders[index];
                  return _orderCard(
                    code: order["code"]?.toString() ?? "",
                    subtitle: order["subtitle"]?.toString() ?? "",
                    status: order["status"]?.toString() ?? "",
                    statusColor: order["statusColor"] as Color,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// ================= ORDER CARD =================
  Widget _orderCard({
    required String code,
    required String subtitle,
    required String status,
    required Color statusColor,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: AppColors.grey.withOpacity(0.12),
            child: const Icon(
              Icons.inventory_2_outlined,
              color: AppColors.grey,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  code,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(color: AppColors.grey, fontSize: 13),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.12),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              status,
              style: TextStyle(
                color: statusColor,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// ================= FILTER CHIP =================
  Widget _filterChip(String text, bool active) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: active ? AppColors.orange : AppColors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: active ? AppColors.white : AppColors.grey,
            fontWeight: FontWeight.w500,
            fontSize: 13,
          ),
        ),
      ),
    );
  }

  /// ================= TOP TAB =================
  Widget _topTab(String title, bool active) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            color: active ? AppColors.orange : AppColors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          height: 2,
          width: 40,
          color: active ? AppColors.orange : Colors.transparent,
        ),
      ],
    );
  }
}
