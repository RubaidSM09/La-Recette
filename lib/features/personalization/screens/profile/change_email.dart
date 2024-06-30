import 'package:flutter/material.dart';

class ChangeEmailScreen extends StatelessWidget {
  const ChangeEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'EMAIL CANNOT BE CHANGED!!!',
          style: TextStyle(
            color: Color(0xFFE85A4F),
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFEAE7DC),
        elevation: 0,
      ),
    );
  }
}
