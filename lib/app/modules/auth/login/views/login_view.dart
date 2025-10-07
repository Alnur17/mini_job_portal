import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:mini_job_portal/app/modules/dashboard/views/dashboard_view.dart';
import 'package:mini_job_portal/common/app_color/app_colors.dart';
import 'package:mini_job_portal/common/size_box/custom_sizebox.dart';
import 'package:mini_job_portal/common/widgets/custom_button.dart';

import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/widgets/custom_textfield.dart';
import '../../signup/views/signup_view.dart';
import '../controllers/login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginController loginController = Get.put(LoginController());

  TextEditingController emailTEController = TextEditingController();
  TextEditingController passwordTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sh60,
              // GestureDetector(
              //     onTap: () {
              //       Get.back();
              //     },
              //     child: Image.asset(
              //       AppImages.back,
              //       scale: 4,
              //     )),
              // sh12,
              // Image.asset(
              //   AppImages.logo,
              //   scale: 4,
              // ),
              sh16,
              Text(
                'Login to your Account',
                style: h2.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              sh12,
              Text(
                'It is quick and easy to log in. Enter your email and password below.',
                style: h4.copyWith(color: AppColors.grey),
              ),
              sh40,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Email', style: h4),
                  sh8,
                  CustomTextField(
                    hintText: 'Your email',
                    containerColor: AppColors.white,
                    controller: emailTEController,
                  ),
                  const SizedBox(height: 12),
                  Text('Password', style: h4),
                  sh8,
                  CustomTextField(
                    sufIcon: Image.asset(
                      AppImages.eyeClose,
                      scale: 4,
                    ),
                    hintText: '**********',
                    containerColor: AppColors.white,
                    controller: passwordTEController,
                  ),
                ],
              ),


              sh24,
              // Obx(
              //       () {
              //     return loginController.isLoading.value == true
              //         ? CustomLoader(color: AppColors.white)
              //         :
              CustomButton(
                text: 'Login',
                onPressed: () {
                  Get.to(() => DashboardView());
                  // loginController.userLogin(
                  //   email: emailTEController.text,
                  //   password: passwordTEController.text,
                  // );
                },
                imageAssetPath: AppImages.arrowRightNormal,
                gradientColors: AppColors.buttonColor,
                //   );
                // },
              ),
              sh24,
              GestureDetector(
                onTap: () {
                  Get.to(() => const SignupView());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: h4.copyWith(color: AppColors.grey),
                    ),
                    sw5,
                    Text(
                      'Signup',
                      style: h4.copyWith(color: AppColors.orange),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
