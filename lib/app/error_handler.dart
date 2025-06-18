import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

class ErrorHandler {
  static String getFriendlyMessage(dynamic error) {
    // Debug: Print error type for troubleshooting
    print('Error type: ${error.runtimeType}');
    print('Error: $error');

    if (error is FirebaseAuthException) {
      switch (error.code) {
        case 'user-not-found':
          return 'No user found for that email.';
        case 'wrong-password':
          return 'Incorrect password. Please try again.';
        case 'invalid-email':
          return 'Please enter a valid email address.';
        case 'user-disabled':
          return 'This account has been disabled.';
        case 'too-many-requests':
          return 'Too many failed attempts. Please try again later.';
        case 'operation-not-allowed':
          return 'Email/password sign in is not enabled.';
        case 'network-request-failed':
          return 'Network error. Please check your connection.';
        case 'invalid-credential':
          return 'Invalid email or password.';
        case 'account-exists-with-different-credential':
          return 'An account already exists with this email.';
        case 'weak-password':
          return 'Password is too weak. Please choose a stronger password.';
        case 'email-already-in-use':
          return 'An account already exists with this email.';
        default:
          return 'Authentication error: ${error.message ?? 'Please try again.'}';
      }
    } else if (error is TimeoutException) {
      return 'The request timed out. Please try again.';
    } else if (error is Exception) {
      return 'Something went wrong. Please try again.';
    } else if (error is String) {
      // Handle string errors (fallback)
      if (error.contains('user-not-found')) {
        return 'No user found for that email.';
      } else if (error.contains('wrong-password')) {
        return 'Incorrect password. Please try again.';
      } else if (error.contains('invalid-email')) {
        return 'Please enter a valid email address.';
      } else if (error.contains('network')) {
        return 'Network error. Please check your connection.';
      }
      return 'An error occurred: $error';
    } else {
      return 'An unexpected error occurred.';
    }
  }

  static void showError(BuildContext context, dynamic error) {
    final message = getFriendlyMessage(error);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 4),
      ),
    );
  }
}
