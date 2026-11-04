// Archivo generado automáticamente para DartPad.
// El código ordenado por carpetas está en lib/.

import 'package:flutter/material.dart';

// ===== lib/main.dart =====
/// Punto de entrada de la aplicación.
void main() {
  runApp(const RadarApp());
}

class RadarApp extends StatelessWidget {
  const RadarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Radar de Lenguajes 2026',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: const Color(0xFF2F3E46),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

// ===== lib/models/anillo.dart =====
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

// ===== lib/models/lenguaje.dart =====
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

// ===== lib/data/lenguajes_data.dart =====
/// Datos del radar.
/// Fuente de los porcentajes: Stack Overflow Developer Survey 2026
/// (uso = "trabajo extenso el último año"; admirado = lo usa y quiere seguir).
const List<Lenguaje> lenguajesRadar = [
  Lenguaje(
    nombre: 'Dart / Flutter',
    enfoque: 'Apps multiplataforma',
    anillo: Anillo.adoptar,
    usoPct: 4.9,
    deseadoPct: 4.1,
    admiradoPct: 42.3,
    evidencias: [
      'TIOBE: subió del puesto 41 al 27 entre oct-2025 y oct-2026.',
      'TIOBE relaciona su crecimiento con Flutter.',
      'Es el más usado de los 7 lenguajes del corte (Stack Overflow 2026).',
    ],
    veredicto: 'Adoptar para apps móviles y multiplataforma nuevas.',
  ),
  Lenguaje(
    nombre: 'R',
    enfoque: 'Análisis de datos y estadística',
    anillo: Anillo.adoptar,
    usoPct: 4.5,
    deseadoPct: 3.3,
    admiradoPct: 40.7,
    evidencias: [
      'TIOBE mayo 2026: puesto 8, igualando su mejor posición histórica.',
      'TIOBE: la estadística se concentra en dos lenguajes, Python y R.',
      'En octubre de 2026 superó a SQL en TIOBE.',
    ],
    veredicto: 'Adoptar para análisis estadístico y ciencia de datos.',
  ),
  Lenguaje(
    nombre: 'Elixir',
    enfoque: 'Sistemas distribuidos y tiempo real',
    anillo: Anillo.probarConCautela,
    usoPct: 2.6,
    deseadoPct: 4.7,
    admiradoPct: 62.1,
    evidencias: [
      'Uno de los lenguajes más admirados de 2026 (62 %).',
      'Su framework Phoenix tiene 69,5 % de admiración.',
      'Pero solo el 2,6 % lo usa: es difícil conseguir programadores.',
    ],
    veredicto: 'Probar en un servicio piloto de tiempo real.',
  ),
  Lenguaje(
    nombre: 'F#',
    enfoque: 'Programación funcional en .NET',
    anillo: Anillo.probarConCautela,
    usoPct: 1.2,
    deseadoPct: 2.3,
    admiradoPct: 48.3,
    evidencias: [
      'Se integra con C# y todo el ecosistema .NET.',
      '48 % de admiración, pero 1,2 % de uso.',
      'Microsoft le da más prioridad a C#.',
    ],
    veredicto: 'Probar solo en equipos que ya trabajan con .NET.',
  ),
  Lenguaje(
    nombre: 'Crystal',
    enfoque: 'Sintaxis de Ruby con velocidad compilada',
    anillo: Anillo.observar,
    evidencias: [
      'No aparece en la encuesta Stack Overflow 2026.',
      'Sigue publicando versiones: 1.22 en octubre de 2026.',
      'Hay una propuesta para darle soporte oficial en Fedora 46.',
    ],
    veredicto: 'Vivo, pero sin masa crítica. Revisar en 2027.',
  ),
  Lenguaje(
    nombre: 'Clojure',
    enfoque: 'Lisp sobre la JVM',
    anillo: Anillo.observar,
    usoPct: 1.3,
    deseadoPct: 2.5,
    admiradoPct: 48.7,
    evidencias: [
      'Su uso bajó de 1,9 % (2021) a 1,3 % (2026).',
      'Solo el 2,5 % quiere aprenderlo.',
      'Fue de los mejor pagados en 2021-2022, pero no llega talento nuevo.',
    ],
    veredicto: 'Mantener lo que existe, no iniciar proyectos nuevos.',
  ),
  Lenguaje(
    nombre: 'Elm',
    enfoque: 'Frontend funcional sin errores en ejecución',
    anillo: Anillo.dejarMorir,
    usoPct: 0.1,
    deseadoPct: 0.1,
    admiradoPct: 94.1,
    evidencias: [
      'El más admirado de 2026 (94 %), pero lo usa solo el 0,1 %.',
      'Solo 17 de 14.099 personas lo usaron en el último año.',
      'Pasaron casi 7 años sin compilador nuevo (0.19.2, julio 2026).',
    ],
    veredicto: 'Gran idea, pero su ecosistema se agotó.',
  ),
];

// ===== lib/services/radar_service.dart =====
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

// ===== lib/screens/home_screen.dart =====
/// Pantalla principal: resumen, filtros y lista de lenguajes.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final RadarService _servicio = const RadarService(lenguajesRadar);

