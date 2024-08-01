import 'package:app_replica_mach/src/presentation/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentThemeMode = ref.watch(themeNotifierProvider);

    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Theme Mode'),
            trailing: Switch(
                value: currentThemeMode == ThemeMode.dark,
                onChanged: (bool value) {
                  ref
                      .read(themeNotifierProvider.notifier)
                      .setThemeMode(value ? ThemeMode.dark : ThemeMode.light);
                }),
          )
        ],
      ),
    );
  }
}
