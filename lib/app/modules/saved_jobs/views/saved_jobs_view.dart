import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/app_color/app_colors.dart';
import '../../../../common/app_text_style/styles.dart';
import '../../../../common/widgets/custom_list_tile.dart';
import '../../home/views/job_details_view.dart';
import '../controllers/saved_jobs_controller.dart';

class SavedJobsView extends StatelessWidget {
  final SavedJobsController savedJobsController = Get.find();

  SavedJobsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text('Saved Jobs', style: appBarStyle),
        backgroundColor: AppColors.white,
      ),
      body: Obx(() {
        if (savedJobsController.savedJobs.isEmpty) {
          return const Center(child: Text('No saved jobs yet'));
        }
        return ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          itemCount: savedJobsController.savedJobs.length,
          itemBuilder: (context, index) {
            final job = savedJobsController.savedJobs[index];
            return Padding(
              padding: EdgeInsets.only(
                top: index == 0 ? 0 : 8.0,
                bottom:
                    index == savedJobsController.savedJobs.length - 1 ? 110 : 0,
              ),
              child: CustomListTile(
                title: job.title ?? '',
                companyName: job.brand ?? '',
                location: job.sku ?? '',
                salary: '\$${job.price?.toStringAsFixed(2) ?? '0.00'}',
                onTap: () {
                  Get.to(() => JobDetailsView(product: job));
                },
                onApply: () {
                  savedJobsController.removeJob(job);
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
