import 'package:flutter/material.dart';
import 'package:practice/auth/service/auth_service.dart';
import 'package:practice/auth/view/register_view.dart';
import 'package:practice/view/add_data.dart';
import 'package:practice/widgets/custom_button_widget.dart';
import 'package:practice/widgets/custom_text_field_widget.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final emailContorller = TextEditingController();
  final passwordContorller = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppTextField(
                validator: (value) {
                  if (value == null) {
                    return "Please enter the value";
                  }
                  return null;
                },
                hintText: "Enter email",
                controller: emailContorller,
              ),
              const SizedBox(
                height: 20,
              ),
              AppTextField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter the value";
                  }
                  return null;
                },
                hintText: "Password",
                controller: passwordContorller,
              ),
              const SizedBox(
                height: 20,
              ),
              AppButton(
                  text: "Login",
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      await AuthService.loginUser(
                        emailContorller.text.trim(),
                        passwordContorller.text.trim(),
                      );

                      // If login is successful, navigate to the next page

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const AddData(), // Home or next page
                        ),
                      );
                    } else {
                      // Show an error message if login fails
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Login failed')),
                      );
                    }
                  }),
              const SizedBox(
                height: 20,
              ),
              AppButton(
                text: "Register",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterView(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
