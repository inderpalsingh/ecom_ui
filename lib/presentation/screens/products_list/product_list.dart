
import 'package:ecom_ui/data/models/products_model.dart';
import 'package:ecom_ui/presentation/screens/blocs/products/bloc/products_bloc.dart';
import 'package:ecom_ui/presentation/screens/product_details/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});


  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  ProductModel? myData;

  @override
  void initState() {
    super.initState();
    context.read<ProductsBloc>().add(ProductsInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {

          if(state is ProductsLoadingState){
            return const Center(child: CircularProgressIndicator());
          }

          if(state is ProductsFailedState){
            return const Center(child: Text('Failed: No Products'));
          }

          if( state is ProductsSuccessState){

            ProductModel myData = state.productModel;

          return  Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GridView.builder(
              padding: EdgeInsets.zero,
              itemCount: myData.data.length,
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
                            InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductDetailPage(
                                  products: myData.data[index]
                                  // mProdId: int.parse(myData.data[index].id.toString()),
                                  // image: myData.data[index].image.toString(),
                                  // name: myData.data[index].name.toString(),
                                  // price: myData.data[index].price.toString(),
                                )));
                              },
                              child: Image.network(myData.data[index].image.toString(), height: 80, width: 80)),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(myData.data[index].name.toString(), style: const TextStyle(fontSize: 15))),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('\$${myData.data[index].price.toString()}', style: const TextStyle(fontSize: 15)),
                                  const Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 6,
                                        backgroundColor: Colors.black,
                                      ),
                                      CircleAvatar(
                                        radius: 6,
                                        backgroundColor: Colors.blue,
                                      ),
                                      CircleAvatar(
                                        radius: 6,
                                        backgroundColor: Colors.red,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                    Container(
                      margin: const EdgeInsets.only(left: 150),
                      height: 35,
                      width: 50,
                      decoration: const BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(10),
                          )),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 157, top: 2),
                      child: Image.asset(
                        'assets/icons/empty-heart.png',
                        width: 20,
                        height: 30,
                        color: Colors.white,
                      ),
                    ),
                  ],
                );
              },
            ),
          );



          }

          return const SizedBox();


        },
      ),
    );
  }
}
