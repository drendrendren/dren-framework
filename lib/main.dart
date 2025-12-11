import 'package:flutter/material.dart';
import 'package:drenfw/dogu/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(useMaterial3: false),
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
