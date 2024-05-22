import 'package:electron/presentation/screens/root.dart';
import 'package:electron/presentation/widgets/code_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class VerifyScreen extends StatelessWidget {
  const VerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 159.0.h),
              Text(
                'Enter code for\n verification',
                style: TextStyle(
                  fontSize: 28.0.sp,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 40.0.h),
              const CodeInputWidget(
                codeLength: 4,
              ),
              SizedBox(height: 70.0.h),
              Hero(
                tag: 'button',
                child: ElevatedButton(
                  onPressed: () {
                    // Navigator.of(context).push(
                    //   PageRouteBuilder(
                    //     transitionDuration: const Duration(milliseconds: 600),
                    //     pageBuilder: (context, animation, secondaryAnimation) =>
                    //         RootScreen(
                    //       child: Container(),
                    //     ),
                    //     transitionsBuilder:
                    //         (context, animation, secondaryAnimation, child) {
                    //       var tween = Tween(begin: 0.0, end: 1.0).chain(
                    //           CurveTween(curve: Curves.fastLinearToSlowEaseIn));
                    //       return AnimatedOpacity(
                    //         opacity: animation.drive(tween).value,
                    //         curve: Curves.fastLinearToSlowEaseIn,
                    //         duration: const Duration(seconds: 3),
                    //         child: child,
                    //       );
                    //     },
                    //   ),
                    // );
                    context.go('/dashboard');
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
                    fixedSize: MaterialStateProperty.all(Size(300.0.w, 60.0.h)),
                  ),
                  child: Text(
                    'Enter',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
