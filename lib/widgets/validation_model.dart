import 'package:flutter/material.dart';

class ValidationModel with ChangeNotifier {
  String? emailError;
  String? passwordError;

  String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      emailError = 'Email is required';
    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
      emailError = 'Invalid email address';
    } else {
      emailError = null;
    }
    notifyListeners();
    return emailError;
  }

  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      passwordError = 'Password is required';
    } else if (password.length < 8) {
      passwordError = 'Password must be at least 8 characters long';
    } else if (!RegExp(r'^(?=.*[A-Z])(?=.*\d)').hasMatch(password)) {
      passwordError =
          'Password must contain at least one uppercase letter and one number';
    } else {
      passwordError = null;
    }
    notifyListeners();
    return passwordError;
  }
}
