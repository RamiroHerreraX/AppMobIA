import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Importar para SystemChrome

class FrameworkPage extends StatefulWidget {
  final String title;
  final String subtitle;
  final Color color;
  final List<String> languages; // Cambiado a lista de lenguajes
  final String rating;
  final List<Map<String, dynamic>> features;
  final List<String> pros;
  final List<String> cons;
  final List<String> apps;
  final Map<String, String> stats;
  final String justification;

  const FrameworkPage({
    required this.title,
    required this.subtitle,
    required this.color,
    required this.languages, // Cambiado a lista de lenguajes
    required this.rating,
    required this.features,
    required this.pros,
    required this.cons,
    required this.apps,
    required this.stats,
    required this.justification,
    super.key,
  });

  @override
  State<FrameworkPage> createState() => _FrameworkPageState();
}

class _FrameworkPageState extends State<FrameworkPage> {
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
        title: Text(
          widget.title,
          style: const TextStyle(
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
                // Header
                Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: widget.color.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Icon(Icons.apps, size: 60, color: widget.color),
                  ),
                ),
                const SizedBox(height: 20),

                Center(
                  child: Text(
                    "${widget.title} Framework",
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: 8),
                Center(
                  child: Text(
                    widget.subtitle,
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ),
                const SizedBox(height: 24),

                // Lenguaje(s) - Ahora soporta múltiples lenguajes
                _buildLanguageCard(widget.languages, widget.color),
                const SizedBox(height: 16),

                // Valoración
                const Text("Valoración:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 20),
                    Icon(Icons.star, color: Colors.amber, size: 20),
                    Icon(Icons.star, color: Colors.amber, size: 20),
                    Icon(Icons.star, color: Colors.amber, size: 20),
                    Icon(Icons.star_half, color: Colors.amber, size: 20),
                    const SizedBox(width: 10),
                    Text(widget.rating,
                        style: const TextStyle(fontWeight: FontWeight.w500)),
                  ],
                ),
                const SizedBox(height: 24),

                // Características
                const Text("Características principales:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: widget.features
                      .map((f) => _buildFeatureChip(f["label"], f["icon"], widget.color))
                      .toList(),
                ),
                const SizedBox(height: 24),

                // Ventajas
                _buildProsConsCard("Ventajas", Icons.check_circle, Colors.green, widget.pros),
                const SizedBox(height: 16),

                // Desventajas
                _buildProsConsCard("Desventajas", Icons.cancel, Colors.red, widget.cons),
                const SizedBox(height: 24),

                // Apps destacadas
                const Text("Aplicaciones destacadas:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                const SizedBox(height: 12),
                SizedBox(
                  height: 120,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: widget.apps.map((a) => _buildAppExample(a, widget.color)).toList(),
                  ),
                ),
                const SizedBox(height: 24),

                // Estadísticas
                const Text("Estadísticas:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
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
                      children: widget.stats.entries
                          .map((s) => Expanded(
                                child: _buildStatistic(s.value, s.key, widget.color),
                              ))
                          .toList(),
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
                            const Text("Justificación:",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600)),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(widget.justification,
                            style: const TextStyle(
                                fontSize: 14, color: Colors.black87)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 32), // Espacio final aumentado
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Nuevo widget para mostrar múltiples lenguajes
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

  Widget _buildFeatureChip(String text, IconData icon, Color color) {
    return Chip(
      avatar: Icon(icon, size: 18, color: color),
      label: Text(text),
      backgroundColor: color.withOpacity(0.1),
      labelStyle: const TextStyle(fontSize: 14, color: Colors.black87),
    );
  }

  Widget _buildProsConsCard(
      String title, IconData icon, Color color, List<String> items) {
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
                Text(title,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: color)),
              ],
            ),
            const SizedBox(height: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: items
                  .map((item) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Text("• $item",
                            style: const TextStyle(fontSize: 14)),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppExample(String name, Color color) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Center(
              child: Text(name[0],
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: color)),
            ),
          ),
          const SizedBox(height: 8),
          Text(name,
              style:
                  const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }

  Widget _buildStatistic(String value, String label, Color color) {
    return Column(
      children: [
        Text(value,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: color)),
        const SizedBox(height: 4),
        Text(label,
            style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }
}