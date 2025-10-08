import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:mini_job_portal/app/modules/home/views/job_details_view.dart';

import '../../../../common/app_color/app_colors.dart';
import '../../../../common/app_text_style/styles.dart';
import '../../../../common/widgets/custom_list_tile.dart';
import '../../saved_jobs/controllers/saved_jobs_controller.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});

  final HomeController homeController = Get.put(HomeController());
  final SavedJobsController savedJobsController =
      Get.put(SavedJobsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        scrolledUnderElevation: 0,
        title: Text('Home', style: appBarStyle),
        automaticallyImplyLeading: false,
      ),
      body: Obx(() {
        if (homeController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (homeController.productsList.isEmpty) {
          return const Center(child: Text('No products found'));
        }
        return ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 16).r,
          itemCount: homeController.productsList.length,
          itemBuilder: (context, index) {
            final product = homeController.productsList[index];
            return Padding(
              padding: EdgeInsets.only(
                top: index == 0 ? 0 : 8.0,
                bottom:
                    index == homeController.productsList.length - 1 ? 110 : 0,
              ),
              child: CustomListTile(
                title: product.title ?? '',
                companyName: product.brand ?? 'Creative Tech Park',
                location: product.sku ?? '',
                salary: '\$${product.price?.toStringAsFixed(2) ?? '0.00'}',
                onTap: () {
                  Get.to(() => JobDetailsView(
                        product: product,
                      ));
                },
                onApply: () {
                  savedJobsController.addJob(product);
                  print('Apply button pressed for ${product.title}');
                },
                backgroundColor: AppColors.silver,
                borderColor: AppColors.borderColor,
              ),
            );
          },
        );
      }),
    );
  }
}
