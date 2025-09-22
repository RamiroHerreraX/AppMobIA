import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
  }

  final List<Map<String, String>> frameworks = const [
    {
      "name": "Flutter",
      "subtitle": "Lenguaje: Dart",
      "color": "0xFF02569B",
      "image": "assets/images/Flutter.jpg"
    },
    {
      "name": "React Native",
      "subtitle": "Lenguaje: JavaScript / TypeScript",
      "color": "0xFF61DAFB",
      "image": "assets/images/ReactNative.jpg"
    },
    {
      "name": "Ionic",
      "subtitle": "Lenguaje: JS/TS + HTML/CSS",
      "color": "0xFF3880FF",
      "image": "assets/images/Ionic.jpg"
    },
    {
      "name": "Kotlin Multiplatform",
      "subtitle": "Lenguaje: Kotlin",
      "color": "0xFF7F52FF",
      "image": "assets/images/Kotlin.jpg"
    },
    {
      "name": "NativeScript",
      "subtitle": "Lenguaje: JavaScript / TypeScript",
      "color": "0xFF65ADF1",
      "image": "assets/images/NativeScript.jpg"
    },
    {
      "name": "Xamarin",
      "subtitle": "Lenguaje: C#",
      "color": "0xFF3498DB",
      "image": "assets/images/Xamarin.jpg"
    },
    {
      "name": "SwiftUI",
      "subtitle": "Lenguaje: Swift",
      "color": "0xFFFA734E",
      "image": "assets/images/SwiftUI.jpg"
    },
  ];

  final List<Map<String, String>> tableData = [
    {"name": "Flutter", "language": "Dart", "platform": "iOS, Android, Web, Desktop", "rating": "4.8"},
    {"name": "React Native", "language": "JS/TS", "platform": "iOS, Android, Web", "rating": "4.5"},
    {"name": "Ionic", "language": "JS/TS + HTML/CSS", "platform": "Web, Mobile", "rating": "4.2"},
    {"name": "Kotlin Multiplatform", "language": "Kotlin", "platform": "iOS, Android, Desktop", "rating": "4.3"},
    {"name": "NativeScript", "language": "JS/TS", "platform": "iOS, Android, Web", "rating": "4.1"},
    {"name": "Xamarin", "language": "C#", "platform": "iOS, Android, Windows", "rating": "4.0"},
    {"name": "SwiftUI", "language": "Swift", "platform": "iOS, macOS", "rating": "4.4"},
  ];

  final List<Map<String, dynamic>> conclusions = [
    {
      "title": "Flutter: Rendimiento y Productividad",
      "subtitle": "Análisis del equipo de desarrollo",
      "content": "Flutter destaca por su Hot Reload, que permite ver los cambios al instante sin perder el estado de la aplicación. Su rendimiento y productividad son superiores, ya que compila directamente a código nativo, evitando puentes JavaScript o WebViews.",
      "icon": Icons.emoji_events,
      "color": Colors.amber
    },
    {
      "title": "Motor Propio de Renderizado",
      "subtitle": "Ventajas técnicas",
      "content": "Flutter utiliza su propio motor de renderizado (Skia), lo que garantiza:\n- Interfaz consistente en todas las plataformas\n- Animaciones a 60 FPS sin interrupciones\n- Cero problemas de compatibilidad entre iOS y Android\nEsto permite desarrollar interfaces complejas sin preocuparse por diferencias de plataforma.",
      "icon": Icons.lightbulb,
      "color": Colors.yellow
    },
    {
      "title": "Comparativa de Experiencia",
      "subtitle": "Resultados del desarrollo",
      "content": "Desarrollamos la misma app en tres frameworks:\n- Flutter: 2 semanas, 1 código base\n- React Native: 3 semanas, problemas de rendimiento\n- Ionic: 4 semanas, UI inconsistente\n\nFlutter permitió un desarrollo un 40% más rápido y la app funcionó perfectamente en iOS y Android desde el primer día.",
      "icon": Icons.rocket_launch,
      "color": Colors.blue
    },
    {
      "title": "Datos Estadísticos",
      "subtitle": "Análisis cuantitativo",
      "content": "Métricas de desempeño:\n- RENDIMIENTO (FPS):\n  - Flutter: 58-60 FPS\n  - React Native: 45-55 FPS\n  - Ionic: 30-40 FPS\n- TIEMPO DE DESARROLLO:\n  - Flutter: 100 horas\n  - React Native: 140 horas\n  - Ionic: 180 horas\n- SATISFACCIÓN DEL EQUIPO:\n  - Flutter: 9.5/10\n  - Otros: 6.5/10 promedio\n\nLos números muestran que Flutter sobresale en todos los aspectos.",
      "icon": Icons.analytics,
      "color": Colors.green
    },
    {
      "title": "Recomendación para Principiantes",
      "subtitle": "Consejos para estudiantes",
      "content": "Para iniciar en desarrollo móvil, se recomienda Flutter por:\n- Lenguaje Dart más sencillo que JavaScript/TypeScript\n- Documentación clara y comunidad activa\n- Alta demanda laboral\n- Posibilidad de crear apps profesionales rápidamente\n\nFlutter facilita aprender y desarrollar aplicaciones multiplataforma de forma eficiente.",
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

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          title: const Text(
            "SmartFrames",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22, color: Colors.black87),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
        body: SafeArea(child: _pages[_currentIndex]),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (index) => setState(() => _currentIndex = index),
              backgroundColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.blueAccent,
              unselectedItemColor: Colors.grey[500],
              selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
              unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
              showUnselectedLabels: true,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.list), label: "Frameworks"),
                BottomNavigationBarItem(icon: Icon(Icons.table_chart), label: "Tablas"),
                BottomNavigationBarItem(icon: Icon(Icons.article), label: "Conclusiones"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _frameworkListPage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: frameworks.map((framework) {
          final color = Color(int.parse(framework["color"]!));
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              elevation: 3,
              shadowColor: color.withOpacity(0.2),
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  Widget page;
                  switch (framework["name"]) {
                    case "Flutter": page = const FlutterPage(); break;
                    case "React Native": page = const ReactNativePage(); break;
                    case "Ionic": page = const IonicPage(); break;
                    case "Kotlin Multiplatform": page = const KotlinPage(); break;
                    case "NativeScript": page = const NativeScriptPage(); break;
                    case "Xamarin": page = const XamarinPage(); break;
                    case "SwiftUI": page = const SwiftUIPage(); break;
                    default: page = Scaffold(
                      appBar: AppBar(title: Text(framework["name"]!)),
                      body: const Center(child: Text("Página en construcción...")),
                    );
                  }
                  Navigator.push(context, MaterialPageRoute(builder: (_) => page));
                },
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: color.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            framework["image"]!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(framework["name"]!, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                            const SizedBox(height: 4),
                            Text(framework["subtitle"]!, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                          ],
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Colors.grey[400]),
                    ],
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _tablesPage() => ComparativeTable(tableData: tableData);

  Widget _conclusionsPage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: conclusions.map((item) {
          final icon = item["icon"] as IconData;
          final color = item["color"] as Color;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              elevation: 3,
              shadowColor: color.withOpacity(0.2),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(color: color.withOpacity(0.1), shape: BoxShape.circle),
                          child: Icon(icon, color: color, size: 28),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item["title"], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black87)),
                              Text(item["subtitle"], style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(item["content"], style: const TextStyle(fontSize: 15, height: 1.5, color: Colors.black87), textAlign: TextAlign.justify),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
