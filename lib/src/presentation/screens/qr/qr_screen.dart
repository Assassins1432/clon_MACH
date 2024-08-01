import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_replica_mach/src/presentation/provider/cart_provider.dart';

class QrScreen extends ConsumerWidget {
  const QrScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartProvider);
    final cartTotal = ref.watch(cartProvider.notifier).total;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return ListTile(
                    title: Text(item.name),
                    subtitle: Text('Price: \$${item.price} x ${item.quantity}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () =>
                          ref.read(cartProvider.notifier).removeItem(item.name),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Text('Total: \$${cartTotal.toStringAsFixed(2)}'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ref
                    .read(cartProvider.notifier)
                    .addItem(CartItem(name: 'New Item', price: 10.0));
              },
              child: const Text('Add Item'),
            ),
          ],
        ),
      ),
    );
  }
}
