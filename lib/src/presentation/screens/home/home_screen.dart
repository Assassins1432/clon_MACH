// Esta sera la pantalla de Inicio. Su AppBar debe tener un titulo de "Saludo al usuario" y un icono de menu hamburguesa que al presionarlo rediriga a un menu hamburgesa.

// import 'package:app_replica_mach/src/presentation/provider/providers.dart';
import 'package:app_replica_mach/src/presentation/screens/widgets/home/home_action_section_widget.dart';
import 'package:app_replica_mach/src/presentation/screens/widgets/home/home_change_account_image_widget.dart';
import 'package:app_replica_mach/src/presentation/screens/widgets/home/home_image_carousel_widget.dart';
import 'package:app_replica_mach/src/presentation/screens/widgets/home/home_sliding_widget.dart';
import 'package:app_replica_mach/src/presentation/screens/widgets/home/home_visa_image.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final exampleValue = ref.watch(exampleProvider);
    return Container(
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
    );
  }
}
// Fin del block de codigo
