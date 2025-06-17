import 'package:flutter/material.dart';
import 'package:nawel/presentation/screens/widgets/custom_input_field.dart';
import 'package:nawel/presentation/screens/widgets/primary_button.dart';
import 'package:nawel/app/app_colors.dart';

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
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.1,
            ), // Responsive horizontal padding
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Logo
                Image.asset(
                  'assets/images/nawel.png',
                  fit: BoxFit.contain,
                  height: screenHeight * 0.4,
                ), // Responsive logo height

                SizedBox(height: screenHeight * 0.05), // Responsive spacing
                // Email Input Field
                CustomInputField(
                  hintText: 'mail',
                  prefixIcon: Icons.mail_outline,
                ),
                SizedBox(height: screenHeight * 0.02), // Responsive spacing
                // Password Input Field
                CustomInputField(
                  hintText: 'password',
                  prefixIcon: Icons.lock_outline,
                  obscureText: true,
                ),
                SizedBox(height: screenHeight * 0.03), // Responsive spacing
                // Log In Button
                PrimaryButton(
                  text: 'Log in',
                  onPressed: () {
                    // TODO: Implement login logic
                  },
                ),
                SizedBox(height: screenHeight * 0.02), // Responsive spacing
                // Create an account button
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  child: const Text(
                    'Create an account',
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
