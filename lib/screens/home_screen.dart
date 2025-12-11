import 'package:flutter/material.dart';
import 'package:drenfw/dogu/media_query.dart';
import 'package:drenfw/dogu/palette.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        title: SizedBox(
          height: 25,
          child: Image.asset(
            'assets/images/appbar_logo.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Palette.backgroundPrimary, Palette.backgroundSecondary],
          ),
        ),
        child: Center(
          child: SizedBox(
            width: MediaQueryDogu.width(context) * 0.8,
            height: MediaQueryDogu.height(context) * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Hello World!',
                  style: TextStyle(
                    color: Palette.textPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
