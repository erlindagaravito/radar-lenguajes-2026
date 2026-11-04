import 'package:flutter/material.dart';

import '../models/lenguaje.dart';

class LenguajeCard extends StatelessWidget {
  const LenguajeCard({super.key, required this.lenguaje, required this.onTap});

  final Lenguaje lenguaje;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final anillo = lenguaje.anillo;
    final datos = lenguaje.tieneDatosEncuesta
        ? 'Uso ${lenguaje.usoPct} %  ·  Admirado ${lenguaje.admiradoPct} %'
        : 'Sin datos en Stack Overflow 2026';

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border(left: BorderSide(color: anillo.color, width: 6)),
          ),
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: anillo.colorSuave,
                child: Text(
                  lenguaje.nombre[0],
                  style: TextStyle(
                    color: anillo.color,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      lenguaje.nombre,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(lenguaje.enfoque),
                    const SizedBox(height: 4),
                    Text(
                      datos,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFF616161),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: anillo.colorSuave,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  anillo.etiqueta,
                  style: TextStyle(
                    color: anillo.color,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
