import 'package:ecom_ui/services/api_service.dart';
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
              child: CircleAvatar(
                backgroundImage: NetworkImage(ApiService.categoriesList[index]['image'].toString())
              ),
            );
          }),
    );
  }
}
