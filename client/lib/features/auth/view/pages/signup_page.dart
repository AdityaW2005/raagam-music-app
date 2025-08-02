import 'package:client/features/auth/view/widgets/auth_gradient_button.dart';
import 'package:client/features/auth/view/widgets/custom_field.dart';
import 'package:flutter/material.dart';
import 'package:client/core/theme/app_palette.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
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
            CustomField(hintText: 'Name'),
            const SizedBox(height: 15),
            CustomField(hintText: 'Email'),
            const SizedBox(height: 15),
            CustomField(hintText: 'Password'),
            const SizedBox(height: 15),
            AuthGradientButton(),
            const SizedBox(height: 15),
            RichText(
              text: TextSpan(
                text: 'Already have an account ?'
              ),
            ),
          ],
        ),
      ),
    );
  }
}