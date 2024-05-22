import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoomsWidget extends StatefulWidget {
  final String title;
  final String photo;
  final int numberOfDevices;
  final String typeOfRoom;
  const RoomsWidget(
      {super.key,
      required this.title,
      required this.photo,
      required this.numberOfDevices,
      required this.typeOfRoom});

  @override
  State<RoomsWidget> createState() => _RoomsWidgetState();
}

class _RoomsWidgetState extends State<RoomsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //     border: Border.all(color: Colors.blue),
      //     borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
              child: Image.asset(
            widget.photo,
          )),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.title),
              Text('devices: ${widget.numberOfDevices}')
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          Text('type of room: ${widget.typeOfRoom}'),
          
        ],
      ),
    );
  }
}