  /// Estado de la pantalla: qué anillo está seleccionado y cómo ordenar.
  Anillo? _anilloSeleccionado;
  Orden _orden = Orden.uso;

  @override
  Widget build(BuildContext context) {
    final filtrados = _servicio.ordenar(
      _servicio.filtrarPorAnillo(_anilloSeleccionado),
      _orden,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Radar de Lenguajes 2026'),
        actions: [
          PopupMenuButton<Orden>(
            icon: const Icon(Icons.sort),
            tooltip: 'Ordenar',
            initialValue: _orden,
            onSelected: (orden) => setState(() => _orden = orden),
            itemBuilder: (context) => Orden.values
                .map((o) => PopupMenuItem(value: o, child: Text(o.etiqueta)))
                .toList(),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ResumenCard(
            total: filtrados.length,
            promedioUso: _servicio.promedioUso(filtrados),
            masAdmirado: _servicio.masAdmirado(filtrados),
          ),
          const SizedBox(height: 16),
          _construirFiltros(),
          const SizedBox(height: 8),
          Text(
            'Ordenado por: ${_orden.etiqueta}',
            style: const TextStyle(color: Color(0xFF757575)),
          ),
          const SizedBox(height: 4),
          ...filtrados.map(
            (l) => LenguajeCard(lenguaje: l, onTap: () => _abrirDetalle(l)),
          ),
        ],
      ),
    );
  }

  /// Chips para filtrar por anillo. "Todos" quita el filtro.
  Widget _construirFiltros() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        ChoiceChip(
          label: const Text('Todos'),
          selected: _anilloSeleccionado == null,
          onSelected: (_) => setState(() => _anilloSeleccionado = null),
        ),
        ...Anillo.values.map(
          (anillo) => ChoiceChip(
            label: Text(anillo.etiqueta),
            selected: _anilloSeleccionado == anillo,
            selectedColor: anillo.colorSuave,
            onSelected: (_) => setState(() => _anilloSeleccionado = anillo),
          ),
        ),
      ],
    );
  }

  void _abrirDetalle(Lenguaje lenguaje) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DetalleScreen(lenguaje: lenguaje),
      ),
    );
  }
}

// ===== lib/screens/detalle_screen.dart =====
/// Pantalla de detalle: datos, evidencias y veredicto de un lenguaje.
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

  /// Si no hay datos de la encuesta (caso Crystal), muestra un aviso.
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

// ===== lib/widgets/lenguaje_card.dart =====
/// Tarjeta que resume un lenguaje en la lista principal.
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

// ===== lib/widgets/resumen_card.dart =====
/// Tarjeta con estadísticas de los lenguajes que se están mostrando.
class ResumenCard extends StatelessWidget {
  const ResumenCard({
    super.key,
    required this.total,
    required this.promedioUso,
    required this.masAdmirado,
  });

  final int total;
  final double promedioUso;
  final Lenguaje? masAdmirado;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF2F3E46),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            _dato('Lenguajes', '$total'),
            _dato('Uso promedio', '${promedioUso.toStringAsFixed(1)} %'),
            _dato('Más admirado', masAdmirado?.nombre ?? '—'),
          ],
        ),
      ),
    );
  }

  Widget _dato(String titulo, String valor) {
    return Expanded(
      child: Column(
        children: [
          Text(
            valor,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            titulo,
            style: const TextStyle(color: Color(0xFFB0BEC5), fontSize: 12),
          ),
        ],
      ),
    );
  }
}

// ===== lib/widgets/barra_metrica.dart =====
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
