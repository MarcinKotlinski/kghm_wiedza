import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../home/view/home_page.dart';
import '../login/view/login_page.dart';

class AppRouter {
  final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
        const LoginPage(),
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (BuildContext context, GoRouterState state) =>
        const HomePage(),
      ),
    ],
  );
}