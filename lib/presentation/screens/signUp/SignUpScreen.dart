import 'package:flutter/material.dart';
import 'package:nawel/app/app_colors.dart';
import 'package:nawel/presentation/screens/widgets/custom_input_field.dart';
import 'package:nawel/presentation/screens/widgets/primary_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nawel/presentation/bloc/logic/signup.dart';
import 'package:nawel/presentation/bloc/events/signup.dart';
import 'package:nawel/presentation/bloc/state/signup.dart';
import 'package:nawel/app/di.dart';
import 'package:nawel/app/error_handler.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return BlocProvider.value(
      value: signUpBloc, // Provided from DI
      child: BlocListener<SignUpBloc, SignUpState>(
        listener: (context, state) {
          if (state.isSuccess) {
            // Navigate to login or show success
            Navigator.pushReplacementNamed(context, '/login');
          } else if (state.error != null) {
            ErrorHandler.showError(context, state.error);
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.backgroundWhite,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: screenHeight * 0.1),
                    Image.asset('assets/images/nawel.png'),
                    SizedBox(height: screenHeight * 0.05),
                    CustomInputField(
                      hintText: 'Email',
                      prefixIcon: Icons.email,
                      controller: _emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return 'Enter email';
                        if (!value.contains('@')) return 'Invalid email';
                        return null;
                      },
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    CustomInputField(
                      hintText: 'Password',
                      prefixIcon: Icons.lock,
                      obscureText: true,
                      controller: _passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return 'Enter password';
                        if (value.length < 6) return 'Password too short';
                        return null;
                      },
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    CustomInputField(
                      hintText: 'Confirm Password',
                      prefixIcon: Icons.lock,
                      obscureText: true,
                      controller: _confirmPasswordController,
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return 'Confirm your password';
                        if (value != _passwordController.text)
                          return 'Passwords do not match';
                        return null;
                      },
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    BlocBuilder<SignUpBloc, SignUpState>(
                      builder: (context, state) {
                        return PrimaryButton(
                          text: state.isLoading ? 'Signing Up...' : 'Sign Up',
                          onPressed:
                              state.isLoading
                                  ? () {}
                                  : () {
                                    if (_formKey.currentState!.validate()) {
                                      context.read<SignUpBloc>().add(
                                        SignUpRequested(
                                          email: _emailController.text.trim(),
                                          password: _passwordController.text,
                                        ),
                                      );
                                    }
                                  },
                        );
                      },
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: const Text('Already have an account? Log in'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
