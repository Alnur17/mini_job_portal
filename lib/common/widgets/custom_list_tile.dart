import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../app_color/app_colors.dart';
import '../app_text_style/styles.dart';
import 'custom_button.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final String companyName;
  final String location;
  final String salary;
  final VoidCallback? onTap;
  final VoidCallback onApply;
  final Color? backgroundColor;
  final Color? borderColor;
  final TextStyle? titleStyle;
  final TextStyle? companyStyle;
  final TextStyle? locationStyle;
  final TextStyle? salaryStyle;

  const CustomListTile({
    super.key,
    required this.title,
    required this.companyName,
    required this.location,
    required this.salary,
    this.onTap,
    required this.onApply,
    this.backgroundColor,
    this.borderColor,
    this.titleStyle,
    this.companyStyle,
    this.locationStyle,
    this.salaryStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width.w,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: backgroundColor ?? AppColors.silver,
        border: Border.all(color: borderColor ?? AppColors.borderColor),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Job Title
            Text(
              title,
              style: titleStyle ??
                  h5.copyWith(fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            // Company Name
            Text(
              companyName,
              style: companyStyle ?? h6,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            // Location
            Text(
              location,
              style: locationStyle ?? h6,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            // Salary
            Text(
              salary,
              style: salaryStyle ?? h6,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            // Apply Button
            CustomButton(
              text: 'Apply',
              onPressed: onApply,
              height: 36,
              // width: 100,
              backgroundColor: AppColors.orange, // Adjust color as needed
              textStyle: h6.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.w600,
              ),
              borderRadius: 8,
              padding: const EdgeInsets.symmetric(horizontal: 12),
            ),
          ],
        ),
      ),
    );
  }
}