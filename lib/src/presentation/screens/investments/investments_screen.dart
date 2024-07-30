// lib/src/presentation/screens/card/card_screen.dart
import 'package:flutter/material.dart';

class InvestmentsScreen extends StatelessWidget {
  const InvestmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards'),
      ),
      body: const Center(
        child: Text('Card Screen'),
      ),
    );
  }
}
