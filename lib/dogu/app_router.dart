import 'package:go_router/go_router.dart';
import 'package:taiwan_currency_converter/screens/home_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/home',
  // errorBuilder: (context, state) => const ErrorScreen(),
  routes: [
    GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
  ],
);
