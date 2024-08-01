import 'package:app_replica_mach/src/config/router.dart';
import 'package:app_replica_mach/src/presentation/provider/theme_provider.dart';
import 'package:app_replica_mach/src/presentation/screens/card/card_screen.dart';
import 'package:app_replica_mach/src/presentation/screens/home/home_screen.dart';
import 'package:app_replica_mach/src/presentation/screens/investments/investments_screen.dart';
import 'package:app_replica_mach/src/presentation/screens/qr/qr_screen.dart';
import 'package:app_replica_mach/src/presentation/screens/settings/settings_screen.dart';
import 'package:app_replica_mach/src/presentation/screens/transactions/transactions_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// Define un StateNotifier para manejar el estado del índice seleccionado
class SelectedIndexNotifier extends StateNotifier<int> {
  SelectedIndexNotifier() : super(0); // El estado inicial es 0

  // Método para actualizar el índice seleccionado
  void setIndex(int index) {
    state = index;
  }
}

// Crea un StateNotifierProvider para el SelectedIndexNotifier
final selectedIndexProvider =
    StateNotifierProvider<SelectedIndexNotifier, int>((ref) {
  return SelectedIndexNotifier();
});

void main() {
  // Envuelve la aplicación en un ProviderScope para que Riverpod pueda manejar el estado
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeNotifierProvider);
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: 'Replica Mach',
      theme: ThemeData.light(), // Tema claro
      darkTheme: ThemeData.dark(), // Tema oscuro
      // home: const MainScreen(), // Define la pantalla principal
      themeMode: themeMode, // Modo de tema
    );
  }
}

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  // Lista de widgets para cada pantalla
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    TransactionsScreen(),
    QrScreen(),
    CardScreen(),
    InvestmentsScreen(),
    SettingsScreen(),
  ];

  // Lista de títulos para cada pantalla
  static const List<String> _titles = <String>[
    'Home',
    'Transactions',
    'QR',
    'Cards',
    'Investments',
    'Settings',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Observa el estado del índice seleccionado
    final selectedIndex = ref.watch(selectedIndexProvider);
    // Obtiene el notifier para actualizar el estado
    final selectedIndexNotifier = ref.read(selectedIndexProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[selectedIndex]), // Título de la pantalla actual
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            // selectedIndexNotifier.setIndex(5);
            context.push('/settings');
          }, // Acción para el menú hamburguesa
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: IndexedStack(
          index:
              selectedIndex, // Muestra la pantalla correspondiente al índice seleccionado
          children: _widgetOptions,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_sharp, color: Colors.black),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.multiple_stop_outlined, color: Colors.black),
            label: 'Transactions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_outlined, color: Colors.black),
            label: 'QR',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card, color: Colors.black),
            label: 'Cards',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.savings_outlined, color: Colors.black),
            label: 'Investments',
          ),
        ],
        currentIndex: selectedIndex, // Índice seleccionado actualmente
        onTap:
            selectedIndexNotifier.setIndex, // Actualiza el índice seleccionado
        selectedItemColor:
            Colors.purple, // Color para íconos y etiquetas seleccionadas
        unselectedItemColor:
            Colors.black, // Color para íconos y etiquetas no seleccionadas
        backgroundColor: Colors.white, // Fondo blanco
        type: BottomNavigationBarType
            .fixed, // Asegura que las etiquetas siempre se muestren
        selectedLabelStyle: const TextStyle(
          color: Colors.purple,
        ), // Estilo para etiquetas seleccionadas
        unselectedLabelStyle: const TextStyle(
          color: Colors.black,
        ), // Estilo para etiquetas no seleccionadas
        showUnselectedLabels: true, // Muestra etiquetas no seleccionadas
      ),
    );
  }
}
