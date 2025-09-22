import 'package:flutter/material.dart';

class ComparativeTable extends StatefulWidget {
  final List<Map<String, String>> tableData;

  const ComparativeTable({super.key, required this.tableData});

  @override
  State<ComparativeTable> createState() => _ComparativeTableState();
}

class _ComparativeTableState extends State<ComparativeTable> {
  String? selectedFramework;

  final Map<String, String> frameworkLogos = {
    "Flutter": "assets/images/Flutter.jpg",
    "React Native": "assets/images/ReactNative.jpg",
    "Ionic": "assets/images/Ionic.jpg",
    "Kotlin Multiplatform": "assets/images/Kotlin.jpg",
    "NativeScript": "assets/images/NativeScript.jpg",
    "Xamarin": "assets/images/Xamarin.jpg",
    "SwiftUI": "assets/images/SwiftUI.jpg",
  };

  final Map<String, List<String>> additionalInfo = {
    "Flutter": [
      "Desarrollado por Google",
      "Hot Reload para desarrollo rápido",
      "Widgets totalmente personalizables",
      "Alto rendimiento (compilación nativa)",
      "⭐ MEJOR FRAMEWORK GENERAL - Mayor puntuación en rendimiento y productividad"
    ],
    "React Native": [
      "Desarrollado por Facebook",
      "Reutiliza componentes nativos",
      "Gran ecosistema de librerías",
      "Puente JavaScript puede afectar rendimiento",
      "MEJOR para desarrolladores con experiencia web - Curva de aprendizaje suave para devs JavaScript"
    ],
    "Ionic": [
      "Basado en tecnologías web",
      "Aplicaciones híbridas",
      "Amplia compatibilidad con navegadores",
      "Rendimiento inferior a soluciones nativas",
      "MEJOR para aplicaciones web progresivas - Ideal para PWA y aplicaciones simples"
    ],
    "Kotlin Multiplatform": [
      "Lenguaje moderno y conciso",
      "Comparte lógica entre plataformas",
      "Interoperabilidad con Java",
      "Comunidad en crecimiento",
      "MEJOR para equipos Android existentes - Máxima reutilización de código Kotlin"
    ],
    "NativeScript": [
      "Acceso completo a APIs nativas",
      "Sin puente WebView",
      "Uso directo de librerías npm",
      "Curva de aprendizaje moderada",
      "BUENA alternativa a React Native - Mejor acceso nativo que otros frameworks JS"
    ],
    "Xamarin": [
      "Desarrollado por Microsoft",
      "Acceso a APIs nativas",
      "Comparte código entre plataformas",
      "Integración con Visual Studio",
      "MEJOR para desarrolladores .NET - Ideal para equipos enterprise con stack Microsoft"
    ],
    "SwiftUI": [
      "Solo para ecosistema Apple",
      "Declarativo y moderno",
      "Integración perfecta con iOS/macOS",
      "Requiere macOS para desarrollo",
      "MEJOR para aplicaciones iOS exclusivas - Rendimiento nativo y experiencia Apple pura"
    ]
  };

  final Map<String, String> frameworkAnalysis = {
    "Flutter": "Flutter es considerado el mejor framework general por su excelente balance entre rendimiento, productividad y capacidades multiplataforma. Su motor de renderizado propio y compilación nativa le dan ventajas significativas de rendimiento sobre soluciones basadas en JavaScript.",
    "React Native": "React Native es mejor para desarrolladores web gracias a su curva de aprendizaje suave y gran ecosistema. Sin embargo, su puente JavaScript puede causar cuellos de botella en aplicaciones complejas que requieren alto rendimiento.",
    "Ionic": "Ionic es mejor para aplicaciones web progresivas y proyectos simples, pero su rendimiento es inferior debido a su naturaleza híbrida basada en WebView. Ideal para aplicaciones que priorizan el time-to-market sobre el rendimiento.",
    "Kotlin Multiplatform": "KMP es mejor para equipos con experiencia en Android que buscan compartir lógica de negocio entre plataformas. Ofrece mejor rendimiento que soluciones JS pero requiere conocimiento de Kotlin.",
    "NativeScript": "NativeScript ofrece mejor acceso nativo que React Native al evitar el puente JavaScript, pero su ecosistema es más pequeño. Buena opción para aplicaciones que necesitan APIs nativas específicas.",
    "Xamarin": "Xamarin es mejor para empresas con stack Microsoft existente. Ofrece buen rendimiento pero su adopción ha disminuido desde el lanzamiento de .NET MAUI como su sucesor.",
    "SwiftUI": "SwiftUI es mejor exclusivamente para aplicaciones Apple, ofreciendo el máximo rendimiento y integración con iOS/macOS. Su principal limitación es la falta de soporte multiplataforma."
  };

