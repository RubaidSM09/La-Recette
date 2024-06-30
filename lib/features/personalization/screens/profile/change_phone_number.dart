import 'package:flutter/material.dart';

class ChangeNumberScreen extends StatelessWidget {
  const ChangeNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Change Phone Number',
          style: TextStyle(
            color: Color(0xFFE85A4F),
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFEAE7DC),
        elevation: 0,
      ),
      backgroundColor: const Color(0xFFEAE7DC),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.25),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.phone,
                      size: 30.0,
                      color: Color(0xFFE85A4F),
                    ),
                    SizedBox(width: 16.0),
                    Text(
                      'Phone Number',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFFE85A4F),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 36),
              ElevatedButton(
                onPressed: () {
                  // Add your onPressed code here!
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE85A4F), // Background color
                  foregroundColor: const Color(0xFFEAE7DC), // Text color
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 12.0),
                  textStyle: const TextStyle(
                    fontSize: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0), // Rounded corners
                  ),
                ),
                child: const Text('Update Phone Number'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
