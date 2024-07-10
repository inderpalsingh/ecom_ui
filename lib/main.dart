import 'package:ecom_ui/data/remote/categories_api_service.dart';
import 'package:ecom_ui/data/remote/product_api_service.dart';
import 'package:ecom_ui/data/repository/categories_repository.dart';
import 'package:ecom_ui/data/repository/products_repository.dart';
import 'package:ecom_ui/data/repository/user_repository.dart';
import 'package:ecom_ui/presentation/screens/blocs/categories/bloc/categories_bloc.dart';
import 'package:ecom_ui/presentation/screens/blocs/login/bloc/login_bloc.dart';
import 'package:ecom_ui/data/remote/login_api_service.dart';
import 'package:ecom_ui/presentation/screens/blocs/products/bloc/products_bloc.dart';
import 'package:ecom_ui/presentation/screens/cart/cart_page.dart';
import 'package:ecom_ui/presentation/screens/splash/splash_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MultiBlocListener(listeners: [
    /// user
    BlocProvider(
      create: (context) => LoginBloc(userRepository: UserRepository(remoteApiService: RemoteApiService())),
    ),

    /// categories
    BlocProvider(
      create: (context) => CategoriesBloc(categoriesRepository: CategoriesRepository(categoriesApiService: CategoriesApiService())),
    ),

    /// products
    BlocProvider(
      create: (context) => ProductsBloc(productsRepository: ProductsRepository(productApiService: ProductApiService())),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecom UI',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      home: const MyCart(),
    );
  }
}
