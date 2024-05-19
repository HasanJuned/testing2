import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing2/presentation/ui/screens/auth/login_screen.dart';
import 'package:testing2/presentation/ui/screens/home_screen.dart';
import 'package:testing2/presentation/ui/state_holders/sign_up_controller.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Get Started With', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter full name';
                    }
                    return null;
                  },
                  controller: nameController,
                  decoration: const InputDecoration(
                    hintText: 'Full Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter number';
                    }
                    return null;
                  },
                  controller: numberController,
                  decoration: const InputDecoration(
                    hintText: 'Number',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter address';
                    }
                    return null;
                  },
                  controller: addressController,
                  decoration: const InputDecoration(
                    hintText: 'Address',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter Email';
                    }
                    return null;
                  },
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter password';
                    }
                    return null;
                  },
                  controller: passwordController,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey,
                        foregroundColor: Colors.white),
                    onPressed: () async {
                      if(_formKey.currentState!.validate()){
        
                        final response = await SignUpController().singUp(nameController.text, numberController.text, addressController.text, emailController.text, passwordController.text);
                        if(response){
                          Get.to(()=> LoginScreen());
                          Get.snackbar(
                              'Registration',
                              'Successfully',
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.green
                          );
                        }else{
                          Get.snackbar(
                              'Failed',
                              'Try again',
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.redAccent
                          );
                        }
        
        
                      }
                      // Get.to(() => HomeScreen());
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
