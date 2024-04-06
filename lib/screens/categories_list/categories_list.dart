import 'package:ecom_ui/services/api_service.dart';
import 'package:flutter/material.dart';


class CategoriesList extends StatelessWidget {

  const CategoriesList({super.key});

  

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 120,
      child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: ApiService.categoriesList.length,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(ApiService.categoriesList[index]['image'].toString(),height: 80,width: 80,),
                  ),
                  Text(ApiService.categoriesList[index]['category'].toString(), style: TextStyle(fontSize: 12),)
                ],
              ),
            );
          }
      ),
    );
  }
}
