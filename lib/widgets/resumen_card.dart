import 'package:flutter/material.dart';

import '../models/lenguaje.dart';

/// Tarjeta con estadísticas de los lenguajes que se están mostrando.
class ResumenCard extends StatelessWidget {
  const ResumenCard({
    super.key,
    required this.total,
    required this.promedioUso,
    required this.masAdmirado,
  });

  final int total;
  final double promedioUso;
  final Lenguaje? masAdmirado;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF2F3E46),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            _dato('Lenguajes', '$total'),
            _dato('Uso promedio', '${promedioUso.toStringAsFixed(1)} %'),
            _dato('Más admirado', masAdmirado?.nombre ?? '—'),
          ],
        ),
      ),
    );
  }

  Widget _dato(String titulo, String valor) {
    return Expanded(
      child: Column(
        children: [
          Text(
            valor,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            titulo,
            style: const TextStyle(color: Color(0xFFB0BEC5), fontSize: 12),
          ),
        ],
      ),
    );
  }
}
