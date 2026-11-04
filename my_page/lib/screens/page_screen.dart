import 'package:flutter/material.dart';

class PageScreen extends StatelessWidget {
  const PageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Իմ էջը'),
      ),
      body: const Center(
        child: const Text('«Բարև, ես Դավիթն եմ»',
        style: const TextStyle(
          fontSize: 24,
        ),
        ),
      ),
    );
  }
}