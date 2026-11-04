import 'anillo.dart';

/// Representa un lenguaje de programación dentro del radar.
///
/// Es una clase inmutable (todos sus campos son `final`): una vez creado
/// el objeto, sus datos no cambian.
class Lenguaje {
  const Lenguaje({
    required this.nombre,
    required this.enfoque,
    required this.anillo,
    required this.evidencias,
    required this.veredicto,
    this.usoPct,
    this.deseadoPct,
    this.admiradoPct,
  });

  final String nombre;

  /// Para qué se usa principalmente (por ejemplo, "Análisis de datos").
  final String enfoque;

  /// Anillo del radar donde lo clasifiqué.
  final Anillo anillo;

  /// Datos de la encuesta Stack Overflow 2026.
  /// Son nulos (`?`) porque algunos lenguajes, como Crystal, no aparecen.
  final double? usoPct;
  final double? deseadoPct;
  final double? admiradoPct;

  /// Datos que respaldan la clasificación.
  final List<String> evidencias;

  /// Mi conclusión sobre el lenguaje.
  final String veredicto;

  /// `true` si el lenguaje aparece en la encuesta de Stack Overflow.
  bool get tieneDatosEncuesta => usoPct != null && admiradoPct != null;

  /// Diferencia entre cuánto lo admiran y cuánto lo usan.
  /// Una brecha grande significa "muy querido, pero poco usado".
  double? get brechaAmorUso =>
      tieneDatosEncuesta ? admiradoPct! - usoPct! : null;

  @override
  String toString() => 'Lenguaje($nombre, ${anillo.etiqueta})';
}
