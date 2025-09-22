import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Importar para SystemChrome

class FlutterPage extends StatefulWidget {
  const FlutterPage({super.key});

  @override
  State<FlutterPage> createState() => _FlutterPageState();
}

class _FlutterPageState extends State<FlutterPage> {
  @override
  void initState() {
    super.initState();
    // Configurar la interfaz del sistema para esta pantalla
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual, 
      overlays: [SystemUiOverlay.top] // Mostrar solo la barra de estado
    );
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
  }

  @override
  void dispose() {
    // Restaurar la interfaz del sistema al salir de la pantalla
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual, 
      overlays: SystemUiOverlay.values
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50], // Fondo ligeramente gris para mejor contraste
      appBar: AppBar(
        title: const Text(
          "Flutter",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 22,
            color: Colors.black87,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: SafeArea(
          bottom: true, // Asegurar que el contenido no se superponga con la barra de navegación
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header con icono y título
                Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: const Color(0xFF02569B).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: const Icon(
                      Icons.flutter_dash,
                      size: 60,
                      color: Color(0xFF02569B),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                
                const Center(
                  child: Text(
                    "Flutter Framework",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                
                const SizedBox(height: 8),
                
                const Center(
                  child: Text(
                    "Desarrollado por Google",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),
                
                const SizedBox(height: 24),
                
                // Información básica - Lenguajes como lista
                _buildLanguageCard(["Dart"], const Color(0xFF02569B)),
                
                const SizedBox(height: 16),
                
                // Rating
                const Text(
                  "Valoración:",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                
                const SizedBox(height: 8),
                
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 20),
                    Icon(Icons.star, color: Colors.amber, size: 20),
                    Icon(Icons.star, color: Colors.amber, size: 20),
                    Icon(Icons.star, color: Colors.amber, size: 20),
                    Icon(Icons.star_half, color: Colors.amber, size: 20),
                    const SizedBox(width: 10),
                    const Text(
                      "4.8/5",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 24),
                
                // Características
                const Text(
                  "Características principales:",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                
                const SizedBox(height: 12),
                
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    _buildFeatureChip("Multiplataforma", Icons.phone_iphone),
                    _buildFeatureChip("Alto rendimiento", Icons.speed),
                    _buildFeatureChip("Widgets personalizables", Icons.brush),
                    _buildFeatureChip("Hot Reload", Icons.autorenew),
                    _buildFeatureChip("Comunidad activa", Icons.people),
                  ],
                ),
                
                const SizedBox(height: 24),
                
                // Ventajas
                _buildProsConsCard(
                  "Ventajas",
                  Icons.check_circle,
                  Colors.green,
                  [
                    "Multiplataforma (iOS, Android, Web, Desktop)",
                    "Excelente rendimiento con motor propio",
                    "Amplia comunidad y documentación",
                    "Widgets modernos y personalizables",
                    "Hot reload para desarrollo rápido",
                    "Código nativo sin puentes JavaScript",
                  ],
                ),
                
                const SizedBox(height: 16),
                
                // Desventajas
                _buildProsConsCard(
                  "Desventajas",
                  Icons.cancel,
                  Colors.red,
                  [
                    "Tamaño de apps mayor que nativas",
                    "Curva de aprendizaje de Dart",
                    "Integración con librerías nativas requiere trabajo extra",
                    "Ecosistema menos maduro que React Native en algunos aspectos",
                  ],
                ),
                
                const SizedBox(height: 24),
                
                // Aplicaciones destacadas
                const Text(
                  "Aplicaciones destacadas:",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                
                const SizedBox(height: 12),
                
                SizedBox(
                  height: 120,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildAppExample("Google Ads"),
                      _buildAppExample("Alibaba"),
                      _buildAppExample("Reflectly"),
                      _buildAppExample("eBay Motors"),
                    ],
                  ),
                ),
                
                const SizedBox(height: 24),
                
                // Estadísticas
                const Text(
                  "Estadísticas:",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                
                const SizedBox(height: 12),
                
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  elevation: 0,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildStatistic("90%", "Código reusable"),
                        _buildStatistic("200k+", "Apps"),
                        _buildStatistic("2M+", "Devs"),
                      ],
                    ),
                  ),
                ),
                
                const SizedBox(height: 24),
                
                // Justificación
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  elevation: 0,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.lightbulb_outline, color: Colors.amber[700]),
                            const SizedBox(width: 8),
                            const Text(
                              "Justificación:",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Ideal cuando se busca desarrollo rápido y multiplataforma con excelente rendimiento visual. Perfecto para startups que necesitan lanzar productos rápidamente en múltiples plataformas con un equipo pequeño.",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                
                const SizedBox(height: 32), // Espacio final aumentado para evitar superposición
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Nuevo widget para mostrar lenguajes como lista
  Widget _buildLanguageCard(List<String> languages, Color color) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 0,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.code, color: color),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Lenguaje(s):",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Mostrar cada lenguaje en una línea separada
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: languages.map((language) => 
                      Text(
                        "• $language",
                        style: const TextStyle(fontSize: 14),
                      )
                    ).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureChip(String text, IconData icon) {
    return Chip(
      avatar: Icon(icon, size: 18, color: const Color(0xFF02569B)),
      label: Text(text),
      backgroundColor: const Color(0xFF02569B).withOpacity(0.1),
      labelStyle: const TextStyle(
        fontSize: 14,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildProsConsCard(String title, IconData icon, Color color, List<String> items) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 0,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: color),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: color,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: items.map((item) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Text(
                  "• $item",
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              )).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppExample(String name) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: const Color(0xFF02569B).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Center(
              child: Text(
                name[0],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color(0xFF02569B),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildStatistic(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF02569B),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}