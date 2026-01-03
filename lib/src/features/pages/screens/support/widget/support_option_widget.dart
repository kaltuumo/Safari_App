import 'package:flutter/material.dart';
import 'package:safari_app/src/utils/constant/colors.dart';

class SupportOptionWidget extends StatelessWidget {
  final IconData icon; // ✅ Icon halkii imagePath
  final String title;
  final Color? iconColor; // midabka icon
  final VoidCallback? onTap;

  const SupportOptionWidget({
    super.key,
    required this.icon,
    required this.title,
    this.iconColor, // optional
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.04,
          vertical: height * 0.02,
        ),
        margin: EdgeInsets.only(bottom: height * 0.02),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Icon(icon, size: 20, color: iconColor ?? AppColors.black),
            SizedBox(width: width * 0.04),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: width * 0.05,
                  color: AppColors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
