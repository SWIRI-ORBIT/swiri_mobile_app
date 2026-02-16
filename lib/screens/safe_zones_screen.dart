import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:swiri/core/routing/routes.dart';
import 'package:swiri/theme/app_colors.dart';
import 'package:swiri/widgets/safe_zone_card.dart';

class SafeZonesScreen extends StatelessWidget {
  const SafeZonesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 24, left: 24, top: 65),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_back_ios_new_rounded),
                ),
              ],
            ),
            SizedBox(height: 20),
            SafeZoneCard(
              title: 'Home',
              address: '123 Maple Street, Springfield',
              isActive: false,
              onEditPressed: () {},
              onToggle: (value) {},
            ),
            SizedBox(height: 12),
            SafeZoneCard(
              title: 'Home',
              address: '123 Maple Street, Springfield',
              isActive: false,
              onEditPressed: () {},
              onToggle: (value) {},
            ),
            SizedBox(height: 12),
            SafeZoneCard(
              title: 'Home',
              address: '123 Maple Street, Springfield',
              isActive: false,
              onEditPressed: () {},
              onToggle: (value) {},
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: TextButton.icon(
                onPressed: () {
                  context.push(Routes.addSafeZone);
                },
                icon: Icon(Icons.add, size: 24.sp, color: Colors.white),
                label: Text(
                  'Add Safe Zone',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                ),
              ),
            ),
            SizedBox(height: 140),
          ],
        ),
      ),
    );
  }
}
