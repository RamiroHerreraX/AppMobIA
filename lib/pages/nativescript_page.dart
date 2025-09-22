import 'package:flutter/material.dart';
import 'framework_page.dart';

class NativeScriptPage extends StatelessWidget {
  const NativeScriptPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FrameworkPage(
      title: "NativeScript",
      subtitle: "Open Source Community",
      color: const Color(0xFF65ADF1),
      languages: ["JavaScript", "TypeScript"],
      rating: "4.0/5",
      features: [
        {"label": "Acceso APIs nativas", "icon": Icons.phone_android},
        {"label": "TypeScript soporte", "icon": Icons.code},
        {"label": "UI nativa real", "icon": Icons.layers},
      ],
      pros: [
        "Acceso directo a APIs nativas",
        "Uso de Angular o Vue opcional",
        "Código multiplataforma",
      ],
      cons: [
        "Menor comunidad que Flutter/React Native",
        "Documentación limitada",
      ],
      apps: ["SAP", "Progress", "Daily Nanny"],
      stats: {"75%": "Código reusable", "20k+": "Apps", "150k+": "Devs"},
      justification:
          "Ideal si quieres usar JS/TS con acceso directo a APIs nativas sin necesidad de puentes.",
      image: "assets/images/NativeScript.jpg", // ← Agregamos la imagen aquí
    );
  }
}
