import 'package:flutter_test/flutter_test.dart';
import 'package:radar_lenguajes/data/lenguajes_data.dart';
import 'package:radar_lenguajes/main.dart';
import 'package:radar_lenguajes/models/anillo.dart';
import 'package:radar_lenguajes/services/radar_service.dart';

void main() {
  const servicio = RadarService(lenguajesRadar);

  group('RadarService', () {
    test('el radar tiene los 7 lenguajes del corte', () {
      expect(servicio.filtrarPorAnillo(null).length, 7);
    });

    test('Adoptar contiene 2 lenguajes', () {
      final adoptar = servicio.filtrarPorAnillo(Anillo.adoptar);
      expect(adoptar.map((l) => l.nombre), ['Dart / Flutter', 'R']);
    });

    test('Elm es el más admirado', () {
      expect(servicio.masAdmirado(lenguajesRadar)?.nombre, 'Elm');
    });

    test('el promedio de uso ignora a Crystal (sin datos)', () {
      expect(servicio.promedioUso(lenguajesRadar), closeTo(2.43, 0.01));
    });

    test('ordenar por uso deja a Dart primero y a Crystal (sin datos) al final',
        () {
      final ordenados = servicio.ordenar(lenguajesRadar, Orden.uso);
      expect(ordenados.first.nombre, 'Dart / Flutter');
      expect(ordenados.last.nombre, 'Crystal');
    });

    test('ordenar no modifica la lista original', () {
      final porNombre = servicio.ordenar(lenguajesRadar, Orden.nombre);
      expect(porNombre.first.nombre, 'Clojure');
      expect(lenguajesRadar.first.nombre, 'Dart / Flutter');
    });
  });

  testWidgets('la app muestra el título y los filtros', (tester) async {
    await tester.pumpWidget(const RadarApp());
    expect(find.text('Radar de Lenguajes 2026'), findsOneWidget);
    expect(find.text('Todos'), findsOneWidget);
  });
}
