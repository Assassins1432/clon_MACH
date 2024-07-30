// lib/src/presentation/screens/card/card_screen.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards'),
      ),
      body: const Center(
        child: Text('Card Screen'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card, color: Colors.black),
            label: 'Cards',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up, color: Colors.black),
            label: 'Investments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code, color: Colors.black),
            label: 'QR',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt, color: Colors.black),
            label: 'Transactions',
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              context.go('/');
              break;
            case 1:
              context.go('/cards');
              break;
            case 2:
              context.go('/investments');
              break;
            case 3:
              context.go('/qr');
              break;
            case 4:
              context.go('/transactions');
              break;
          }
        },
      ),
    );
  }
}
