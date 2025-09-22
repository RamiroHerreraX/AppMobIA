import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Para SystemChrome
import 'package:introduction_screen/introduction_screen.dart';

class IntroScreen extends StatefulWidget {
  final VoidCallback onDone;

  const IntroScreen({super.key, required this.onDone});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  void initState() {
    super.initState();
    // Ocultar barras de navegación y de estado al iniciar la pantalla de introducción
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  @override
  void dispose() {
    // Restaurar la interfaz del sistema al salir de la pantalla de introducción
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
    super.dispose();
  }

  // Función para obtener colores según el framework (solo para decoración de botones y texto)
  Color _getFrameworkColor(String name) {
    switch (name) {
      case "Flutter":
        return const Color(0xFF02569B);
      case "React Native":
        return const Color(0xFF61DAFB);
      case "Ionic":
        return const Color(0xFF3880FF);
      case "Kotlin Multiplatform":
        return const Color(0xFF7F52FF);
      default:
        return Colors.blue;
    }
  }

  // Widget para mostrar la imagen del logo en lugar de iconos
  Widget _buildIntroImage() {
    return Container(
      width: 180,
      height: 180,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.withOpacity(0.3), width: 2),
      ),
      child: ClipOval(
        child: Image.asset(
          'assets/images/Logo.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: false,
        bottom: false,
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              title: "Bienvenido a SmartFrames",
              body:
                  "Explora los frameworks más utilizados en desarrollo móvil con comparativas detalladas y análisis interactivos.",
              image: _buildIntroImage(),
              decoration: PageDecoration(
                titleTextStyle: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: _getFrameworkColor("Flutter"),
                ),
                bodyTextStyle:
                    const TextStyle(fontSize: 16, color: Colors.black87),
                titlePadding: const EdgeInsets.only(top: 40, bottom: 20),
                imagePadding: const EdgeInsets.only(bottom: 30),
                contentMargin: const EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
            PageViewModel(
              title: "¿Qué es SmartFrames?",
              body:
                  "Una aplicación creada con Flutter que utiliza inteligencia artificial para generar código, textos, imágenes y contenido educativo sobre desarrollo móvil.",
              image: _buildIntroImage(),
              decoration: PageDecoration(
                titleTextStyle: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: _getFrameworkColor("React Native"),
                ),
                bodyTextStyle:
                    const TextStyle(fontSize: 16, color: Colors.black87),
                titlePadding: const EdgeInsets.only(top: 40, bottom: 20),
                imagePadding: const EdgeInsets.only(bottom: 30),
                contentMargin: const EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
            PageViewModel(
              title: "Explora Frameworks",
              body:
                  "Descubre ventajas, desventajas y comparaciones entre Flutter, React Native, Ionic, Kotlin Multiplatform, NativeScript, Xamarin y SwiftUI.",
              image: _buildIntroImage(),
              decoration: PageDecoration(
                titleTextStyle: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: _getFrameworkColor("Ionic"),
                ),
                bodyTextStyle:
                    const TextStyle(fontSize: 16, color: Colors.black87),
                titlePadding: const EdgeInsets.only(top: 40, bottom: 20),
                imagePadding: const EdgeInsets.only(bottom: 30),
                contentMargin: const EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
            PageViewModel(
              title: "Comparativas Interactivas",
              body:
                  "Selecciona cualquier framework para ver una comparación detallada con los demás, incluyendo ratings, características y análisis visual.",
              image: _buildIntroImage(),
              decoration: PageDecoration(
                titleTextStyle: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: _getFrameworkColor("Kotlin Multiplatform"),
                ),
                bodyTextStyle:
                    const TextStyle(fontSize: 16, color: Colors.black87),
                titlePadding: const EdgeInsets.only(top: 40, bottom: 20),
                imagePadding: const EdgeInsets.only(bottom: 30),
                contentMargin: const EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ],
          onDone: () {
            SystemChrome.setEnabledSystemUIMode(
              SystemUiMode.manual,
              overlays: SystemUiOverlay.values,
            );
            widget.onDone();
          },
          showSkipButton: true,
          skip: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                "Saltar",
                style:
                    TextStyle(fontWeight: FontWeight.w500, color: Colors.black87),
              ),
            ),
          ),
          next: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: _getFrameworkColor("Flutter").withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.arrow_forward, color: _getFrameworkColor("Flutter")),
          ),
          done: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            decoration: BoxDecoration(
              color: _getFrameworkColor("Flutter"),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                "Empezar",
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
          dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(20.0, 10.0),
            activeColor: _getFrameworkColor("Flutter"),
            color: Colors.grey,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
          ),
          globalBackgroundColor: Colors.white,
        ),
      ),
    );
  }
}
