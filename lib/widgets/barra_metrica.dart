import 'package:flutter/material.dart';

/// Barra horizontal que muestra un porcentaje (de 0 a 100).
class BarraMetrica extends StatelessWidget {
  const BarraMetrica({
    super.key,
    required this.etiqueta,
    required this.valor,
    required this.color,
  });

  final String etiqueta;
  final double valor;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(etiqueta, style: const TextStyle(fontSize: 15)),
              const Spacer(),
              Text(
                '${valor.toStringAsFixed(1)} %',
                style: TextStyle(fontWeight: FontWeight.bold, color: color),
              ),
            ],
          ),
          const SizedBox(height: 6),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: LinearProgressIndicator(
              value: valor / 100,
              minHeight: 12,
              color: color,
              backgroundColor: const Color(0xFFE0E0E0),
            ),
          ),
        ],
      ),
    );
  }
}
