// lib/app_router.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'input_page.dart';
import 'list_page.dart';

final appRouter = GoRouter(
  initialLocation: '/input',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return Scaffold(
          appBar: AppBar(title: const Text('TodoApp')),
          body: child, // Qui viene mostrata la pagina corrente (/input o /list)
          bottomNavigationBar: NavigationBar(
            selectedIndex: state.fullPath == '/input' ? 0 : 1,
            onDestinationSelected: (index) {
              if (index == 0) context.go('/input');
              if (index == 1) context.go('/list');
            },
            destinations: const [
              NavigationDestination(icon: Icon(Icons.add), label: 'Nuova'),
              NavigationDestination(icon: Icon(Icons.list), label: 'Lista'),
            ],
          ),
        );
      },
      routes: [
        GoRoute(path: '/input', builder: (context, state) => const InputPage()),
        GoRoute(path: '/list', builder: (context, state) => const ListPage()),
      ],
    ),
  ],
);