import 'package:flutter/material.dart';
import 'package:safari_app/src/utils/constant/colors.dart';

class AboutItem extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const AboutItem({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w400,
              color: AppColors.black,
            ),
          ),
          trailing: const Icon(Icons.chevron_right, color: AppColors.grey),
          onTap: onTap,
        ),
      ],
    );
  }
}
