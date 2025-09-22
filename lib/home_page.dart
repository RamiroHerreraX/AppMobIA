import 'package:flutter/material.dart';
import 'pages/flutter_page.dart';
import 'pages/react_native_page.dart';
import 'pages/kotlin_page.dart';
import 'pages/nativescript_page.dart';
import 'pages/xamarin_page.dart';
import 'pages/swiftui_page.dart';
import 'pages/ionic_page.dart';
import 'pages/comparative_table.dart'; 

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  // Lista de frameworks con información básica
  final List<Map<String, String>> frameworks = const [
    {"name": "Flutter", "subtitle": "Lenguaje: Dart", "color": "0xFF02569B"},
    {"name": "React Native", "subtitle": "Lenguaje: JavaScript / TypeScript", "color": "0xFF61DAFB"},
    {"name": "Ionic", "subtitle": "Lenguaje: JavaScript/TypeScript + HTML + CSS", "color": "0xFF3880FF"},
    {"name": "Kotlin Multiplatform", "subtitle": "Lenguaje: Kotlin", "color": "0xFF7F52FF"},
    {"name": "NativeScript", "subtitle": "Lenguaje: JavaScript / TypeScript", "color": "0xFF65ADF1"},
    {"name": "Xamarin", "subtitle": "Lenguaje: C#", "color": "0xFF3498DB"},
    {"name": "SwiftUI", "subtitle": "Lenguaje: Swift", "color": "0xFFFA734E"},
  ];

  // Datos para la tabla comparativa
  final List<Map<String, String>> tableData = [
    {"name": "Flutter", "language": "Dart", "platform": "iOS, Android, Web, Desktop", "rating": "4.8"},
    {"name": "React Native", "language": "JS/TS", "platform": "iOS, Android, Web", "rating": "4.5"},
    {"name": "Ionic", "language": "JS/TS + HTML/CSS", "platform": "Web, Mobile", "rating": "4.2"},
    {"name": "Kotlin Multiplatform", "language": "Kotlin", "platform": "iOS, Android, Desktop", "rating": "4.3"},
    {"name": "NativeScript", "language": "JS/TS", "platform": "iOS, Android, Web", "rating": "4.1"},
    {"name": "Xamarin", "language": "C#", "platform": "iOS, Android, Windows", "rating": "4.0"},
    {"name": "SwiftUI", "language": "Swift", "platform": "iOS, macOS", "rating": "4.4"},
  ];

  // Conclusiones sobre frameworks
  final List<Map<String, dynamic>> conclusions = [
    {
      "title": "Flutter: Rendimiento y Productividad",
      "subtitle": "Análisis del equipo de desarrollo",
      "content": """Flutter destaca por su Hot Reload, que permite ver los cambios al instante sin perder el estado de la aplicación. Su rendimiento y productividad son superiores, ya que compila directamente a código nativo, evitando puentes JavaScript o WebViews.""",
      "icon": Icons.emoji_events,
      "color": Colors.amber
    },
    {
      "title": "Motor Propio de Renderizado",
      "subtitle": "Ventajas técnicas",
      "content": """Flutter utiliza su propio motor de renderizado (Skia), lo que garantiza:
• Interfaz consistente en todas las plataformas
• Animaciones a 60 FPS sin interrupciones
• Cero problemas de compatibilidad entre iOS y Android
Esto permite desarrollar interfaces complejas sin preocuparse por diferencias de plataforma.""",
      "icon": Icons.lightbulb,
      "color": Colors.yellow[700]
    },
    {
      "title": "Comparativa de Experiencia",
      "subtitle": "Resultados del desarrollo",
      "content": """Desarrollamos la misma app en tres frameworks:
• Flutter: 2 semanas, 1 código base
• React Native: 3 semanas, problemas de rendimiento
• Ionic: 4 semanas, UI inconsistente

Flutter permitió un desarrollo un 40% más rápido y la app funcionó perfectamente en iOS y Android desde el primer día.""",
      "icon": Icons.rocket_launch,
      "color": Colors.blue
    },
    {
      "title": "Datos Estadísticos",
      "subtitle": "Análisis cuantitativo",
      "content": """Métricas de desempeño:
• RENDIMIENTO (FPS):
  - Flutter: 58-60 FPS
  - React Native: 45-55 FPS
  - Ionic: 30-40 FPS
• TIEMPO DE DESARROLLO:
  - Flutter: 100 horas
  - React Native: 140 horas
  - Ionic: 180 horas
• SATISFACCIÓN DEL EQUIPO:
  - Flutter: 9.5/10
  - Otros: 6.5/10 promedio

Los números muestran que Flutter sobresale en todos los aspectos.""",
      "icon": Icons.analytics,
      "color": Colors.green
    },
    {
      "title": "Recomendación para Principiantes",
      "subtitle": "Consejos para estudiantes",
      "content": """Para iniciar en desarrollo móvil, se recomienda Flutter por:
• Lenguaje Dart más sencillo que JavaScript/TypeScript
• Documentación clara y comunidad activa
• Alta demanda laboral
• Posibilidad de crear apps profesionales rápidamente

Flutter facilita aprender y desarrollar aplicaciones multiplataforma de forma eficiente.""",
      "icon": Icons.school,
      "color": Colors.purple
    }
  ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      _frameworkListPage(),
      _tablesPage(),
      _conclusionsPage(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "SmartFrames",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 22,
            color: Colors.black87,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "Frameworks",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.table_chart),
            label: "Tablas",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: "Conclusiones",
          ),
        ],
      ),
    );
  }

  // Página que lista los frameworks
  Widget _frameworkListPage() {
    return ListView.builder(
      itemCount: frameworks.length,
      itemBuilder: (context, index) {
        final framework = frameworks[index];
        final color = Color(int.parse(framework["color"]!));

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            elevation: 2,
            color: Colors.white,
            child: InkWell(
              borderRadius: BorderRadius.circular(20.0),
              onTap: () {
                Widget page;
                switch (framework["name"]) {
                  case "Flutter":
                    page = FlutterPage();
                    break;
                  case "React Native":
                    page = ReactNativePage();
                    break;
                  case "Ionic":
                    page = IonicPage();
                    break;
                  case "Kotlin Multiplatform":
                    page = KotlinPage();
                    break;
                  case "NativeScript":
                    page = NativeScriptPage();
                    break;
                  case "Xamarin":
                    page = XamarinPage();
                    break;
                  case "SwiftUI":
                    page = SwiftUIPage();
                    break;
                  default:
                    page = Scaffold(
                      appBar: AppBar(title: Text(framework["name"]!)),
                      body: const Center(child: Text("Página en construcción...")),
                    );
                }
                Navigator.push(context, MaterialPageRoute(builder: (_) => page));
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Container(
                      width: 48.0,
                      height: 48.0,
                      decoration: BoxDecoration(
                        color: color.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Center(
                        child: Text(
                          framework["name"]![0],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: color,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            framework["name"]!,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 4.0),
                          Text(
                            framework["subtitle"]!,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 16,
                      color: Colors.grey[400],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // Página de tabla comparativa
  Widget _tablesPage() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ComparativeTable(tableData: tableData),
    );
  }

  // Página de conclusiones
  Widget _conclusionsPage() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: conclusions.map((conclusion) {
        final IconData icon = conclusion["icon"] as IconData;
        final Color color = conclusion["color"] as Color;
        
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 4,
          margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Encabezado con icono y título
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: color.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(icon, color: color, size: 28),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            conclusion["title"],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black87,
                            ),
                          ),
                          Text(
                            conclusion["subtitle"],
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Contenido
                Text(
                  conclusion["content"],
                  style: const TextStyle(
                    fontSize: 15,
                    height: 1.5,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
