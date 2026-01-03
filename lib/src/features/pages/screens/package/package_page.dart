import 'package:flutter/material.dart';
import 'package:safari_app/src/features/pages/screens/package/widget/filter_chip_widget.dart';
import 'package:safari_app/src/features/pages/screens/package/widget/order_card.dart';
import 'package:safari_app/src/features/pages/screens/package/widget/top_tap.dart';
import 'package:safari_app/src/utils/constant/colors.dart';

class PackagePage extends StatefulWidget {
  const PackagePage({super.key});

  @override
  State<PackagePage> createState() => _PackagePageState();
}

class _PackagePageState extends State<PackagePage> {
  bool selectedTab = true;
  String activeFilter = "All";

  // ===== SAMPLE DATA =====
  final List<Map<String, dynamic>> fromMeOrders = [
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

  final List<Map<String, dynamic>> toMeOrders = [
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

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final currentOrders = selectedTab ? fromMeOrders : toMeOrders;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FA),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(width, height),
            const SizedBox(height: 20),
            _buildTabs(width),
            const SizedBox(height: 20),
            _buildFilters(width),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                itemCount: currentOrders.length,
                itemBuilder: (context, index) {
                  final order = currentOrders[index];
                  return OrderCard(
                    code: order["code"] ?? "",
                    subtitle: order["subtitle"] ?? "",
                    status: order["status"] ?? "",
                    statusColor: order["statusColor"] ?? AppColors.grey,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(double width, double height) {
    return Container(
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
          Icon(Icons.arrow_back, color: AppColors.white, size: 22),
          SizedBox(height: height * 0.02),
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
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.white.withOpacity(0.25),
                ),
                child: const Icon(Icons.tune, color: AppColors.white, size: 20),
              ),
            ],
          ),
          SizedBox(height: height * 0.025),
          Row(
            children: [
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
    );
  }

  Widget _buildTabs(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TopTab(
          title: "From Me",
          active: selectedTab,
          onTap: () => setState(() => selectedTab = true),
        ),
        SizedBox(width: width * 0.15),
        TopTab(
          title: "To Me",
          active: !selectedTab,
          onTap: () => setState(() => selectedTab = false),
        ),
      ],
    );
  }

  Widget _buildFilters(double width) {
    final filters = ["All", "Pending", "On Process", "Delivered"];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: filters.map((filter) {
            return FilterChipWidget(
              text: filter,
              active: activeFilter == filter,
              onTap: () => setState(() => activeFilter = filter),
            );
          }).toList(),
        ),
      ),
    );
  }
}
