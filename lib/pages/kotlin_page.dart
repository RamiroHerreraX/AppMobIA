import 'package:flutter/material.dart';
import 'framework_page.dart';


class KotlinPage extends StatelessWidget {
  const KotlinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FrameworkPage(
      title: "Kotlin Multiplatform",
      subtitle: "Desarrollado por JetBrains",
      color: const Color(0xFF7F52FF),
      languages: ["Kotlin"],
      rating: "4.3/5",
      features: [
        {"label": "Compartir lógica", "icon": Icons.sync},
        {"label": "Soporte JetBrains", "icon": Icons.business},
        {"label": "Código nativo", "icon": Icons.code},
      ],
      pros: [
        "Lenguaje moderno y seguro",
        "Integración nativa total",
        "Reutilización de lógica de negocio",
      ],
      cons: [
        "UI debe implementarse por separado",
        "Curva de aprendizaje inicial",
      ],
      apps: ["Cash App", "Philips Hue", "Netflix (parcial)"],
      stats: {"60%": "Código reusable", "10k+": "Apps", "500k+": "Devs"},
      justification:
          "Recomendado si buscas rendimiento nativo y ya trabajas con Kotlin/Java en tus proyectos.",
    );
  }
}
