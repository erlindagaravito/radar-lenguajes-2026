import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

/// Punto de entrada de la aplicación.
void main() {
  runApp(const RadarApp());
}

class RadarApp extends StatelessWidget {
  const RadarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Radar de Lenguajes 2026',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: const Color(0xFF2F3E46),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
