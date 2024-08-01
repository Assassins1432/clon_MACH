import 'package:flutter/material.dart';

class TransferButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onPressed;

  const TransferButton({
    super.key,
    required this.icon,
    required this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            duration: Duration(milliseconds: 2),
            content: Text('Botón presionado'),
          ),
        );
        if (onPressed != null) {
          onPressed!();
        }
      },
      borderRadius: BorderRadius.circular(
          8), // Asegura que la animación respete los bordes redondeados
      child: Container(
        width: MediaQuery.of(context).size.width * 0.3, // Ajustar el ancho
        height: MediaQuery.of(context).size.width * 0.3, // Ajustar el alto
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: 40,
              color: Colors.purple,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
