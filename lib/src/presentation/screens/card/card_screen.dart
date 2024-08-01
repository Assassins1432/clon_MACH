import 'package:app_replica_mach/src/presentation/provider/saldo_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CardScreen extends ConsumerWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final saldo = ref.watch(saldoProvider);
    final tipoCambio = ref.watch(tipoCambioProvider);
    final saldoDolares = saldo / tipoCambio;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Saldo: \$${saldo.toStringAsFixed(2)}',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Text(
          'En dólares: US\$${saldoDolares.toStringAsFixed(2)}      Tipo de cambio: \$${tipoCambio.toStringAsFixed(2)}',
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                ref.read(saldoProvider.notifier).incrementarSaldo(100.0);
              },
              child: const Text('Agregar Saldo'),
            ),
            const SizedBox(width: 16),
            ElevatedButton(
              onPressed: () {
                ref.read(saldoProvider.notifier).reiniciarSaldo();
              },
              child: const Text('Reiniciar Saldo'),
            ),
          ],
        ),
        const SizedBox(height: 32),
        const Text(
          'Tu tarjeta MACH',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        _buildCardOption(
          icon: Icons.credit_card,
          title: 'Tarjeta virtual',
          subtitle: '**** **** **** 7415',
        ),
        const SizedBox(height: 16),
        _buildCardOption(
          icon: Icons.credit_card,
          title: 'Tarjeta física',
          subtitle: 'Pide tu tarjeta física',
        ),
        const SizedBox(height: 32),
        const Text(
          'Opciones',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        _buildCardOption(
          icon: Icons.attach_money,
          title: 'Recargar',
          subtitle: '',
        ),
      ],
    );
  }

  Widget _buildCardOption(
      {required IconData icon,
      required String title,
      required String subtitle}) {
    return InkWell(
      onTap: () {
        // Acción al presionar el widget
      },
      child: Row(
        children: [
          Icon(icon, size: 40),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              if (subtitle.isNotEmpty)
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
            ],
          ),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios),
        ],
      ),
    );
  }
}
