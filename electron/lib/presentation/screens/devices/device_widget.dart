import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeviceWidget extends StatefulWidget {
  const DeviceWidget({
    super.key,
    required this.icon,
    required this.isActive,
    required this.subString,
    required this.title,
  });
  final IconData icon;
  final String title;
  final String subString;
  final bool isActive;

  @override
  State<DeviceWidget> createState() => _DeviceWidgetState();
}

class _DeviceWidgetState extends State<DeviceWidget> {
  late bool isActive;
  @override
  void initState() {
    isActive = widget.isActive;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        width: 180.w,
        height: 160.h,
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              blurRadius: 10,
              color: isActive?Colors.blue[100]!: Colors.grey[100]!,
              spreadRadius: 4,
            )
          ],
          border: Border.all(
            color: isActive?Colors.blue : Colors.grey,
          ),
          color: isActive ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    
                    widget.icon,
                    size: 32.w,
                    color: isActive ? Colors.white : Colors.grey,
                  ),
                  Switch(
                    
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                      trackOutlineWidth: MaterialStatePropertyAll(1),
                      activeTrackColor: Colors.white,
                      activeColor: Colors.blue,
                      value: isActive,
                      onChanged: (lamp) {
                        setState(() {
                          isActive = !isActive;
                        });
                      }),
                ],
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    color: isActive ? Colors.white : Colors.grey,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  widget.subString,
                  style: TextStyle(
                    color: isActive ? Colors.white : Colors.grey,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
