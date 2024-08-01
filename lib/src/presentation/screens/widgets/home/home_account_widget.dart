// widgets/account_widget.dart
import 'package:app_replica_mach/src/presentation/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountWidget extends ConsumerWidget {
  const AccountWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeMode currentThemeMode = ref.watch(themeNotifierProvider);

    return Container(
      width: MediaQuery.of(context).size.width * 0.1,
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: currentThemeMode == ThemeMode.light
            ? Colors.white
            : const Color(0xFF6300EC),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.account_circle),
              SizedBox(width: 5),
              Text(
                'Mi cuenta mach',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            'Saldo disponible',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Icon(Icons.attach_money, color: Colors.green),
              Text(
                '1.000',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Icon(Icons.more_vert),
          ),
        ],
      ),
    );
  }
}
