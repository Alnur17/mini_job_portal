import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mini_job_portal/app/modules/saved_jobs/controllers/saved_jobs_controller.dart';
import 'package:mini_job_portal/common/app_color/app_colors.dart';
import 'package:mini_job_portal/common/app_text_style/styles.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  ProfileView({super.key});

  final SavedJobsController savedJobsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        scrolledUnderElevation: 0,
        title: Text(
          'Profile',
          style: appBarStyle,
        ),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          ListTile(
            title: Text(
              'Sultan',
              style: h3,
            ),
            subtitle: Text(
              "sultanmdalnur@gmail.com",
              style: h5,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            margin: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.silver,
              border: Border.all(color: AppColors.borderColor),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Number Saved Jobs',
                  style: h5,
                ),
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text(
                      savedJobsController.savedJobs.length.toString(),
                      style: h5,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
