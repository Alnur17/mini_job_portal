import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../../../../../common/widgets/custom_button.dart';
import '../../../../../common/widgets/custom_loader.dart';
import '../../../../../common/widgets/custom_textfield.dart';
import '../../login/controllers/login_controller.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = LoginController.to;

    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sh60,
            GestureDetector(
              onTap: () => Get.back(),
              child: Image.asset(AppImages.back, scale: 4),
            ),
            sh12,
            Text('Create Your Account',
                style: h2.copyWith(fontWeight: FontWeight.w700)),
            sh12,
            Text('It is quick and easy to create your account',
                style: h4.copyWith(color: AppColors.grey)),
            sh40,
            Text('Email', style: h4),
            sh8,
            CustomTextField(
                controller: emailController,
                hintText: 'Your email',
                containerColor: AppColors.white),
            sh12,
            Text('Password', style: h4),
            sh8,
            CustomTextField(
              controller: passwordController,
              hintText: '**********',
              containerColor: AppColors.white,
            ),
            sh24,
            Obx(() {
              return controller.isLoading.value
                  ? CustomLoader(color: AppColors.white)
                  : CustomButton(
                      text: 'Signup',
                      onPressed: () {
                        final email = emailController.text.trim();
                        final password = passwordController.text.trim();
                        if (email.isEmpty || password.isEmpty) {
                          Get.snackbar(
                              "Error", "Please enter email and password");
                          return;
                        }
                        controller.signup(email, password);
                      },
                      imageAssetPath: AppImages.arrowRightNormal,
                      gradientColors: AppColors.buttonColor,
                    );
            }),
            sh24,
            GestureDetector(
              onTap: () => Get.back(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account?',
                      style: h4.copyWith(color: AppColors.grey)),
                  sw5,
                  Text('Login', style: h4.copyWith(color: AppColors.orange)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
