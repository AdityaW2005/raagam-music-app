import 'package:client/features/auth/view/widgets/auth_gradient_button.dart';
import 'package:client/features/auth/view/widgets/custom_field.dart';
import 'package:flutter/material.dart';
import 'package:client/core/theme/app_palette.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
    formKey.currentState!.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Raagam',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Pallete.gradient2,
                ),
              ),
              const SizedBox(height: 30),
              CustomField(hintText: 'Email', controller: emailController),
              const SizedBox(height: 15),
              CustomField(
                hintText: 'Password',
                controller: passwordController,
                obscureText: true,
              ),
              const SizedBox(height: 15),
              AuthGradientButton(buttonText: 'Sign In', onTap: () {}),
              const SizedBox(height: 15),
              RichText(
                text: TextSpan(
                  text: "Don't have an account ?",
                  style: Theme.of(context).textTheme.titleMedium,
                  children: [
                    TextSpan(
                      text: ' Sign Up',
                      style: const TextStyle(
                        color: Pallete.gradient2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
