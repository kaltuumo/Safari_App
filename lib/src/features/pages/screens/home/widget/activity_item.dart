import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:safari_app/src/features/pages/screens/home/trackingDetails/tracking_details_page.dart';

class ActivityItem extends StatelessWidget {
  final String code;
  final String subtitle;
  final String status;
  final Color statusColor;
  final double width;
  final double height;

  const ActivityItem({
    super.key,
    required this.code,
    required this.subtitle,
    required this.status,
    required this.statusColor,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => const TrackingDetailsPage()),
      child: Container(
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
                Iconsax.box,
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
                    ),
                  ),
                  SizedBox(height: height * 0.004),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.grey,
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
      ),
    );
  }
}
