import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mini_job_portal/common/app_color/app_colors.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          ListTile(
            title: Text('Sultan'),
            subtitle: Text("sultanmdalnur@gmail.com"),
          ),
          Container(
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.silver,
              border: Border.all(color: AppColors.borderColor),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Number Saved Jobs'),
                Text('10'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
