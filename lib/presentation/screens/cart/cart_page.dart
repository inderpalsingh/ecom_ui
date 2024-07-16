import 'package:ecom_ui/presentation/constants/app_constants.dart';
import 'package:flutter/material.dart';

class MyCartPage extends StatelessWidget {
  const MyCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.bgPrimaryColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 5,
        titleSpacing: 20.0,
        automaticallyImplyLeading: true,
        backgroundColor: AppConstants.bgPrimaryColor,
        title: const Text('My Cart'),
        leading: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white,
            child: Icon(Icons.arrow_back_ios_new_outlined),
          ),
        ),
      ),
      body: const Column(
        children: [],
      ),
    );
  }
}
