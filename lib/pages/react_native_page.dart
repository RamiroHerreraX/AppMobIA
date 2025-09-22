import 'package:flutter/material.dart';
import 'framework_page.dart';

class ReactNativePage extends StatelessWidget {
  const ReactNativePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FrameworkPage(
      title: "React Native",
      subtitle: "Desarrollado por Meta (Facebook)",
      color: const Color(0xFF61DAFB),
      languages: ["JavaScript", "TypeScript"],
      rating: "4.5/5",
      features: [
        {"label": "Multiplataforma", "icon": Icons.phone_android},
        {"label": "Comunidad amplia", "icon": Icons.people},
        {"label": "Hot Reload", "icon": Icons.autorenew},
        {"label": "Uso de librerías JS", "icon": Icons.extension},
      ],
      pros: [
        "Gran comunidad y ecosistema maduro",
        "Reutilización de librerías JS",
        "Compatible con Expo para desarrollo rápido",
        "Soporte de grandes empresas",
      ],
      cons: [
        "Rendimiento inferior a nativo",
        "Necesidad de puentes con código nativo",
        "Fragmentación de librerías",
      ],
      apps: ["Instagram", "Facebook", "Uber Eats", "Walmart"],
      stats: {"85%": "Código reusable", "300k+": "Apps", "10M+": "Devs"},
      justification:
          "Ideal si ya tienes equipo con experiencia en JavaScript y quieres desarrollar multiplataforma con gran ecosistema.",
      image: "assets/images/ReactNative.jpg", // ← Aquí agregamos la imagen
    );
  }
}
