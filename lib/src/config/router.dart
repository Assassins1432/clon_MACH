import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:app_replica_mach/src/presentation/screens/home/home_screen.dart';
import 'package:app_replica_mach/src/presentation/screens/card/card_screen.dart';
import 'package:app_replica_mach/src/presentation/screens/investments/investments_screen.dart';
import 'package:app_replica_mach/src/presentation/screens/qr/qr_screen.dart';
import 'package:app_replica_mach/src/presentation/screens/transactions/transactions_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      path: '/cards',
      builder: (BuildContext context, GoRouterState state) {
        return const CardScreen();
      },
    ),
    GoRoute(
      path: '/investments',
      builder: (BuildContext context, GoRouterState state) {
        return const InvestmentsScreen();
      },
    ),
    GoRoute(
      path: '/qr',
      builder: (BuildContext context, GoRouterState state) {
        return const QrScreen();
      },
    ),
    GoRoute(
      path: '/transactions',
      builder: (BuildContext context, GoRouterState state) {
        return const TransactionsScreen();
      },
    ),
  ],
);
