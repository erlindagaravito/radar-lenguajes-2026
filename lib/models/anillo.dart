import 'package:flutter/material.dart';

enum Anillo {
  adoptar('Adoptar', Color(0xFF2E7D32), Color(0xFFE8F5E9)),
  probarConCautela('Probar con cautela', Color(0xFFEF6C00), Color(0xFFFFF3E0)),
  observar('Observar', Color(0xFF3949AB), Color(0xFFE8EAF6)),
  dejarMorir('Dejar morir', Color(0xFFC62828), Color(0xFFFFEBEE));

  const Anillo(this.etiqueta, this.color, this.colorSuave);

  final String etiqueta;

  final Color color;

  final Color colorSuave;
}
