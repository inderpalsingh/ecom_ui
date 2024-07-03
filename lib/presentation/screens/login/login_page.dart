import 'package:ecom_ui/presentation/screens/blocs/login/bloc/login_bloc.dart';
import 'package:ecom_ui/presentation/screens/home_screen.dart';
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
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter email';
                  }
                  return null;
                },
                controller: userController,
                decoration: InputDecoration(
                    hintText: 'Username',
                    prefixIcon: const Icon(Icons.person_2_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              const SizedBox(height: 20),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter password';
                  }
                  return null;
                },
                controller: passController,
                decoration: InputDecoration(
                    hintText: 'Password',
                    prefixIcon: const Icon(Icons.lock_open_rounded),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              const SizedBox(height: 50),
              BlocListener<LoginBloc, LoginState>(
                  listener: (context, state) {
                    if (state is UserLoadingState) {
                      const Center(child: CircularProgressIndicator());
                    }
                    if (state is UserFailedState) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Something went wrong !!')));
                    }
                    if (state is UserSuccessState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(backgroundColor: Colors.green,content: Text('User logged in successfully')));
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                          onPressed: () {
                            if (userController.text.isNotEmpty && passController.text.isNotEmpty) {
                              context.read<LoginBloc>().add(UserLoginEvent(
                                    username: userController.text.trim().toUpperCase().toString(),
                                    password: passController.text.trim().toString(),
                                  ));

                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Invalid credentials !!')));
                            }
                          },

                          child: const Text('Login', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                          onPressed: () {
                            // Navigator.pop(context);
                          },
                          child: const Text('Cancel', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                    ],
                  )),
            ],
          ),
        ));
  }
}
