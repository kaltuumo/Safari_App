import 'package:flutter/material.dart';
import 'package:safari_app/src/utils/constant/colors.dart';

class SupportOptionWidget extends StatelessWidget {
  final String imagePath; // sawirka asset path
  final String title;
  final Color? imageColor; // midabka sawirka
  final VoidCallback? onTap;

  const SupportOptionWidget({
    super.key,
    required this.imagePath,
    required this.title,
    this.imageColor, // optional
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
          horizontal: width * 0.06,
          vertical: height * 0.02,
        ),
        margin: EdgeInsets.only(bottom: height * 0.02),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Image.asset(
              imagePath, // isticmaal imagePath halkii static Facebook logo
              width: 40,
              height: 40,
              color: imageColor, // halkan waxaad siineysaa midabka dibedda
              colorBlendMode: BlendMode.srcIn,
            ),
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
