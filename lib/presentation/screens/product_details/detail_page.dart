import 'package:ecom_ui/data/models/products_model.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  ProductModel productModel;
  ProductDetailPage({super.key,  required this.productModel});


  @override
  Widget build(BuildContext context) {
    print('currentItem ==> ${productModel.data!.length}');

    return Scaffold(
      backgroundColor: Colors.white70,
      body: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height *.06),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                      radius: 20,backgroundColor: Colors.white,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const Icon(Icons.arrow_back_ios))),
                  const Row(
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
            Container(
              width: double.infinity,
              height: 300,
              child: Image.asset('assets/images/vecteezy_apple-airpods-ai-generative_26782383.png'),
            ),
            Container(
              padding: const EdgeInsets.only(top: 20, left: 20),
              width: double.infinity,
              height: 600,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20),
                ),
              ),
              // child: const Text('Wireless Headphone',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 190),
                      child: const Text('Wireless Headphone',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold))
                  ),
                  Container(
                      padding: const EdgeInsets.only(right: 345),
                      child: const Text('\$520.00',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold))
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 55,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.orange,
                          ),
                          child: const Row(
                            children: [
                              Icon(Icons.star_border_outlined),
                              Text(' 4.8'),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 100),
                          child: const Row(
                            children: [
                              Text('(320 Review)'),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 15),
                          child: const Text('Seller: Tariqul isalm'),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    margin: const EdgeInsets.only(right: 355),
                    child: const Text('Color',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: 15,
                        ),
                        const SizedBox(width: 10),
                        const CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 15,
                        ),
                        const SizedBox(width: 10),
                        const CircleAvatar(
                          backgroundColor: Colors.blueAccent,
                          radius: 15,
                        ),
                        const SizedBox(width: 10),
                        const CircleAvatar(
                          backgroundColor: Colors.brown,
                          radius: 15,
                        ),
                        const SizedBox(width: 10),
                        CircleAvatar(
                          backgroundColor: Colors.grey.shade600,
                          radius: 15,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(21)
                          ),
                          child: const Text('Description'),
                        ),
                        const Text('Specifications'),
                        Container(
                          padding: const EdgeInsets.only(right: 20),
                          child: const Text('Reviews'),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}
