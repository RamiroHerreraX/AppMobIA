import 'package:flutter/material.dart';
import 'framework_page.dart';


class IonicPage extends StatelessWidget {
  const IonicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FrameworkPage(
      title: "Ionic",
      subtitle: "Desarrollado por Ionic Team",
      color: const Color(0xFF3880FF),
      languages: ["JavaScript", "TypeScript", "HTML", "CSS"],
      rating: "4.2/5",
      features: [
        {"label": "Basado en Web", "icon": Icons.language},
        {"label": "UI adaptable", "icon": Icons.devices},
        {"label": "Plugins nativos", "icon": Icons.extension},
      ],
      pros: [
        "Ideal para desarrolladores web",
        "Gran cantidad de componentes UI",
        "Rápido desarrollo multiplataforma",
      ],
      cons: [
        "Rendimiento inferior en apps grandes",
        "Dependencia del WebView",
      ],
      apps: ["Diesel", "Sworkit", "TD Ameritrade"],
      stats: {"70%": "Código reusable", "50k+": "Apps", "5M+": "Devs"},
      justification:
          "Ideal para equipos con experiencia web que quieren dar el salto a móvil con un stack conocido.",
    );
  }
}
