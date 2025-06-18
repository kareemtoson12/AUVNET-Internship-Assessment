import 'package:flutter/material.dart';
import 'package:nawel/app/app_colors.dart';
import 'package:nawel/presentation/screens/widgets/custom_input_field.dart';
import 'package:nawel/presentation/screens/widgets/primary_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nawel/presentation/bloc/logic/auth.dart';
import 'package:nawel/presentation/bloc/events/auth.dart';
import 'package:nawel/presentation/bloc/state/auth.dart';
import 'package:nawel/app/di.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return BlocProvider.value(
      value: authBloc, // Provided from DI
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.isSuccess) {
            // Navigate to home or show success
            Navigator.pushReplacementNamed(context, '/home');
          } else if (state.error != null) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.error!)));
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.backgroundWhite,
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/images/nawel.png',
                        fit: BoxFit.contain,
                        height: screenHeight * 0.4,
                      ),
                      SizedBox(height: screenHeight * 0.05),
                      CustomInputField(
                        hintText: 'Email',
                        prefixIcon: Icons.email,
                        controller: _emailController,
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      CustomInputField(
                        hintText: 'Password',
                        prefixIcon: Icons.lock,
                        obscureText: true,
                        controller: _passwordController,
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {
                          return PrimaryButton(
                            text: state.isLoading ? 'Logging in...' : 'Log In',
                            onPressed:
                                state.isLoading
                                    ? () {}
                                    : () {
                                      context.read<AuthBloc>().add(
                                        LoginRequested(
                                          email: _emailController.text.trim(),
                                          password: _passwordController.text,
                                        ),
                                      );
                                    },
                          );
                        },
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/signup');
                        },
                        child: const Text('Don\'t have an account? Sign up'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
