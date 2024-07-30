// Esta sera la pantalla de Inicio. Su AppBar debe tener un titulo de "Saludo al usuario" y un icono de menu hamburguesa que al presionarlo rediriga a un menu hamburgesa.

// import 'package:app_replica_mach/src/presentation/provider/providers.dart';
import 'package:app_replica_mach/src/presentation/screens/widgets/home/home_action_section_widget.dart';
import 'package:app_replica_mach/src/presentation/screens/widgets/home/home_change_account_image_widget.dart';
import 'package:app_replica_mach/src/presentation/screens/widgets/home/home_image_carousel_widget.dart';
import 'package:app_replica_mach/src/presentation/screens/widgets/home/home_sliding_widget.dart';
import 'package:app_replica_mach/src/presentation/screens/widgets/home/home_visa_image.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final exampleValue = ref.watch(exampleProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saludo al usuario'),
        leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {} // Redirigir a un menu hamburguesa
            ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: const Column(
          children: [
            SlidingWidget(),
            HomeImageWidget(),
            HomeVisaImageWidget(),
            ActionSection(),
            ImageCarousel(),
          ],
        ),
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
// Fin del block de codigo
