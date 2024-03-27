import 'package:ecom_ui/services/api_service.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

   
  
  
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
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
                      const SizedBox(height: 20),
                      Image.network(ApiService.categoriesList[index]['image'].toString(),height: 80,width: 80),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(ApiService.categoriesList[index]['title'].toString(),style: const TextStyle(fontSize: 12)),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('\$${ApiService.categoriesList[index]['price']}',style: const TextStyle(fontSize: 12)),
                          const SizedBox(
                            height: 15,
                            child: CircleAvatar(
                              backgroundColor: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                            child: CircleAvatar(
                              backgroundColor: Colors.blue,
                            ),
                          ),
                          const SizedBox(
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
                  margin: const EdgeInsets.only(left: 150),
                  height: 35,
                  width: 50,
                  decoration: const BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomLeft: Radius.circular(10),
                    )
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 157,top: 2),
                  child: Image.asset('assets/icons/empty-heart.png',width: 20,height: 30,color: Colors.white,),
                  
                ),
                
              ],
            );
          },
        ),
      ),
    );
  }
}
