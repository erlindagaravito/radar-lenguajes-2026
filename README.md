# 📡 Radar de Lenguajes 2026

Aplicación en **Flutter (Dart)** que presenta mi radar tecnológico de lenguajes de última generación: **Elixir, R, Dart/Flutter, Clojure, F#, Crystal y Elm**.
Clasifica cada lenguaje en un anillo (**Adoptar · Probar con cautela · Observar · Dejar morir**) y lo respalda con datos reales de 2026.

> Proyecto final · **Lenguajes de Última Generación**
> Autora: **Erlinda Garavito Vela** · Docente: **Amaury Méndez** · Universitaria de Colombia · 2026

---

## 🎯 Objetivo

Pasar del análisis del Pitch Deck (Corte 3) a una aplicación funcional que permita **explorar, filtrar y comparar** los lenguajes del radar. La idea central del proyecto es: *"ser amado no te salva"*. Elm es el lenguaje más admirado de 2026 (94 %), pero solo lo usa el 0,1 % de los desarrolladores.

## ✅ Funcionalidades (MVP)

| Funcionalidad | Descripción |
|---|---|
| Lista del radar | Muestra los 7 lenguajes con su anillo, enfoque y datos de uso/admiración. |
| Filtro por anillo | Chips para ver *Todos*, *Adoptar*, *Probar con cautela*, *Observar* o *Dejar morir*. |
| Ordenamiento | Por más usados, más admirados o por nombre (A-Z). |
| Resumen estadístico | Total de lenguajes, uso promedio y el más admirado del filtro actual. |
| Detalle | Barras de uso / deseo / admiración, "brecha amor-uso", evidencias y veredicto. |
| Manejo de datos faltantes | Crystal no aparece en la encuesta; la app lo indica sin fallar (null safety). |

## 🧠 Paradigmas utilizados

El proyecto combina **POO** y **programación funcional**, que es lo que Dart permite hacer de forma natural.

**1. Programación Orientada a Objetos (POO)**
- **Clases y objetos:** `Lenguaje` (modelo inmutable) y `RadarService` (lógica).
- **Encapsulamiento:** la lógica vive en `RadarService` y las pantallas solo la consumen.
- **Herencia:** todos los widgets heredan de `StatelessWidget` o `StatefulWidget`.
- **Enums con datos:** `Anillo` guarda su etiqueta y sus colores.

```dart
class Lenguaje {
  const Lenguaje({required this.nombre, required this.anillo, ...});
  final String nombre;
  final Anillo anillo;
  double? get brechaAmorUso => tieneDatosEncuesta ? admiradoPct! - usoPct! : null;
}
```

**2. Programación funcional** (`lib/services/radar_service.dart`)
- **filter** → `where`: filtrar por anillo.
- **map**: convertir lenguajes en sus porcentajes de uso, o en widgets.
- **reduce**: sumar porcentajes y encontrar el más admirado.
- **Inmutabilidad:** `ordenar` devuelve una copia y no modifica la lista original.

```dart
double promedioUso(List<Lenguaje> lista) {
  final usos = lista.map((l) => l.usoPct).whereType<double>().toList(); // map
  if (usos.isEmpty) return 0;
  return usos.reduce((a, b) => a + b) / usos.length;                      // reduce
}

List<Lenguaje> filtrarPorAnillo(Anillo? anillo) =>
    lenguajes.where((l) => l.anillo == anillo).toList();                   // filter
```

**3. Programación declarativa / reactiva (UI):** en Flutter la interfaz se *describe* según el estado. Cuando cambia el filtro, `setState` vuelve a construir la pantalla.

## ⚖️ Justificación tecnológica: ¿por qué Flutter?

| Criterio | **Flutter (Dart)** ✅ | Kotlin (Android nativo) | React Native (JavaScript) |
|---|---|---|---|
| Plataformas con un código | Android, iOS, web y escritorio | Solo Android (iOS requiere KMP) | Android e iOS (web limitada) |
| Rendimiento | Compilado a código nativo (AOT), motor gráfico propio | Nativo, el mejor en Android | Usa un puente con componentes nativos |
| Consistencia visual | Igual en todas las plataformas | Depende de Android | Varía según la plataforma |
| Curva de aprendizaje | Dart es parecido a Java/JS, con null safety | Media | Baja si ya sabes JS |
| Tendencia 2026 | TIOBE: del puesto 41 al 27 en un año | Estable | Estable |

**Trade-offs (desventajas que acepto):**
- Las apps de Flutter pesan más que las nativas, porque incluyen su propio motor.
- Depende del respaldo de Google.
- Para funciones muy específicas del sistema a veces hay que escribir código nativo.

**Conclusión:** para un MVP que debe correr en celular y en web con un solo código, Flutter es la mejor relación entre esfuerzo y resultado. Por eso Dart/Flutter está en el anillo **Adoptar** de mi radar.

## 🗂️ Estructura del proyecto

```
lib/
├── main.dart                  # Punto de entrada y tema de la app
├── models/
│   ├── anillo.dart            # Enum con los 4 anillos del radar
│   └── lenguaje.dart          # Clase Lenguaje (modelo inmutable)
├── data/
│   └── lenguajes_data.dart    # Los 7 lenguajes con datos de 2026
├── services/
│   └── radar_service.dart     # Lógica funcional: filtrar, ordenar, map/reduce
├── screens/
│   ├── home_screen.dart       # Pantalla principal (StatefulWidget)
│   └── detalle_screen.dart    # Detalle de cada lenguaje
└── widgets/
    ├── lenguaje_card.dart     # Tarjeta de la lista
    ├── resumen_card.dart      # Estadísticas
    └── barra_metrica.dart     # Barra de porcentaje
test/
└── radar_service_test.dart    # Pruebas unitarias y de widget
dartpad/
└── main_dartpad.dart          # Toda la app en un solo archivo para DartPad
tool/
└── generar_dartpad.py         # Script que genera el archivo de DartPad
```

La arquitectura separa **datos → lógica → interfaz**. Así se puede cambiar la fuente de datos (por ejemplo, por una API) sin tocar las pantallas.

## ▶️ Cómo ejecutarlo

**Opción rápida, sin instalar nada (DartPad):**
1. Entra a <https://dartpad.dev>.
2. Copia todo el contenido de `dartpad/main_dartpad.dart` y pégalo en el editor.
3. Pulsa **Run**.

**Opción local (con Flutter instalado):**
```bash
git clone https://github.com/<usuario>/radar-lenguajes-2026.git
cd radar-lenguajes-2026
flutter create .          # genera las carpetas android/, ios/, web/
flutter pub get
flutter run -d chrome     # o en un emulador / celular
```

**Pruebas:**
```bash
flutter test
```

## 📚 Fuentes de los datos

1. **Stack Overflow Developer Survey 2026**: uso, deseo y admiración. <https://survey.stackoverflow.co/2026/technology>
2. **Índice TIOBE**, mayo y octubre de 2026: posiciones de R y Dart. <https://www.tiobe.com/tiobe-index/>
3. **GitHub Octoverse 2026**: más del 40 % de los pull requests empiezan con un borrador de IA. <https://github.blog/news-insights/octoverse/>
4. **Repositorios oficiales**: Elm 0.19.2 (<https://github.com/elm/compiler/releases>) y Crystal 1.22 (<https://crystal-lang.org>).

## 🚀 Mejoras futuras

- Cargar los datos desde una API en lugar de tenerlos en el código.
- Gráfico radar circular interactivo.
- Comparar dos lenguajes lado a lado.
