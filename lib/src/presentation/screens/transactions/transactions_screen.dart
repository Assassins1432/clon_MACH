import 'package:app_replica_mach/src/presentation/screens/widgets/transactions/transaction_button.dart';
import 'package:app_replica_mach/src/presentation/screens/widgets/transactions/transfer_button.dart';
import 'package:flutter/material.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20), // Espacio debajo del AppBar
          _buildHeaderText('¿Qué quieres hacer hoy?'),
          const SizedBox(height: 25), // Espacio entre el texto y el botón
          const TransactionButton(
            icon: Icons.payment,
            title: 'Cobra o paga por MACH',
            subtitle: 'Envía y recibe pagos de forma fácil y rápida',
          ),
          const SizedBox(height: 25), // Espacio entre los botones
          _buildHeaderText('Otras formas de transferir'),
          const SizedBox(height: 20), // Espacio entre el texto y los botones
          _buildTransferButtons(),
        ],
      ),
    );
  }

  Widget _buildHeaderText(String text) {
    return Center(
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _buildTransferButtons() {
    return const Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
        TransferButton(
          icon: Icons.link,
          title: 'Link de cobro',
        ),
        TransferButton(
          icon: Icons.qr_code,
          title: 'QR\nMACH',
        ),
        TransferButton(
          icon: Icons.account_balance,
          title: 'A cuentas Bancarias',
        ),
        TransferButton(
          icon: Icons.public,
          title: 'Al Extranjero',
        ),
      ],
    );
  }
}
