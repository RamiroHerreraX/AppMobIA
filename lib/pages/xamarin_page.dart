import 'package:flutter/material.dart';
import 'framework_page.dart';


class XamarinPage extends StatelessWidget {
  const XamarinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FrameworkPage(
      title: "Xamarin",
      subtitle: "Parte de Microsoft .NET",
      color: const Color(0xFF3498DB),
      languages: ["C#"],
      rating: "4.1/5",
      features: [
        {"label": "C# multiplataforma", "icon": Icons.computer},
        {"label": "Soporte Microsoft", "icon": Icons.business},
        {"label": "UI nativa", "icon": Icons.phone_android},
      ],
      pros: [
        "Soporte oficial de Microsoft",
        "Reutilización de código .NET",
        "Integración con Visual Studio",
      ],
      cons: [
        "Curva de aprendizaje de .NET",
        "Tamaño de apps más grande",
      ],
      apps: ["Storyo", "Olo", "UPS Mobile"],
      stats: {"80%": "Código reusable", "15k+": "Apps", "1M+": "Devs"},
      justification:
          "Ideal si ya usas el ecosistema .NET y quieres apps móviles multiplataforma.",
    );
  }
}
