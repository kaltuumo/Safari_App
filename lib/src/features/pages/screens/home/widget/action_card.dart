import 'package:flutter/material.dart';
import 'package:safari_app/src/utils/constant/colors.dart';

class ActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final double width;
  final double height;
  final VoidCallback? onTap;

  const ActionCard({
    super.key,
    required this.icon,
    required this.title,
    required this.width,
    required this.height,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.035,
            vertical: height * 0.028,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(width * 0.045),
            border: Border.all(color: AppColors.primaryColor),
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
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
