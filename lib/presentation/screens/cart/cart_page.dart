import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0f3f3f3),
      appBar: AppBar(title: const Text('My Cart'),backgroundColor: const Color(0xff0f3f3f3),elevation: 2),
      body: Column(
        children: [
          Container(
            margin:const EdgeInsets.symmetric(horizontal: 10),
            child: const Card(

              child: CustomCart(),
            ),
          )
        ],
      ),
    );
  }


}

class CustomCart extends StatelessWidget {
  const CustomCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xff0f3f3f3)),
            borderRadius: BorderRadius.circular(21)),
          height: 100,
          child: Image.asset('assets/images/vecteezy_apple-airpods-ai-generative_26782383.png',fit: BoxFit.cover),
        ),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Headphone'),
            Text('Electronics', style: TextStyle(fontSize: 10)),
            SizedBox(height: 10),
            Text('\$79.00', style: TextStyle(fontSize: 10))
          ],
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.delete_outlined,color: Colors.redAccent,),
                const SizedBox(height: 20),
                Container(
                  width: 90,
                  height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21),
                      color: Colors.amber
                    ),
                  child: const Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(CupertinoIcons.minus),
                        SizedBox(width: 10),
                        Text('1'),
                        SizedBox(width: 10),
                        Icon(CupertinoIcons.plus),


                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )



      ],
    );
  }
}
