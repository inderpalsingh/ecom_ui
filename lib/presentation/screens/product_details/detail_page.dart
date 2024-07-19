import 'package:ecom_ui/data/models/products_model.dart';
import 'package:ecom_ui/presentation/screens/blocs/cart/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailPage extends StatefulWidget {
  Products products;

  ProductDetailPage({super.key, required this.products});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int qty = 1;

  @override
  Widget build(BuildContext context) {
    // print('currentItem ==> ${mProdId}');

    return Scaffold(
      backgroundColor: Colors.white70,
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * .06),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const Icon(Icons.arrow_back_ios))),
                const Row(
                  children: [
                    CircleAvatar(radius: 20, backgroundColor: Colors.white, child: Icon(Icons.share_rounded)),
                    SizedBox(width: 10),
                    CircleAvatar(radius: 20, backgroundColor: Colors.white, child: Icon(Icons.favorite_outline_outlined)),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * .4,
            child: Image.network(widget.products.image.toString()),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 20, left: 20),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .4,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(margin: const EdgeInsets.only(right: 190), child: Text(widget.products.name.toString(), style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
                  const SizedBox(height: 10),
                  Container(padding: const EdgeInsets.only(right: 345), child: Text('\$${widget.products.price.toString()}', style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold))),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 65,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.orange,
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                          margin: const EdgeInsets.only(right: 10),
                          child: const Text('Seller: Tariqul isalm'),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    margin: const EdgeInsets.only(right: 355),
                    child: const Text('Color', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 1),
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
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(color: Colors.orange, borderRadius: BorderRadius.circular(21)),
                          child: const Text('Description'),
                        ),
                        const Text('Specifications'),
                        Container(
                          padding: const EdgeInsets.only(right: 20),
                          child: const Text('Reviews'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Stack(
                    children: [
                      const Text('Ipsum ea nulla tempor Amet duis elit ad elit ipsum ex aliqua ad eu. Magna pariatur ullamco id ex pariatur. cupidatat ipsum non ea. Consectetur est amet esse incididunt magna cillum quis. Sint aliquip aute cupidatat officia aute consectetur velit nisi. Pariatur deserunt nisi fugiat cupidatat nulla ea laboris sint. Fugiat ullamco aute eiusmod incididunt exercitation cillum.'),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          height: MediaQuery.of(context).size.height * .07,
                          width: MediaQuery.of(context).size.height * .4,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.black),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 40,
                                  width: 130,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(21), border: Border.all(width: 1, color: Colors.white), color: Colors.transparent),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InkWell(
                                          onTap: () {
                                            if (qty > 1) {
                                              qty--;
                                              setState(() {});
                                            }
                                          },
                                          child: const Text('-', style: TextStyle(color: Colors.white, fontSize: 20))),
                                      Text('$qty', style: const TextStyle(color: Colors.white, fontSize: 20)),
                                      InkWell(
                                          onTap: () {
                                            qty++;
                                            setState(() {});
                                          },
                                          child: const Text('+', style: TextStyle(color: Colors.white, fontSize: 20))),
                                    ],
                                  ),
                                ),
                                BlocListener<CartBloc, CartState>(
                                  listener: (_, state) {
                                    if (state is CartLoadingState) {
                                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Adding to cart ... ')));

                                      setState(() {});
                                    }
                                    if (state is CartFailedState) {
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMsg)));
                                      setState(() {});
                                    }
                                    if (state is CartSuccessfullState) {
                                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Added to cart Successfully')));

                                      setState(() {});
                                    }
                                  },
                                  child: Container(
                                    height: 55,
                                    width: 180,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(21),
                                      color: const Color(0xff0ff5b0f),
                                    ),
                                    child: Center(
                                        child: InkWell(
                                            onTap: () {
                                              context.read<CartBloc>().add(AddToCartEvent(productId: int.parse(widget.products.id.toString()), qty: qty));
                                            },
                                            child: const Text('Add to Cart', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)))),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
