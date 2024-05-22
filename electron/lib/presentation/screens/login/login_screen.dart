import 'package:electron/presentation/screens/login_with_number/login_with_number.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:electron/presentation/utils/assets.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 27.0.w),
          child: Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40.0.h),
                Text(
                  'ELECTRON',
                  style: TextStyle(
                    fontSize: 30.0.sp,
                    fontWeight: FontWeight.w900,
                    color: const Color(0xFF1BE08D),
                  ),
                ),
                SizedBox(height: 22.0.h),
                SvgPicture.asset(
                  ElectronAssets.login,
                  height: 353.0.h,
                  width: 430.0.w,
                ),
                SizedBox(height: 10.0.h),
                Text(
                  'Log in with',
                  style: TextStyle(
                    fontSize: 30.0.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 52.0.h),
                Hero(
                  tag: 'button',
                  child: ElevatedButton(
                    onPressed: () {
                      context.go('/login_with_number');
                      // context
                      // Navigator.of(context).push();
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFF2666DE),
                      ),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0.r),
                        ),
                      ),
                      fixedSize:
                          MaterialStateProperty.all(Size(300.0.w, 60.0.h)),
                    ),
                    child: Text(
                      'PHONE NUMBER',
                      style: TextStyle(
                        fontSize: 16.0.sp,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                // SizedBox(height: 14.0.sp),
                // OutlinedButton(
                //   onPressed: () {},
                //   style: OutlinedButton.styleFrom(
                //     elevation: 5.0.h,
                //     backgroundColor: const Color(0xFFFFFFFF),
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(15.0.r),
                //     ),
                //     side: BorderSide(
                //       width: 2.0.w,
                //       color: const Color(0xFF3A8CD3),
                //     ),
                //     shadowColor: Colors.grey[300],
                //     fixedSize: Size(300.0.w, 60.0.h),
                //   ),
                //   child: Text(
                //     'E-MAIL',
                //     style: TextStyle(
                //       fontSize: 16.0.sp,
                //       fontWeight: FontWeight.w900,
                //       color: Color(0xFF3F90D6),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
