import 'package:flutter/material.dart';

class TopScreen extends StatelessWidget {
  const TopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
