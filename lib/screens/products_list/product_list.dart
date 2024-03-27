import 'package:ecom_ui/services/api_service.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

   
  
  
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: GridView.builder(
          itemCount: ApiService.categoriesList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            childAspectRatio: 1,
            mainAxisSpacing: 15,
          ),
          itemBuilder: (context, index) {
            return Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(21),
                        color: Colors.grey.shade200,
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Image.network(ApiService.categoriesList[index]['image'].toString(),height: 80,width: 80),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(ApiService.categoriesList[index]['title'].toString(),style: TextStyle(fontSize: 12)),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('\$${ApiService.categoriesList[index]['price']}',style: TextStyle(fontSize: 12)),
                          SizedBox(
                            height: 15,
                            child: CircleAvatar(
                              backgroundColor: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                            child: CircleAvatar(
                              backgroundColor: Colors.blue,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                            child: CircleAvatar(
                              backgroundColor: Colors.red,
                            ),
                          ),
                        ],
                      ),
                
                     
                      
                    ],
                  )
                ),
                Container(
                  margin: EdgeInsets.only(left: 150),
                  height: 35,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomLeft: Radius.circular(10),
                    )
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 150),
                  height: 35,
                  width: 50,
                  child: Icon(Icons.monitor_heart_outlined),
                  
                ),
                
              ],
            );
          },
        ),
      ),
    );
  }
}
