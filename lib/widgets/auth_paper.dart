import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthPaper extends StatelessWidget {
  final Widget child;

  const AuthPaper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
          colors: [Color(0xFFE0EDFB), Color(0xFFF4F9FF)],
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: SvgPicture.asset(
              'assets/stars.svg',
              fit: BoxFit.fitHeight,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
