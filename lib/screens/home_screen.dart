import 'package:flutter/material.dart';

import '../data/lenguajes_data.dart';
import '../models/anillo.dart';
import '../models/lenguaje.dart';
import '../services/radar_service.dart';
import '../widgets/lenguaje_card.dart';
import '../widgets/resumen_card.dart';
import 'detalle_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final RadarService _servicio = const RadarService(lenguajesRadar);

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
