import 'package:flutter/material.dart';
import '../app_color/app_colors.dart';
import '../app_text_style/styles.dart';
import 'custom_button.dart';

class CustomListTile extends StatelessWidget {
  final String leadingText; // e.g., Initials or job identifier
  final String title; // Job title
  final String companyName; // Company name
  final String location; // Job location
  final String salary; // Salary information
  final VoidCallback? onTap; // Optional tap for the entire tile
  final VoidCallback? onApply; // Callback for the Apply button
  final Color? backgroundColor;
  final Color? borderColor;
  final TextStyle? titleStyle;
  final TextStyle? companyStyle;
  final TextStyle? locationStyle;
  final TextStyle? salaryStyle;

  const CustomListTile({
    super.key,
    required this.leadingText,
    required this.title,
    required this.companyName,
    required this.location,
    required this.salary,
    this.onTap,
    this.onApply,
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
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: backgroundColor ?? AppColors.silver,
        border: Border.all(color: borderColor ?? AppColors.borderColor),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Leading Circle with Text
            Container(
              padding: const EdgeInsets.all(12),
              decoration: const ShapeDecoration(
                shape: CircleBorder(),
                color: AppColors.white,
              ),
              child: Text(
                leadingText,
                style: h5,
              ),
            ),
            const SizedBox(width: 12),
            // Job Details
            Expanded(
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
                    onPressed: () => onApply,
                    height: 36,
                    width: 100,
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
          ],
        ),
      ),
    );
  }
}