import 'package:flutter/material.dart';
import 'package:nawel/presentation/screens/widgets/custom_input_field.dart';
import 'package:nawel/presentation/screens/widgets/primary_button.dart';
import 'package:nawel/app/app_colors.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
                // Logo
                Image.asset(
                  'assets/images/nawel.png',
                  fit: BoxFit.contain,
                  height: screenHeight * 0.4,
                ),
                SizedBox(height: screenHeight * 0.05),
                // Email Input Field
                CustomInputField(
                  hintText: 'mail',
                  prefixIcon: Icons.mail_outline,
                ),
                SizedBox(height: screenHeight * 0.02),
                // Password Input Field
                CustomInputField(
                  hintText: 'password',
                  prefixIcon: Icons.lock_outline,
                  obscureText: true,
                ),
                SizedBox(height: screenHeight * 0.02),
                // Confirm Password Input Field
                CustomInputField(
                  hintText: 'password',
                  prefixIcon: Icons.lock_outline,
                  obscureText: true,
                ),
                SizedBox(height: screenHeight * 0.03),
                // Sign Up Button
                PrimaryButton(
                  text: 'Sign up',
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                ),
                SizedBox(height: screenHeight * 0.02),
                // Create an account button (or navigate to Login)
                TextButton(
                  onPressed: () {
                    // TODO: Navigate to login screen or handle account creation
                  },
                  child: const Text(
                    'Already have an account? Log in',
                    style: TextStyle(color: AppColors.blueText, fontSize: 16.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
