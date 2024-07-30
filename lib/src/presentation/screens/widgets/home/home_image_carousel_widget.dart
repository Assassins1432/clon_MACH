import 'package:flutter/material.dart';

class ImageCarousel extends StatelessWidget {
  const ImageCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(viewportFraction: 0.9);

    return SizedBox(
      height: 200, // Ajusta la altura según tus necesidades
      child: PageView(
        controller: controller,
        children: const [
          ImageWidget(imagePath: 'assets/aseguraloMach.png'),
          ImageWidget(imagePath: 'assets/cashbank.png'),
          ImageWidget(imagePath: 'assets/comoGanar.png'),
          ImageWidget(imagePath: 'assets/cotizaGratis.png'),
          ImageWidget(imagePath: 'assets/cuentaFuturo.png'),
          ImageWidget(imagePath: 'assets/donaHoy.png'),
          ImageWidget(imagePath: 'assets/extranjero.png'),
          ImageWidget(imagePath: 'assets/fondoMutuo.png'),
          ImageWidget(imagePath: 'assets/irPagar.png'),
          ImageWidget(imagePath: 'assets/meInteresa.png'),
        ],
      ),
    );
  }
}

class ImageWidget extends StatelessWidget {
  final String imagePath;

  const ImageWidget({required this.imagePath, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(imagePath, fit: BoxFit.cover),
    );
  }
}
