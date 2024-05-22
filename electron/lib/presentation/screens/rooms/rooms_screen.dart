import 'package:electron/presentation/screens/devices/add_dialog.dart';
import 'package:electron/presentation/utils/assets.dart';
import 'package:electron/presentation/widgets/rooms_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoomsScreen extends StatefulWidget {
  const RoomsScreen({super.key});

  @override
  State<RoomsScreen> createState() => _RoomsScreenState();
}

class _RoomsScreenState extends State<RoomsScreen> {
  var rooms = ['My room', 'Kitchen', 'Bathroom'];
  var numberOfDevices = [6, 1, 5];
  var roomsPhoto = [
    ElectronAssets.kitchen,
    ElectronAssets.bath,
    ElectronAssets.bedroom
  ];
  var typeOfRooms = ['kitchen', 'bathroom', 'bedroom'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: rooms.length,
              itemBuilder: (BuildContext context, int index) {
                return RoomsWidget(
                  numberOfDevices: numberOfDevices[index],
                  photo: roomsPhoto[index],
                  title: rooms[index],
                  typeOfRoom: typeOfRooms[index],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(height: 20, thickness: 1,);
              },
            ),
          ),
          ElevatedButton( 
            onPressed: () {
              showDialog(context: context, builder: (context) => AddDialog());
            },
            child: Text(
              '+ ADD A ROOM',
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
