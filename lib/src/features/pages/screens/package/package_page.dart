import 'package:flutter/material.dart';

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
        "statusColor": Colors.orange,
      },
      {
        "code": "1122334455AB",
        "subtitle": "Package Delivered",
        "status": "Delivered",
        "statusColor": Colors.green,
      },
      {
        "code": "1122334455AB",
        "subtitle": "Package Delivered",
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
        "statusColor": Colors.orange,
      },
      {
        "code": "8877665544YZ",
        "subtitle": "Package Delivered",
        "status": "Delivered",
        "statusColor": Colors.green,
      },
    ];

    // Choose which orders to display based on tab
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
                vertical: height * 0.025,
              ),
              decoration: const BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(28),
                  bottomRight: Radius.circular(28),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.arrow_back, color: Colors.white),
                      Row(
                        children: const [
                          Icon(Icons.tune, color: Colors.white),
                          SizedBox(width: 16),
                          Icon(Icons.open_in_full, color: Colors.white),
                          SizedBox(width: 16),
                          Icon(Icons.close, color: Colors.white),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.02),
                  const Text(
                    "Orders History",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.04,
                      vertical: height * 0.014,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.search, color: Colors.white70),
                        SizedBox(width: width * 0.02),
                        Expanded(
                          child: const Text(
                            "Enter track number...",
                            style: TextStyle(color: Colors.white70),
                          ),
                        ),
                        const Icon(
                          Icons.qr_code_scanner,
                          color: Colors.white,
                        ), // QR icon hadda waa sax
                      ],
                    ),
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: Colors.grey.withOpacity(0.12),
            child: const Icon(Icons.inventory_2_outlined, color: Colors.grey),
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
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
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
      child: Chip(
        label: Text(text),
        backgroundColor: active ? Colors.orange : Colors.grey.shade200,
        labelStyle: TextStyle(
          color: active ? Colors.white : Colors.grey,
          fontWeight: FontWeight.w500,
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
            color: active ? Colors.orange : Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          height: 2,
          width: 40,
          color: active ? Colors.orange : Colors.transparent,
        ),
      ],
    );
  }
}
