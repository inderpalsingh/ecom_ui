import 'package:ecom_ui/utils/token_shared_preferences.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  String? currentToken;

  @override
  void initState() {
    super.initState();
    getCurrentToken();

  }

  getCurrentToken()async {
    currentToken = await TokenPrefs().getToken();
    print(currentToken);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text('$currentToken')
          )
        ],
      ),
    );
  }
}