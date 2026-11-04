"""Une todos los archivos de lib/ en un solo archivo para DartPad.

DartPad (dartpad.dev) solo acepta un archivo, así que este script copia
el código de cada archivo y quita los imports internos del proyecto.

Uso:  python3 tool/generar_dartpad.py
"""
from pathlib import Path

RAIZ = Path(__file__).resolve().parent.parent
ORDEN = [
    "main.dart",
    "models/anillo.dart",
    "models/lenguaje.dart",
    "data/lenguajes_data.dart",
    "services/radar_service.dart",
    "screens/home_screen.dart",
    "screens/detalle_screen.dart",
    "widgets/lenguaje_card.dart",
    "widgets/resumen_card.dart",
    "widgets/barra_metrica.dart",
]

partes = [
    "// Archivo generado automáticamente para DartPad.",
    "// El código ordenado por carpetas está en lib/.",
    "",
    "import 'package:flutter/material.dart';",
    "",
]
for ruta in ORDEN:
    lineas = (RAIZ / "lib" / ruta).read_text(encoding="utf-8").splitlines()
    cuerpo = [l for l in lineas if not l.startswith("import ")]
    while cuerpo and not cuerpo[0].strip():
        cuerpo.pop(0)
    partes.append(f"// ===== lib/{ruta} =====")
    partes.extend(cuerpo)
    partes.append("")

salida = RAIZ / "dartpad" / "main_dartpad.dart"
salida.write_text("\n".join(partes), encoding="utf-8")
print(f"Generado: {salida}")
