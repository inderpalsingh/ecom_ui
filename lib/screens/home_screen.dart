import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      
                    ),
                    Image.asset('assets/icons/fourdots_80930.png',height: 30,width: 30)
                  ],
                )
                
            
              ],
            ),
          )
        ],
      ),
    );
  }
}