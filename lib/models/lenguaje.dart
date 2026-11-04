import 'anillo.dart';

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

  final String enfoque;

  final Anillo anillo;

  final double? usoPct;
  final double? deseadoPct;
  final double? admiradoPct;

  final List<String> evidencias;

  final String veredicto;

  bool get tieneDatosEncuesta => usoPct != null && admiradoPct != null;

  double? get brechaAmorUso =>
      tieneDatosEncuesta ? admiradoPct! - usoPct! : null;

  @override
  String toString() => 'Lenguaje($nombre, ${anillo.etiqueta})';
}
