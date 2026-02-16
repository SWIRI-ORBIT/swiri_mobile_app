import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:swiri/core/routing/routes.dart';
import 'package:swiri/theme/app_colors.dart';
import 'package:swiri/widgets/default_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 1.sh,
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: const Alignment(0, 0 - 0.7),
                  radius: 1.3,
                  colors: [
                    AppColors.primary,
                    AppColors.primary.withValues(alpha: 0.9),
                    Colors.white,
                  ],
                  stops: const [0.0, 0.4, 0.9],
                ),
              ),
            ),
          ),
          Positioned(
            top: 140.h,
            right: 0,
            left: 0,
            child: Center(child: Image.asset('assets/Logo.png')),
          ),
          Positioned(
            bottom: 40.h,
            left: 24.w,
            right: 24.w,
            child: Column(
              children: [
                DefaultButton(
                  height: 54.h,
                  text: 'Login',
                  onPressed: () {
                    context.go(Routes.login);
                  },
                  backgroundColor: AppColors.primary,
                ),
                SizedBox(height: 12.h),
                DefaultButton(
                  height: 54.h,
                  text: 'Create Account',
                  borderColor: AppColors.primary,
                  isOutlined: true,
                  borderWidth: 1,
                  onPressed: () {
                    context.go(Routes.signup);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
