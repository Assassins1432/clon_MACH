import 'package:flutter_riverpod/flutter_riverpod.dart';

class SaldoNotifier extends StateNotifier<double> {
  SaldoNotifier() : super(0.0);

  void incrementarSaldo(double cantidad) {
    state += cantidad;
  }

  void reiniciarSaldo() {
    state = 1089.00;
  }
}

final saldoProvider = StateNotifierProvider<SaldoNotifier, double>((ref) {
  return SaldoNotifier();
});

final tipoCambioProvider = Provider<double>((ref) {
  return 1.0; // Define el tipo de cambio inicial
});
