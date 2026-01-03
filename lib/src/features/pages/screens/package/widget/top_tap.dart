import 'package:flutter/material.dart';
import 'package:safari_app/src/utils/constant/colors.dart';

class TopTab extends StatelessWidget {
  final String title;
  final bool active;
  final VoidCallback? onTap;

  const TopTab({
    super.key,
    required this.title,
    required this.active,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
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
      ),
    );
  }
}
