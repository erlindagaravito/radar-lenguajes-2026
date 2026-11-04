import '../models/anillo.dart';
import '../models/lenguaje.dart';

enum Orden {
  uso('Más usados'),
  admiracion('Más admirados'),
  nombre('Nombre (A-Z)');

  const Orden(this.etiqueta);
  final String etiqueta;
}

class RadarService {
  const RadarService(this.lenguajes);

  final List<Lenguaje> lenguajes;

  List<Lenguaje> filtrarPorAnillo(Anillo? anillo) {
    if (anillo == null) return List.of(lenguajes);
    return lenguajes.where((l) => l.anillo == anillo).toList();
  }

  List<Lenguaje> ordenar(List<Lenguaje> lista, Orden orden) {
    final copia = [...lista];
    switch (orden) {
      case Orden.uso:
        copia.sort((a, b) => (b.usoPct ?? -1).compareTo(a.usoPct ?? -1));
      case Orden.admiracion:
        copia.sort(
            (a, b) => (b.admiradoPct ?? -1).compareTo(a.admiradoPct ?? -1));
      case Orden.nombre:
        copia.sort((a, b) => a.nombre.compareTo(b.nombre));
    }
    return copia;
  }

  double promedioUso(List<Lenguaje> lista) {
    final usos = lista.map((l) => l.usoPct).whereType<double>().toList();
    if (usos.isEmpty) return 0;
    final suma = usos.reduce((a, b) => a + b);
    return suma / usos.length;
  }

  Lenguaje? masAdmirado(List<Lenguaje> lista) {
    final conDatos = lista.where((l) => l.admiradoPct != null).toList();
    if (conDatos.isEmpty) return null;
    return conDatos
        .reduce((a, b) => a.admiradoPct! >= b.admiradoPct! ? a : b);
  }

  Map<Anillo, int> conteoPorAnillo() => {
        for (final anillo in Anillo.values)
          anillo: lenguajes.where((l) => l.anillo == anillo).length,
      };
}
