import 'package:electron/core/common/constants/route_constants.dart';
import 'package:electron/presentation/utils/custom_dashboard_icons.dart';
import 'package:electron/presentation/utils/devices_icons.dart';
import 'package:electron/presentation/utils/door_icons.dart';
import 'package:electron/presentation/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class RootScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  RootScreen({
    super.key,
    required this.navigationShell,
  });


  void _goBranch(int index) {
    navigationShell.goBranch(
      index,

      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(165.0.h),
        child: const CustomAppBar(),
      ),
      body: SafeArea(
        child: navigationShell,
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 35.0.w, vertical: 10),
          child: Hero(
            tag: '/button',
            child: Container(
              height: 56.0.h,
              padding: EdgeInsets.symmetric(horizontal: 8.0.w,),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0.sp),
                color: const Color(0xFF4A76FD),
              ),
              child: GNav(
                rippleColor: Colors.grey[300]!,
                hoverColor: Colors.grey[100]!,
                gap: 8,
                activeColor: Colors.white,
                iconSize: 24,
                padding:
                    EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 8.0.h),
                duration: const Duration(milliseconds: 400),
                tabBackgroundColor: Colors.grey[100]!,
                color: Colors.black,
                tabs: [
                  GButton(
                    icon: Custom_dashboard.dashboard,
                    iconColor: Colors.white,
                    text: 'Dashboard',
                    textStyle: TextStyle(
                      fontSize: 15.0.sp,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                    backgroundColor: const Color(0xFF669BF7),
                    borderRadius: BorderRadius.circular(9.sp),
                  ),
                  GButton(
                    icon: Door.open_door_fill,
                    iconColor: Colors.white,
                    text: 'Rooms',
                    textStyle: TextStyle(
                      fontSize: 15.0.sp,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                    backgroundColor: const Color(0xFF669BF7),
                    borderRadius: BorderRadius.circular(9.0.sp),
                  ),
                  GButton(
                    icon: Devices.devices,
                    iconColor: Colors.white,
                    text: 'Devices',
                    textStyle: TextStyle(
                      fontSize: 15.0.sp,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                    backgroundColor: const Color(0xFF669BF7),
                    borderRadius: BorderRadius.circular(9.0.sp),
                  ),
                ],
                selectedIndex: navigationShell.currentIndex,
                onTabChange: _goBranch,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
