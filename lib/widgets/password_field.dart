import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'password_requirements.dart';
import 'validation_model.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller;

  const PasswordField({super.key, required this.controller});

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: widget.controller,
          obscureText: _isHidden,
          decoration: InputDecoration(
            labelText: 'Create your password',
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            suffixIcon: IconButton(
              icon: Icon(_isHidden ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                setState(() {
                  _isHidden = !_isHidden;
                });
              },
            ),
          ),
          validator: (value) =>
              Provider.of<ValidationModel>(context, listen: false)
                  .validatePassword(value),
          onChanged: (value) {
            setState(() {});
          },
        ),
        PasswordRequirements(password: widget.controller.text),
      ],
    );
  }
}
