import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  int? productIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Column(
        children: [
          const SizedBox(height: 50),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                    radius: 20,backgroundColor: Colors.white,
                    child: Icon(Icons.arrow_back_ios)),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.share_rounded)
                    ),
                    SizedBox(width: 10),
                    CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.favorite_outline_outlined)
                    ),
                  ],
                )
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}
