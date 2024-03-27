import 'package:ecom_ui/screens/categories_list/categories_list.dart';
import 'package:ecom_ui/screens/products_list/product_list.dart';
import 'package:ecom_ui/screens/top_screen/top_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 50),
          const TopScreen(),
          const SizedBox(height: 20),
          Container(
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              decoration: InputDecoration(
                  fillColor: Colors.grey.shade100,
                  filled: true,
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: const Icon(Icons.filter_list_outlined),
                  hintText: 'Search..',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: const BorderSide(color: Colors.blue, width: 2.0),
                  ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
                child: Image.asset('assets/images/shoe-sale-banner-vector.jpg')),
          ),
          const SizedBox(height: 20),
          const CategoriesList(),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Special For You',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600)),
                Text('See all',style: TextStyle(color: Colors.grey.shade700)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ProductListScreen()
          
        ],
      ),
    );
  }
}
