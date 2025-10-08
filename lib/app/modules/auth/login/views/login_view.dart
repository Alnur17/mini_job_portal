import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:mini_job_portal/common/app_color/app_colors.dart';
import 'package:mini_job_portal/common/size_box/custom_sizebox.dart';
import 'package:mini_job_portal/common/widgets/custom_button.dart';

import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/widgets/custom_loader.dart';
import '../../../../../common/widgets/custom_textfield.dart';
import '../../signup/views/signup_view.dart';
import '../controllers/login_controller.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

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
            sh16,
            Text('Login to your Account',
                style: h2.copyWith(fontWeight: FontWeight.w700)),
            sh12,
            Text(
              'It is quick and easy to log in. Enter your email and password below.',
              style: h4.copyWith(color: AppColors.grey),
            ),
            sh40,
            Text('Email', style: h4),
            sh8,
            CustomTextField(
              controller: emailController,
              hintText: 'Your email',
              containerColor: AppColors.white,
            ),
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
                      text: 'Login',
                      onPressed: () {
                        final email = emailController.text.trim();
                        final password = passwordController.text.trim();
                        if (email.isEmpty || password.isEmpty) {
                          Get.snackbar(
                              "Error", "Please enter email and password");
                          return;
                        }
                        controller.login(email, password);
                      },
                      imageAssetPath: AppImages.arrowRightNormal,
                      gradientColors: AppColors.buttonColor,
                    );
            }),
            sh24,
            GestureDetector(
              onTap: () => Get.to(() => const SignupView()),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?",
                      style: h4.copyWith(color: AppColors.grey)),
                  sw5,
                  Text('Signup', style: h4.copyWith(color: AppColors.orange)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
