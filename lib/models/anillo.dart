import 'package:flutter/material.dart';

/// Los cuatro anillos del radar tecnológico, del más seguro al más riesgoso.
///
/// Es un "enum mejorado": cada valor guarda su etiqueta y sus colores.
enum Anillo {
  adoptar('Adoptar', Color(0xFF2E7D32), Color(0xFFE8F5E9)),
  probarConCautela('Probar con cautela', Color(0xFFEF6C00), Color(0xFFFFF3E0)),
  observar('Observar', Color(0xFF3949AB), Color(0xFFE8EAF6)),
  dejarMorir('Dejar morir', Color(0xFFC62828), Color(0xFFFFEBEE));

  const Anillo(this.etiqueta, this.color, this.colorSuave);

  /// Texto que se muestra en pantalla.
  final String etiqueta;

  /// Color principal del anillo.
  final Color color;

  /// Color claro para fondos.
  final Color colorSuave;
}
