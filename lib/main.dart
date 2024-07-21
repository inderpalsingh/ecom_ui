import 'package:ecom_ui/data/remote/cart_api_service.dart';
import 'package:ecom_ui/data/remote/categories_api_service.dart';
import 'package:ecom_ui/data/remote/product_api_service.dart';
import 'package:ecom_ui/data/remote/signup_api_service.dart';
import 'package:ecom_ui/data/remote/view_cart_api_service.dart';
import 'package:ecom_ui/data/repository/cart_repository.dart';
import 'package:ecom_ui/data/repository/categories_repository.dart';
import 'package:ecom_ui/data/repository/products_repository.dart';
import 'package:ecom_ui/data/repository/signup_repository.dart';
import 'package:ecom_ui/data/repository/user_repository.dart';
import 'package:ecom_ui/data/repository/view_cart_repository.dart';
import 'package:ecom_ui/presentation/screens/blocs/cart/bloc/cart_bloc.dart';
import 'package:ecom_ui/presentation/screens/blocs/categories/bloc/categories_bloc.dart';
import 'package:ecom_ui/presentation/screens/blocs/login/bloc/login_bloc.dart';
import 'package:ecom_ui/data/remote/user_api_service.dart';
import 'package:ecom_ui/presentation/screens/blocs/products/bloc/products_bloc.dart';
import 'package:ecom_ui/presentation/screens/blocs/signup/signup_bloc.dart';
import 'package:ecom_ui/presentation/screens/blocs/view_cart/bloc/view_cart_bloc.dart';
import 'package:ecom_ui/presentation/screens/cart/cart_page.dart';
import 'package:ecom_ui/presentation/screens/splash/splash_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MultiBlocListener(listeners: [
    /// user
    BlocProvider(create: (context) => LoginBloc(userRepository: UserRepository(remoteApiService: RemoteApiService()))),
    /// categories
    BlocProvider(create: (context) => CategoriesBloc(categoriesRepository: CategoriesRepository(categoriesApiService: CategoriesApiService()))),
    /// products
    BlocProvider(create: (context) => ProductsBloc(productsRepository: ProductsRepository(productApiService: ProductApiService()))),
    /// signup
    BlocProvider(create: (context) => SignupBloc(registerRepository: RegisterRepository(signupApiService: RegisterApiService()))),
    /// cart
    BlocProvider(create: (context) => CartBloc(cartRepository: CartRepository(cartApiService: CartApiService()))),
    /// view Cart
    BlocProvider(create: (context) => ViewCartBloc(viewCartRepository: ViewCartRepository(viewCartApiService: ViewCartApiService()))),

  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecom UI',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      home: const MyCartPage(),
    );
  }
}
