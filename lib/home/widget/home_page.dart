import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: const Icon(
              Icons.flutter_dash,
              size: 100,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
