import 'dart:async';

import 'package:ecom_ui/data/models/view_cart_model.dart';
import 'package:ecom_ui/presentation/constants/app_constants.dart';
import 'package:ecom_ui/presentation/screens/blocs/view_cart/bloc/view_cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCartPage extends StatefulWidget {
  const MyCartPage({super.key});

  @override
  State<MyCartPage> createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {
  num totalAmt = 0.0;

  @override
  void initState() {
    super.initState();
    context.read<ViewCartBloc>().add(GetViewCartEvent());
  }

  void getTotalAmountCartItems(List<ViewCartModel> allItems){
    Timer(const Duration(seconds: 1), (){
      totalAmt = 0.0;
      for(ViewCartModel eachItem in allItems){
        totalAmt = double.parse(eachItem.price!) * eachItem.quantity!;
      }
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.bgPrimaryColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 5,
        titleSpacing: 20.0,
        automaticallyImplyLeading: true,
        backgroundColor: AppConstants.bgPrimaryColor,
        title: const Text('My Cart'),
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_new_outlined)),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Container(
              padding: const EdgeInsets.only(left: 10),
              height: 120,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: Column(
                children: [
                  BlocBuilder<ViewCartBloc, ViewCartState>(
                    builder: (context, state) {
                      if (state is ViewCartLoadingState) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (state is ViewCartFailedState) {
                        return Center(child: Text(state.errorMsg));
                      }
                      if (state is ViewCartSuccessfullyState) {
                        return Expanded(
                          child: ListView.builder(
                            itemCount: state.viewCartModel.length,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color(0xff0f3f3f3),
                                    ),
                                    child: Image.network(state.viewCartModel[index].image.toString()),
                                  ),
                                  SizedBox(
                                    width: 300,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(state.viewCartModel[index].name.toString().toUpperCase(), style: const TextStyle(fontSize: 20)),
                                              Icon(Icons.delete_outline_outlined, color: Colors.red[300]),
                                            ],
                                          ),
                                          Text(state.viewCartModel[index].name.toString()),
                                          const SizedBox(height: 10),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('\$ ${state.viewCartModel[index].price.toString()}', style: const TextStyle(fontWeight: FontWeight.bold)),
                                              Container(
                                                height: 30,
                                                width: 100,
                                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(21), color: AppConstants.bgPrimaryColor, border: Border.all(width: 1, color: AppConstants.bgPrimaryColor)),
                                                child: const Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    Text('-'),
                                                    Text('1'),
                                                    Text('+'),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              );
                            },
                          ),
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 300,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(45),
                  topRight: Radius.circular(45),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(21),
                        color: AppConstants.bgPrimaryColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Enter Discount Coupon', style: TextStyle(color: Colors.grey[600], fontSize: 13)),
                            const Text('Apply', style: TextStyle(color: AppConstants.buttonColor, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Subtotal', style: TextStyle(color: Colors.grey[600], fontSize: 15)),
                            Text('\$$totalAmt', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Divider(thickness: 2, indent: 20, endIndent: 20, color: AppConstants.bgPrimaryColor),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Total', style: TextStyle(fontSize: 15)),
                            Text('\$${totalAmt+totalAmt*0.1}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  BlocListener<ViewCartBloc, ViewCartState>(
                    listener: (context, state) {
                      if (state is ViewCartLoadingState) {
                        const Center(child: CircularProgressIndicator());
                      }
                      if (state is ViewCartFailedState) {
                        const Center(child: Text('No Cart'));
                      }
                      if (state is ViewCartSuccessfullyState) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Checkout Successfully')));
                      }
                    },
                    child: Container(
                      height: 50,
                      width: 300,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(40), color: AppConstants.buttonColor),
                      child: Center(child: InkWell(
                        onTap: () {

                        },
                        child: const Text('Checkout', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)))),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
