import 'package:ecom_ui/presentation/screens/blocs/login/bloc/login_bloc.dart';
import 'package:ecom_ui/presentation/screens/index_screen.dart';
import 'package:ecom_ui/presentation/screens/signup/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {

    final formKey = GlobalKey<FormState>();
    String errorValue ='';

    TextEditingController userController = TextEditingController();
    TextEditingController passController = TextEditingController();

    bool checkEmailCorrect(String email){
      return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
    }

    return Scaffold(
        appBar: AppBar(title: const Text('Login')),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter email';
                    } else if(!checkEmailCorrect(value)){
                      return 'Enter correct email';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      if (value.contains(' ') || !checkEmailCorrect(value)) {
                      errorValue='Email is not valid';
                      }else{
                        errorValue='';
                      }
                    });

                  },

                  controller: userController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    errorText: errorValue.isEmpty?null: 'Enter correct email !!',
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
                  keyboardType: TextInputType.text,
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
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const IndexScreen()));
                      }
                    },
                    child: Column(

                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                                onPressed: () {
                                  if (userController.text.isNotEmpty && passController.text.isNotEmpty) {
                                    context.read<LoginBloc>().add(UserLoginEvent(
                                          username: userController.text.trim().toString(),
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
                                child: const Text('Cancel', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)))
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Don\'t have an account? ',),
                            InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> SignupPage()));
                              },
                                child: const Text('SignUp',style: TextStyle(color: Colors.redAccent,fontWeight: FontWeight.bold)))
                          ],
                        )
                      ],
                    )),
              ],
            ),
          ),
        ));
  }
}
