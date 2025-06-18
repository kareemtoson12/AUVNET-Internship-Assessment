import 'package:flutter/material.dart';
import 'package:nawel/app/app_colors.dart';
import 'package:nawel/presentation/screens/widgets/custom_input_field.dart';
import 'package:nawel/presentation/screens/widgets/primary_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/nawel.png',
                  fit: BoxFit.contain,
                  height: screenHeight * 0.4,
                ),
                SizedBox(height: screenHeight * 0.05),
                CustomInputField(hintText: 'Email', prefixIcon: Icons.email),
                SizedBox(height: screenHeight * 0.02),
                CustomInputField(
                  hintText: 'Password',
                  prefixIcon: Icons.lock,
                  obscureText: true,
                ),
                SizedBox(height: screenHeight * 0.03),
                PrimaryButton(text: 'Log In', onPressed: () {}),
                SizedBox(height: screenHeight * 0.02),
                TextButton(
                  onPressed: () {
                    // Navigate to Forgot Password screen
                    Navigator.pushNamed(context, '/signup');
                  },
                  child: const Text('Don\'t have an account? Sign up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
