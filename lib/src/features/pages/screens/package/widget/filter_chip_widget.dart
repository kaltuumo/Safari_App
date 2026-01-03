import 'package:flutter/material.dart';
import 'package:safari_app/src/utils/constant/colors.dart';

class FilterChipWidget extends StatelessWidget {
  final String text;
  final bool active;
  final VoidCallback? onTap;

  const FilterChipWidget({
    super.key,
    required this.text,
    required this.active,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: active ? AppColors.orange : AppColors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: active ? AppColors.white : AppColors.grey,
            fontWeight: FontWeight.w500,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
