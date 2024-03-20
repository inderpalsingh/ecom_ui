import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               CircleAvatar(
                 radius: 20,
                 backgroundColor: Colors.grey.shade300,
                 child: Image.asset('assets/icons/fourdots_80930.png', height: 15,width: 15),
               ),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey.shade300,
                  child: Image.asset('assets/icons/bell-notification-notifications.png', height: 15,width: 15),
                ),
            
              ],
            ),
          ),
          Text('data')
        ],
      ),
    );
  }
}