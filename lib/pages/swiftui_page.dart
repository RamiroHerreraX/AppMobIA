import 'package:flutter/material.dart';
import 'framework_page.dart';

class SwiftUIPage extends StatelessWidget {
  const SwiftUIPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FrameworkPage(
      title: "SwiftUI",
      subtitle: "Desarrollado por Apple",
      color: const Color(0xFFFA734E),
      languages: ["Swift"],
      rating: "4.6/5",
      features: [
        {"label": "UI declarativa", "icon": Icons.view_quilt},
        {"label": "Soporte Apple", "icon": Icons.apple},
        {"label": "Integración nativa", "icon": Icons.phone_iphone},
      ],
      pros: [
        "Framework moderno y oficial de Apple",
        "Diseño declarativo y simple",
        "Integración completa con iOS/macOS",
      ],
      cons: [
        "Solo para ecosistema Apple",
        "Compatibilidad limitada en versiones antiguas de iOS",
      ],
      apps: ["Apple Store", "Reminders", "Fitness+"],
      stats: {"100%": "Código nativo", "200k+": "Apps", "3M+": "Devs"},
      justification:
          "Recomendado si tu prioridad es desarrollar para el ecosistema Apple con soporte oficial.",
    );
  }
}