  String get bestFramework {
    double maxRating = 0;
    String best = "";
    for (var framework in widget.tableData) {
      double rating = double.tryParse(framework['rating']!) ?? 0.0;
      if (rating > maxRating) {
        maxRating = rating;
        best = framework['name']!;
      }
    }
    return best;
  }

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
      case "NativeScript":
        return const Color(0xFF65ADF1);
      case "Xamarin":
        return const Color(0xFF3498DB);
      case "SwiftUI":
        return const Color(0xFFFA734E);
      default:
        return Colors.grey;
    }
  }

  Widget _buildRating(String rating) {
    double r = double.tryParse(rating) ?? 0.0;
    int fullStars = r.floor();
    bool halfStar = (r - fullStars) >= 0.5;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          rating,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        const SizedBox(width: 4),
        Row(
          children: List.generate(5, (index) {
            if (index < fullStars) return const Icon(Icons.star, color: Colors.amber, size: 16);
            if (index == fullStars && halfStar) return const Icon(Icons.star_half, color: Colors.amber, size: 16);
            return const Icon(Icons.star_border, color: Colors.amber, size: 16);
          }),
        ),
      ],
    );
  }

  Widget _buildMobileCard(Map<String, String> framework, bool isSelected) {
    final color = _getFrameworkColor(framework['name']!);
    final isBest = framework['name'] == bestFramework;
    final logo = frameworkLogos[framework['name']]!;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: isSelected ? 6 : 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: isSelected ? BorderSide(color: color, width: 2) : BorderSide.none,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          setState(() {
            if (selectedFramework == framework['name']) {
              selectedFramework = null;
            } else {
              selectedFramework = framework['name'];
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // Logo
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(logo, fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            framework['name']!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (isBest) ...[
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Text(
                              "MEJOR",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  Icon(
                    isSelected ? Icons.expand_less : Icons.expand_more,
                    color: Colors.grey,
                  ),
                ],
              ),
              if (isSelected) ...[
                const SizedBox(height: 16),
                SingleChildScrollView( // <- Scroll interno para tarjetas largas
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInfoRow('Lenguaje', framework['language']!),
                      const Divider(height: 20),
                      _buildInfoRow('Plataforma', framework['platform']!),
                      const Divider(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Popularidad', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: Colors.grey)),
                          _buildRating(framework['rating']!),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Text('Características principales:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      const SizedBox(height: 8),
                      ...additionalInfo[framework['name']]!.map((info) => 
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.circle, size: 8, color: info.contains("MEJOR") ? Colors.amber : Colors.grey),
                              const SizedBox(width: 8),
                              Expanded(child: Text(info, style: TextStyle(fontSize: 14, fontWeight: info.contains("MEJOR") ? FontWeight.bold : FontWeight.normal, color: info.contains("MEJOR") ? Colors.amber : Colors.black))),
                            ],
                          ),
                        )
                      ).toList(),
                      const SizedBox(height: 16),
                      const Text('Análisis comparativo:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      const SizedBox(height: 8),
                      Text(frameworkAnalysis[framework['name']]!, style: const TextStyle(fontSize: 14, color: Colors.black87)),
                      const SizedBox(height: 16),
                      const Text('Comparativa de popularidad:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      const SizedBox(height: 8),
                      _buildMiniComparison(framework['name']!),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String title, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 100, child: Text(title, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: Colors.grey))),
        Expanded(child: Text(value, style: const TextStyle(fontSize: 14))),
      ],
    );
  }

  Widget _buildMiniComparison(String currentFramework) {
    return Row(
      children: widget.tableData.map((fw) {
        final color = _getFrameworkColor(fw['name']!);
        double rating = double.tryParse(fw['rating']!) ?? 0.0;
        bool isCurrent = fw['name'] == currentFramework;

        return Expanded(
          child: Column(
            children: [
              Text(
                fw['name']!,
                style: TextStyle(
                  fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal,
                  color: isCurrent ? color : Colors.black54,
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Container(
                height: rating * 10,
                width: 16,
                decoration: BoxDecoration(
                  color: color.withOpacity(isCurrent ? 1 : 0.5),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildDesktopTable() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: const [
          DataColumn(label: Text('Framework')),
          DataColumn(label: Text('Lenguaje')),
          DataColumn(label: Text('Plataforma')),
          DataColumn(label: Text('Popularidad')),
        ],
        rows: widget.tableData.map((fw) {
          final color = _getFrameworkColor(fw['name']!);
          final logo = frameworkLogos[fw['name']]!;

          return DataRow(cells: [
            DataCell(
              Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(logo, fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(fw['name']!),
                ],
              ),
            ),
            DataCell(Text(fw['language']!)),
            DataCell(Text(fw['platform']!)),
            DataCell(_buildRating(fw['rating']!)),
          ]);
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    if (isMobile) {
      return ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(), // <- Scroll habilitado
        children: widget.tableData.map((fw) => _buildMobileCard(fw, selectedFramework == fw['name'])).toList(),
      );
    } else {
      return _buildDesktopTable();
    }
  }
}
