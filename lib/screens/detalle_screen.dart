import 'package:flutter/material.dart';

import '../models/lenguaje.dart';
import '../widgets/barra_metrica.dart';

class DetalleScreen extends StatelessWidget {
  const DetalleScreen({super.key, required this.lenguaje});

  final Lenguaje lenguaje;

  @override
  Widget build(BuildContext context) {
    final anillo = lenguaje.anillo;

    return Scaffold(
      appBar: AppBar(
        title: Text(lenguaje.nombre),
        backgroundColor: anillo.colorSuave,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            anillo.etiqueta.toUpperCase(),
            style: TextStyle(
              color: anillo.color,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 4),
          Text(lenguaje.enfoque, style: const TextStyle(fontSize: 18)),
          const SizedBox(height: 24),
          const Text(
            'Stack Overflow Developer Survey 2026',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ..._construirMetricas(),
          const SizedBox(height: 24),
          const Text(
            'Evidencias',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ...lenguaje.evidencias.map(
            (e) => ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.check_circle, color: anillo.color),
              title: Text(e),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: anillo.colorSuave,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: anillo.color),
            ),
            child: Text(
              'Veredicto: ${lenguaje.veredicto}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _construirMetricas() {
    if (!lenguaje.tieneDatosEncuesta) {
      return const [
        Text('Este lenguaje no aparece en la encuesta de 2026.'),
      ];
    }
    final color = lenguaje.anillo.color;
    return [
      BarraMetrica(etiqueta: 'Uso', valor: lenguaje.usoPct!, color: color),
      BarraMetrica(
        etiqueta: 'Quieren aprenderlo',
        valor: lenguaje.deseadoPct!,
        color: color,
      ),
      BarraMetrica(
        etiqueta: 'Admirado',
        valor: lenguaje.admiradoPct!,
        color: color,
      ),
      const SizedBox(height: 8),
      Text(
        'Brecha entre amor y uso: '
        '${lenguaje.brechaAmorUso!.toStringAsFixed(1)} puntos',
        style: const TextStyle(fontStyle: FontStyle.italic),
      ),
    ];
  }
}
