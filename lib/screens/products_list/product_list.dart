import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemBuilder: (context,index){
            return Container(
              
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                
              ),
            );
          }),
    );
  }
}
