import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginWithNumberScreen extends StatelessWidget {
  LoginWithNumberScreen({super.key});

  final phoneController = TextEditingController();

  // void phoneFocus() {
  //   if (phoneController.text.isEmpty) {
  //     phoneController.text = '+998 ';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 83.0.h),
                Text(
                  'Log in with\nNumber',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32.0.sp,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 125.0.h),
                TextField(
                  style: TextStyle(
                    fontSize: 14.sp,
                    height: 1.5.sp,
                  ),
                  controller: phoneController,
                  decoration: InputDecoration(
                    helperText: 'Enter your phone number',
                    helperStyle: TextStyle(
                      fontSize: 14.0.sp,
                    ),
                    prefixIcon: Align(
                      alignment: Alignment.centerLeft,
                      widthFactor: 1,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.0.w),
                        child: const Text('+998 '),
                      ),
                    ),
                    filled: true,
                    fillColor: const Color(0xFFF2F3F7),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15.0.r),
                    ),
                    constraints: BoxConstraints.tight(
                      Size(350.0.w, 73.0.h),
                    ),
                  ),
                ),
                SizedBox(height: 101.h),
                Hero(
                  tag: 'button',
                  child: ElevatedButton(
                    onPressed: () {
                      context.go('/verify_screen');
                      // Navigator.of(context).pushAndRemoveUntil(
                      //   MaterialPageRoute(
                      //     builder: (context) => const VerifyScreen(),
                      //   ),
                      //   (route) => false,
                      // );
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
                      'Continue',
                      style: TextStyle(
                        fontSize: 24.0.sp,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
