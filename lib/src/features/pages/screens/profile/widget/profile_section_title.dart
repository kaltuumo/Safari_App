import 'package:flutter/material.dart';
import 'package:safari_app/src/utils/constant/colors.dart';

class ProfileSectionTitle extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const ProfileSectionTitle({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Text(
          title,
          style: const TextStyle(
            color: AppColors.grey,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
