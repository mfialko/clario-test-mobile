import 'package:flutter/material.dart';

class PasswordRequirements extends StatelessWidget {
  final String password;

  const PasswordRequirements({super.key, required this.password});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildRequirement('8 characters or more',
                  password.isEmpty || password.length >= 8),
              _buildRequirement('Uppercase and lowercase letters',
                  password.isEmpty || _hasUppercaseAndLowercase(password)),
              _buildRequirement('At least one digit',
                  password.isEmpty || _hasDigit(password)),
            ],
          ),
        ),
      ),
    );
  }

  bool _hasUppercaseAndLowercase(String password) {
    return password.contains(RegExp(r'[A-Z]')) &&
        password.contains(RegExp(r'[a-z]'));
  }

  bool _hasDigit(String password) {
    return password
        .contains(RegExp(r'\d')); // This correctly checks for any digit
  }

  Widget _buildRequirement(String text, bool isMet) {
    Color textColor;
    if (password.isEmpty) {
      textColor = Colors.grey; // Grey when no password
    } else {
      textColor = isMet ? Colors.green : Colors.red; // Green if met, red if not
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 13,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
