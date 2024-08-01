import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@riverpod
double saldo(SaldoRef ref) {
  return 1089.0; // Valor del saldo
}

@riverpod
double tipoCambio(TipoCambioRef ref) {
  return 986.0; // Tipo de cambio
}
