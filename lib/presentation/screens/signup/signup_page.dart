
import 'package:ecom_ui/presentation/screens/blocs/signup/signup_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../index_screen.dart';

class SignupPage extends StatefulWidget {

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final formKey = GlobalKey<FormState>();

  String errorValue ='';

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passController = TextEditingController();

  bool checkEmailCorrect(String email){
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Sign Up')),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// Name
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '*Required Field';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                  controller: nameController,
                  decoration: InputDecoration(
                      hintText: 'Full Name',
                      prefixIcon: const Icon(Icons.lock_open_rounded),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
                const SizedBox(height: 20),
                /// Email
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

                  controller: emailController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      errorText: errorValue.isEmpty?null: 'Enter correct email !!',
                      hintText: 'Email',
                      prefixIcon: const Icon(Icons.email_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),

                ),
                const SizedBox(height: 20),
                /// Mobile
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Mobile';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      if (value.contains(' ') || value.length<8) {
                      errorValue='Length must be 8';
                      }else{
                        errorValue='';
                      }
                    });

                  },

                  controller: mobileController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    errorText: errorValue.isEmpty?null: 'Enter Mobile number !!',
                      hintText: 'Mobile',
                      prefixIcon: const Icon(Icons.mobile_friendly_outlined),
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
                  onChanged: (value) {
                    setState(() {
                      if (value.contains(' ') || value.length<8) {
                      errorValue='Length must be 8';
                      }else{
                        errorValue='';
                      }
                    });

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
                BlocListener<SignupBloc, SignupState>(
                    listener: (context, state) {
                      if (state is SignupLoadingState) {
                        const Center(child: CircularProgressIndicator());
                      }
                      if (state is SignupFailedState) {

                        ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text(state.toString())));
                      }
                      if (state is SignupSuccessfulState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(backgroundColor: Colors.green,content: Text('User logged in successfully')));
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const IndexScreen()));
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                            onPressed: () {
                              if (nameController.text.isNotEmpty && passController.text.isNotEmpty && mobileController.text.isNotEmpty && emailController.text.isNotEmpty ) {
                                context.read<SignupBloc>().add(SignupInitialEvent(
                                  name: nameController.text.toString(),
                                  password: passController.text.toString(),
                                  email: emailController.text.toString(),
                                  mobile_number: mobileController.text.toString()
                                ));

                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Invalid credentials !!')));
                              }
                            },

                            child: const Text('SignUp', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Cancel', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                      ],
                    )),
              ],
            ),
          ),
        ));
  }
}
