import '../models/anillo.dart';
import '../models/lenguaje.dart';

/// Formas de ordenar la lista de lenguajes.
enum Orden {
  uso('Más usados'),
  admiracion('Más admirados'),
  nombre('Nombre (A-Z)');

  const Orden(this.etiqueta);
  final String etiqueta;
}

/// Lógica del radar, separada de la interfaz.
///
/// Aquí está la parte funcional del proyecto: los métodos no modifican
/// la lista original, sino que devuelven listas o valores nuevos usando
/// `where` (filter), `map` y `reduce`.
class RadarService {
  const RadarService(this.lenguajes);

  final List<Lenguaje> lenguajes;

  /// FILTER: devuelve solo los lenguajes de un anillo.
  /// Si [anillo] es null, devuelve todos.
  List<Lenguaje> filtrarPorAnillo(Anillo? anillo) {
    if (anillo == null) return List.of(lenguajes);
    return lenguajes.where((l) => l.anillo == anillo).toList();
  }

  /// Devuelve una copia ordenada, sin tocar la lista original.
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

  /// MAP + REDUCE: promedio de uso, ignorando los lenguajes sin datos.
  double promedioUso(List<Lenguaje> lista) {
    final usos = lista.map((l) => l.usoPct).whereType<double>().toList();
    if (usos.isEmpty) return 0;
    final suma = usos.reduce((a, b) => a + b);
    return suma / usos.length;
  }

  /// REDUCE: el lenguaje con mayor porcentaje de admiración.
  Lenguaje? masAdmirado(List<Lenguaje> lista) {
    final conDatos = lista.where((l) => l.admiradoPct != null).toList();
    if (conDatos.isEmpty) return null;
    return conDatos
        .reduce((a, b) => a.admiradoPct! >= b.admiradoPct! ? a : b);
  }

  /// Cuántos lenguajes hay en cada anillo.
  Map<Anillo, int> conteoPorAnillo() => {
        for (final anillo in Anillo.values)
          anillo: lenguajes.where((l) => l.anillo == anillo).length,
      };
}
