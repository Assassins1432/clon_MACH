// lib/src/provider/providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Ejemplo de un proveedor simple
final exampleProvider = Provider<String>((ref) {
  return 'Hello, Riverpod!';
});
