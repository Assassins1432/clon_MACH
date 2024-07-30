// widgets/action_section.dart
import 'package:flutter/material.dart';
import 'home_action_widget.dart';

class ActionSection extends StatelessWidget {
  const ActionSection({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(viewportFraction: 0.3);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '¿Qué quieres hacer hoy?',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  // Acción para el botón "Ver más"
                },
                child: const Text('Ver más'),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 150,
          child: PageView(
            controller: controller,
            children: const [
              ActionWidget(icon: Icons.account_balance, text: 'Cuenta'),
              ActionWidget(icon: Icons.savings, text: 'Ahorros'),
              ActionWidget(icon: Icons.credit_card, text: 'Tarjetas'),
              ActionWidget(icon: Icons.payment, text: 'Pagos'),
            ],
          ),
        ),
      ],
    );
  }
}
