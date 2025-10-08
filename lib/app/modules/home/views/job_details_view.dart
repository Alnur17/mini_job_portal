import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../common/app_color/app_colors.dart';
import '../../../../common/app_text_style/styles.dart';
import '../../../../common/size_box/custom_sizebox.dart';
import '../../../../common/widgets/custom_list_tile.dart';
import '../../saved_jobs/controllers/saved_jobs_controller.dart';
import '../controllers/home_controller.dart';
import '../model/products_model.dart'; // Assuming Product is accessible via this

class JobDetailsView extends GetView<HomeController> {
  final Product product;

  JobDetailsView({
    required this.product,
    super.key,
  });

  final SavedJobsController savedJobsController = Get.find<SavedJobsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.mainColor,
        title: Text(
          'Job Details',
          style: appBarStyle,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sh20,
            CustomListTile(
              title: product.title ?? '',
              companyName: product.brand ?? 'Creative Tech Park',
              location: product.sku ?? '',
              salary: '\$${product.price?.toStringAsFixed(2) ?? '0.00'}',
              onTap: () {},
              onApply: () {
                savedJobsController.addJob(product);
                print('Apply button pressed');
              },
              backgroundColor: AppColors.silver,
              borderColor: AppColors.borderColor,
            ),
            sh16,
            Text('Description',style: h3,),
            sh8,
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  product.description ?? '',
                  style: h5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}