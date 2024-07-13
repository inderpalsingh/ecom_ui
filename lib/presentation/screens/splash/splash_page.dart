import 'package:ecom_ui/presentation/screens/index_screen.dart';
import 'package:ecom_ui/presentation/screens/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    checkUserLogin();
  }


  void checkUserLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? tokenKey = prefs.getString('token');
    // String tokenKey = await TokenPrefs().getToken();
    print('tokenKey => $tokenKey');


    if(tokenKey != null){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => IndexScreen()));
    }else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
    }

  }



  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}