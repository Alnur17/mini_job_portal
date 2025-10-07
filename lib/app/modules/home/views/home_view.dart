import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:mini_job_portal/app/modules/home/views/job_details_view.dart';

import '../../../../common/app_color/app_colors.dart';
import '../../../../common/widgets/custom_list_tile.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        scrolledUnderElevation: 0,
        title: const Text('Home'),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16).r,
        itemCount: 5,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(
              top: index == 0 ? 0 : 8.0, bottom: index == 5 - 1 ? 110 : 0),
          child: CustomListTile(
            leadingText: '1',
            title: 'Senior Flutter Developer',
            companyName: 'Tech Corp',
            location: 'San Francisco, CA',
            salary: '\$120,000 - \$150,000',
            onTap: () {
              Get.to(()=> JobDetailsView());
            },
            onApply: () {
              // Handle apply button tap
              print('Apply button pressed');
            },
            backgroundColor: AppColors.silver,
            borderColor: AppColors.borderColor,
          ),
        ),
      ),
    );
  }
}
