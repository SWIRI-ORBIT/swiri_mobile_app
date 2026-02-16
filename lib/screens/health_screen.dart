import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swiri/widgets/health_status_card.dart';

class HealthScreen extends StatelessWidget {
  const HealthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 24, left: 24, top: 65),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            HealthStatusCard(
              icon: Icons.favorite_rounded,
              title: 'Heart Status',
              value: '68',
              unit: 'beats per minute',
              statusIndicators: [
                'Normal resting heart rate',
                'All systems healthy',
              ],
            ),
            SizedBox(height: 24),
            Text(
              'Weekly Heart Rate Average',
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
            ),
            Text(
              'Track your heart rate trends over the past week',
              style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
