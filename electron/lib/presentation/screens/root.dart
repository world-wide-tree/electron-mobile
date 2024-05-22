import 'package:electron/common/constants/route_constants.dart';
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

  // @override
  // State<RootScreen> createState() => _RootScreenState();

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
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

// class _RootScreenState extends State<RootScreen> {
//   static int _selectedIndex = 0;

//   List<String> tabs = [
//     RouteList.dashboard,
//     RouteList.rooms,
//     RouteList.devices,
//   ];

//   void _goOtherTab(BuildContext context, int index) {
//     if (index == _selectedIndex) return;
//     GoRouter router = GoRouter.of(context);
//     String location = tabs[index];
//     if (index == 3) {
//       router.push(location);
//     }

//     _selectedIndex = index;
//     router.go(location);
//     // setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(145.0.h),
//         child: const CustomAppBar(),
//       ),
//       body: SafeArea(
//         child: widget.child,
//       ),
//       bottomNavigationBar: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 35.0.w),
//           child: Hero(
//             tag: '/button',
//             child: Container(
//               height: 56.0.h,
//               padding: EdgeInsets.symmetric(horizontal: 8.0.w),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15.0.sp),
//                 color: const Color(0xFF4A76FD),
//               ),
//               child: GNav(
//                 rippleColor: Colors.grey[300]!,
//                 hoverColor: Colors.grey[100]!,
//                 gap: 8,
//                 activeColor: Colors.white,
//                 iconSize: 24,
//                 padding:
//                     EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 8.0.h),
//                 duration: const Duration(milliseconds: 400),
//                 tabBackgroundColor: Colors.grey[100]!,
//                 color: Colors.black,
//                 tabs: [
//                   GButton(
//                     icon: Custom_dashboard.dashboard,
//                     iconColor: Colors.white,
//                     // iconActiveColor: Colors.white,
//                     text: 'Dashboard',
//                     // textColor: Colors.white,
//                     textStyle: TextStyle(
//                       fontSize: 15.0.sp,
//                       fontWeight: FontWeight.w800,
//                       color: Colors.white,
//                     ),
//                     backgroundColor: const Color(0xFF669BF7),
//                     borderRadius: BorderRadius.circular(9.sp),
//                   ),
//                   GButton(
//                     icon: Door.open_door_fill,
//                     iconColor: Colors.white,
//                     // iconActiveColor: Colors.white,
//                     text: 'Rooms',
//                     // textColor: Colors.white,
//                     textStyle: TextStyle(
//                       fontSize: 15.0.sp,
//                       fontWeight: FontWeight.w800,
//                       color: Colors.white,
//                     ),
//                     backgroundColor: const Color(0xFF669BF7),
//                     borderRadius: BorderRadius.circular(9.0.sp),
//                   ),
//                   GButton(
//                     icon: Devices.devices,
//                     iconColor: Colors.white,
//                     // iconActiveColor: Colors.white,
//                     text: 'Devices',
//                     // textColor: Colors.white,
//                     textStyle: TextStyle(
//                       fontSize: 15.0.sp,
//                       fontWeight: FontWeight.w800,
//                       color: Colors.white,
//                     ),
//                     backgroundColor: const Color(0xFF669BF7),
//                     borderRadius: BorderRadius.circular(9.0.sp),
//                   ),
//                 ],
//                 selectedIndex: _selectedIndex,
//                 onTabChange: (index) => _goOtherTab(context, index),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
