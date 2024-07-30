import 'package:app_replica_mach/src/presentation/screens/card/card_screen.dart';
import 'package:app_replica_mach/src/presentation/screens/home/home_screen.dart';
import 'package:app_replica_mach/src/presentation/screens/investments/investments_screen.dart';
import 'package:app_replica_mach/src/presentation/screens/qr/qr_screen.dart';
import 'package:app_replica_mach/src/presentation/screens/transactions/transactions_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    CardScreen(),
    InvestmentsScreen(),
    QrScreen(),
    TransactionsScreen(),
  ];

  static const List<String> _titles = <String>[
    'Home',
    'Transactions',
    'QR',
    'Cards',
    'Investments',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
        leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {} // Redirigir a un menu hamburguesa
            ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
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
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor:
            Colors.purple, // Color para íconos y etiquetas seleccionadas
        unselectedItemColor:
            Colors.black, // Color para íconos y etiquetas no seleccionadas
        backgroundColor: Colors.white, // Fondo blanco
        type: BottomNavigationBarType
            .fixed, // Asegura que las etiquetas siempre se muestren
        selectedLabelStyle: const TextStyle(
            color: Colors.purple), // Estilo para etiquetas seleccionadas
        unselectedLabelStyle: const TextStyle(
            color: Colors.black), // Estilo para etiquetas no seleccionadas
        showUnselectedLabels: true, // Muestra etiquetas no seleccionadas
      ),
    );
  }
}
