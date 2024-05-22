import 'package:flutter/material.dart';

class DevicesScreen extends StatelessWidget {

   List<String> rooms = ['Living Room', 'Bathroom', 'Bedroom'];
   DevicesScreen({super.key , required this.rooms});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Text(
        'text'
      ),
    );
  }
}
