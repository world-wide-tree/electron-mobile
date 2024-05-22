import 'package:electron/presentation/screens/devices/add_dialog.dart';
import 'package:electron/presentation/screens/devices/device_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DevicesScreen extends StatefulWidget {
  List<String> rooms = ['Living Room', 'Bathroom', 'Bedroom'];
  DevicesScreen({super.key, required this.rooms});

  @override
  State<DevicesScreen> createState() => _DevicesScreenState();
}

class _DevicesScreenState extends State<DevicesScreen> {
  bool isActive = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30.h),
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: GridView.count(
                crossAxisCount: 2,
                children: [
                  DeviceWidget(
                    icon: Icons.lightbulb,
                    isActive: isActive,
                    subString: 'Philips Hue 2',
                    title: 'Light bubls',
                  ),
                  DeviceWidget(
                    icon: Icons.tv,
                    isActive: isActive,
                    subString: 'Panasonic',
                    title: 'Smart TV',
                  ),
                  DeviceWidget(
                    icon: Icons.router_outlined,
                    isActive: isActive,
                    subString: 'TP Link',
                    title: 'Wi-Fi Router',
                  ),
                  DeviceWidget(
                    icon: Icons.hot_tub,
                    isActive: isActive,
                    subString: 'Ariston',
                    title: 'Heater',
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton( 
            onPressed: () {
              showDialog(context: context, builder: (context) => AddDialog());
            },
            child: Text(
              '+ ADD A DEVICE',
              style: TextStyle(color: Colors.blue),
            ),
            style: ButtonStyle(
              fixedSize: MaterialStatePropertyAll(
                Size(160.w, 48.h),
              ),
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
              ),
              backgroundColor: MaterialStatePropertyAll(Colors.white),
              overlayColor: MaterialStatePropertyAll(Colors.blue),
              textStyle: MaterialStatePropertyAll(
                TextStyle(color: Colors.black, fontSize: 14.sp),
              ),
            ),
          )
        ],
      ),
    );
  }
}
