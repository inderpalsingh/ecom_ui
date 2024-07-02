import 'package:ecom_ui/data/repository/user_repository.dart';
import 'package:ecom_ui/presentation/screens/blocs/login/bloc/login_bloc.dart';
import 'package:ecom_ui/data/remote/remote_api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ecom_ui/presentation/screens/login/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => LoginBloc(userRepository: UserRepository(remoteApiService: RemoteApiService())),
      child: const MyApp(),
    ),
  );
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
      home: const LoginPage(),
    );
  }
}
