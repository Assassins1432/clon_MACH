import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartItem {
  final String name;
  final double price;
  int quantity;

  CartItem({required this.name, required this.price, this.quantity = 1});

  CartItem copyWith({String? name, double? price, int? quantity}) {
    return CartItem(
      name: name ?? this.name,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }
}

class CartNotifier extends StateNotifier<List<CartItem>> {
  CartNotifier() : super([]);

  void addItem(CartItem item) {
    state = [...state, item];
  }

  void updateItemQuantity(String name, int quantity) {
    state = [
      for (final item in state)
        if (item.name == name) item.copyWith(quantity: quantity) else item
    ];
  }

  void removeItem(String name) {
    state = state.where((item) => item.name != name).toList();
  }

  double get total =>
      state.fold(0, (sum, item) => sum + item.price * item.quantity);
}

final cartProvider = StateNotifierProvider<CartNotifier, List<CartItem>>((ref) {
  return CartNotifier();
});
