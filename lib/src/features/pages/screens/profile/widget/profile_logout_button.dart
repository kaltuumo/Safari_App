import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:safari_app/src/utils/constant/colors.dart';

class ProfileLogoutButton extends StatelessWidget {
  final VoidCallback? onTap;

  const ProfileLogoutButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: height * 0.018),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.secondaryColor),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Iconsax.logout, color: AppColors.secondaryColor),
            SizedBox(width: 10),
            Text(
              "Logout",
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
