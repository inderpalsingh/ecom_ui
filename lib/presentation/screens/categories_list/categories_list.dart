import 'package:ecom_ui/data/local/api_service_categories.dart';
import 'package:flutter/material.dart';

class CategoriesList extends StatefulWidget {
  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  List<Map<String, dynamic>> myData = ApiLocalService().categoriesLocalList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 120,
        child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: myData.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                        myData[index]['image'],
                        height: 80,
                        width: 80,
                      ),
                    ),
                    Text(
                      myData[index]['category'],
                      style: const TextStyle(fontSize: 12),
                    )
                  ],
                ),
              );
            }));
  }
}
