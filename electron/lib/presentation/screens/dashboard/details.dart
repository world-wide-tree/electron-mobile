import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:go_router/go_router.dart";
import "package:percent_indicator/circular_percent_indicator.dart";

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            context.go('/dashboard');
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 18.0.w,
          right: 18.0.w,
          top: 10.0.h,
          bottom: 20.0.h,
        ),
        child: Column(
          children: [
            Container(
              height: 143.0.h,
              width: double.infinity,
              padding: EdgeInsets.all(15.0.dm),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0.r),
                border: Border.all(
                  color: const Color(0xFF2666DE),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Transformer load',
                          style: TextStyle(
                            color: const Color(0xFF2666DE),
                            fontSize: 20.0.sp,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          "It's time to think about your worries",
                          style: TextStyle(
                            fontSize: 13.0.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          'Earned bonuses',
                          style: TextStyle(
                            fontSize: 16.0.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '12 000 sum',
                          style: TextStyle(
                            fontSize: 28.0.sp,
                            fontWeight: FontWeight.w800,
                            color: const Color(0xFFFF7A01),
                          ),
                        ),
                      ],
                    ),
                  ),
                  CircularPercentIndicator(
                    radius: 40.0.r,
                    lineWidth: 9.0.dm,
                    animation: true,
                    percent: 0.3,
                    center: Text(
                      "30.0%",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 17.0.sp,
                        color: const Color(0xFF1BE08E),
                      ),
                    ),
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: const Color(0xFF1AE08E),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
