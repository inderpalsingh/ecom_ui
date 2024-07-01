import 'package:ecom_ui/presentation/screens/blocs/login/bloc/login_bloc.dart';
import 'package:ecom_ui/presentation/screens/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController userController = TextEditingController();
    TextEditingController passController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: userController,
                    decoration: InputDecoration(
                        hintText: 'Email',
                        prefixIcon: const Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: passController,
                    decoration: InputDecoration(
                        hintText: 'Password',
                        prefixIcon: const Icon(Icons.lock_open_rounded),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                          onPressed: () {
                            if(userController.text.isNotEmpty && passController.text.isNotEmpty){
                              context.read<LoginBloc>().add(UserLoginEvent(username: userController.text, password: passController.text));

                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const SplashPage()));
                            } else{
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Worng credentials !!'),
                                behavior: SnackBarBehavior.floating,
                                ),

                              );
                            }

                          },
                          child: const Text('Login', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                          onPressed: () {
                            // Navigator.pop(context);
                          },
                          child: const Text('Cancel', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                    ],
                  )
                ],
              ),
            ));
          }

        }
