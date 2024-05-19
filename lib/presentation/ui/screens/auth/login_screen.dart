import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing2/presentation/ui/screens/auth/sign_up_screen.dart';
import 'package:testing2/presentation/ui/screens/home_screen.dart';
import 'package:testing2/presentation/ui/state_holders/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController numberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                    foregroundColor: Colors.white
                  ),
                  onPressed: () async{
                    if(_formKey.currentState!.validate()){
                      final response = await LoginController().login(numberController.text, passwordController.text);
                      if(response){
                        Get.to(()=> HomeScreen());
                        Get.snackbar(
                            'Login',
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


                  },
                  child: const Text('Login', style: TextStyle(fontSize: 18),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
