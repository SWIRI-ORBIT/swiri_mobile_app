import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swiri/theme/app_colors.dart';

class HealthStatusCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final String unit;
  final Color? iconBackgroundColor;
  final Color? iconColor;
  final List<String>? statusIndicators;
  final Color? statusIndicatorColor;

  const HealthStatusCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.unit,
    this.iconBackgroundColor,
    this.iconColor,
    this.statusIndicators,
    this.statusIndicatorColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primary, AppColors.primary.withValues(alpha: 0.1)],
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
        ),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 48.w,
                height: 48.h,
                decoration: BoxDecoration(
                  color:
                      iconBackgroundColor ?? Color.fromARGB(255, 183, 200, 218),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Icon(icon, color: iconColor ?? AppColors.primary),
              ),
              SizedBox(width: 10),
              Text(
                title,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
              Spacer(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    value,
                    style: TextStyle(
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 4),
                  Text(
                    unit,
                    style: TextStyle(fontSize: 10.sp, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
          if (statusIndicators != null && statusIndicators!.isNotEmpty) ...[
            SizedBox(height: 12),
            ...statusIndicators!.map(
              (status) => Row(
                spacing: 6,
                children: [
                  Container(
                    width: 6.w,
                    height: 6.h,
                    decoration: BoxDecoration(
                      color: statusIndicatorColor ?? Color(0xff109207),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Text(
                    status,
                    style: TextStyle(fontSize: 12.sp, color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
