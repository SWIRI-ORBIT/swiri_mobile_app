import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swiri/theme/app_colors.dart';
import 'package:swiri/widgets/default_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 24, left: 24, top: 65),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello 👋',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        'Asmaa Ahmed',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.notifications_none_rounded,
                      size: 30,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Container(
                width: double.infinity,
                height: (281 / 852) * 1.sh,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              SizedBox(height: 24),
              Row(
                children: [
                  Image.asset('assets/safe_icon.png', height: 44, width: 44),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Your child is safe ❤️',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Inside The School • 2 hours ago',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Image.asset('assets/sound_icon.png', height: 44, width: 44),
                  SizedBox(width: 12),
                  Text(
                    'Environment sound status',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  Spacer(),
                  DefaultButton(
                    text: 'Check',
                    textStyle: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                    onPressed: () {},
                    height: 34,
                    width: 92.w,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
