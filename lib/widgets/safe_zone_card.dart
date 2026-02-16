import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swiri/theme/app_colors.dart';

class SafeZoneCard extends StatelessWidget {
  final String title;
  final String address;
  final bool isActive;
  final VoidCallback onEditPressed;
  final ValueChanged<bool> onToggle;

  const SafeZoneCard({
    super.key,
    required this.title,
    required this.address,
    required this.isActive,
    required this.onEditPressed,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: AppColors.primary),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 4,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
              ),
              Text(
                address,
                style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          Spacer(),
          IconButton.filled(
            onPressed: onEditPressed,
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(
                Color.fromARGB(255, 199, 216, 234),
              ),
            ),
            icon: Icon(
              Icons.edit_outlined,
              size: 20.sp,
              color: AppColors.primary,
            ),
          ),
          SizedBox(width: 12),
          Switch(
            value: isActive,
            onChanged: onToggle,
            activeThumbColor: AppColors.primary,
            activeTrackColor: Color.fromARGB(255, 199, 216, 234),
            inactiveThumbColor: Color(0xff4D4D4D),
            inactiveTrackColor: Color.fromARGB(255, 235, 235, 235),
          ),
        ],
      ),
    );
  }
}
