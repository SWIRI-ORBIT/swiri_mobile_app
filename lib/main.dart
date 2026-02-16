import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swiri/core/routing/app_router.dart';
import 'package:swiri/core/networking/service_locator.dart';
import 'package:swiri/theme/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  runApp(const SwiriApp());
}

class SwiriApp extends StatelessWidget {
  const SwiriApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
          ),
          routerConfig: appRouter,
        );
      },
    );
  }
}
