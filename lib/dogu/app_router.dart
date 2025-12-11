import 'package:go_router/go_router.dart';
import 'package:drenfw/screens/home_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/home',
  // errorBuilder: (context, state) => const ErrorScreen(),
  routes: [
    GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
  ],
);
