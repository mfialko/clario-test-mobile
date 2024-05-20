import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widgets/auth_paper.dart';
import 'widgets/sign_up_form.dart';
import 'widgets/validation_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widgets/otp_input_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ValidationModel(),
      child: MaterialApp(
        title: 'Your App Title',
        theme: ThemeData(
          textTheme: GoogleFonts.interTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home: const SignUpOrOtpPage(), // Start with SignUpOrOtpPage
      ),
    );
  }
}

class SignUpOrOtpPage extends StatelessWidget {
  const SignUpOrOtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthPaper(
        child: SignUpForm(
          onSignUpSuccess: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const OtpInputPage()),
            );
          },
        ),
      ),
    );
  }
}
