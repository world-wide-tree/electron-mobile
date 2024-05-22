import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:percent_indicator/percent_indicator.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0.dm),
      child: Column(
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(12.0.r),
            splashColor: Color.fromARGB(255, 196, 215, 249),
            // hoverColor: Colors.white,
            // focusColor: Colors.white,
            highlightColor: Colors.white,
            onTap: () {
              context.go('/dashboard/details');
            },
            child: Container(
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
          ),
          SizedBox(
            height: 32.0.h,
          ),
          Text(
            'Electricity consumption for each month',
            style: TextStyle(
              fontSize: 18.0.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 30.0.h,
          ),
          ConstrainedBox(
            constraints: BoxConstraints.tightFor(
              height: 257.0.h,
              width: double.infinity,
            ),
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                titlesData: const FlTitlesData(
                  // show: false,
                  leftTitles: AxisTitles(),
                  rightTitles: AxisTitles(),
                  topTitles: AxisTitles(),
                  bottomTitles: AxisTitles(
                    axisNameWidget: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Sep'),
                        Text('Oct'),
                        Text('Nov'),
                        Text('Dec'),
                        Text('Jan'),
                        Text('Feb'),
                        Text('Mar'),
                      ],
                    ),
                  ),
                ),
                gridData: const FlGridData(
                  show: false,
                ),
                borderData: FlBorderData(
                  border: const Border(
                    top: BorderSide.none,
                    right: BorderSide.none,
                    left: BorderSide.none,
                    bottom: BorderSide.none,
                  ),
                ),

                // barTouchData: BarTouchData(

                // ),

                // groupsSpace: 7,
                maxY: 100.0.h,

                barTouchData: BarTouchData(
                  touchTooltipData: BarTouchTooltipData(
                    tooltipBgColor: const Color(0xFFFF0101),
                    tooltipRoundedRadius: 10.0.r,
                    getTooltipItem: (group, groupIndex, rod, rodIndex) {
                      return BarTooltipItem(
                        '380 kWh',
                        TextStyle(
                          fontSize: 14.0.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      );
                    },
                  ),
                ),
                barGroups: [
                  BarChartGroupData(
                    x: 1,
                    barRods: [
                      BarChartRodData(
                        fromY: 0,
                        toY: 20.0.h,
                        width: 32.0.w,
                        color: const Color(0xFF1BE08E),
                      ),
                    ],
                  ),
                  BarChartGroupData(
                    x: 2,
                    barRods: [
                      BarChartRodData(
                        fromY: 0,
                        toY: 37.0.h,
                        width: 32.0.w,
                        color: const Color(0xFFFF7A01),
                      ),
                    ],
                  ),
                  BarChartGroupData(
                    x: 3,
                    barRods: [
                      BarChartRodData(
                        fromY: 0,
                        toY: 70.0.h,
                        width: 32.0.w,
                        color: const Color(0xFFFF0101),
                      ),
                    ],
                  ),
                  BarChartGroupData(
                    x: 4,
                    barRods: [
                      BarChartRodData(
                        fromY: 0,
                        toY: 27.0.h,
                        width: 32.0.w,
                        color: const Color(0xFF1BE08E),
                      ),
                    ],
                  ),
                  BarChartGroupData(
                    x: 5,
                    barRods: [
                      BarChartRodData(
                        fromY: 0,
                        toY: 40.0.h,
                        width: 32.0.w,
                        color: const Color(0xFFFF7A01),
                      ),
                    ],
                  ),
                  BarChartGroupData(
                    x: 6,
                    barRods: [
                      BarChartRodData(
                        fromY: 0,
                        toY: 20.0.h,
                        width: 32.0.w,
                        color: const Color(0xFF1BE08E),
                      ),
                    ],
                  ),
                  BarChartGroupData(
                    x: 7,
                    barRods: [
                      BarChartRodData(
                        fromY: 0,
                        toY: 33.0.h,
                        width: 32.0.w,
                        color: const Color(0xFFFF7A01),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
