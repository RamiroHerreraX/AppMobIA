import 'package:flutter/material.dart';

class ComparativeTable extends StatefulWidget {
  final List<Map<String, String>> tableData;

  const ComparativeTable({super.key, required this.tableData});

  @override
  State<ComparativeTable> createState() => _ComparativeTableState();
}

class _ComparativeTableState extends State<ComparativeTable> {
  String? selectedFramework;
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

  // Explicaciones detalladas de por qué es mejor/peor
  final Map<String, String> frameworkAnalysis = {
    "Flutter": "Flutter es considerado el mejor framework general por su excelente balance entre rendimiento, productividad y capacidades multiplataforma. Su motor de renderizado propio y compilación nativa le dan ventajas significativas de rendimiento sobre soluciones basadas en JavaScript.",
    "React Native": "React Native es mejor para desarrolladores web gracias a su curva de aprendizaje suave y gran ecosistema. Sin embargo, su puente JavaScript puede causar cuellos de botella en aplicaciones complejas que requieren alto rendimiento.",
    "Ionic": "Ionic es mejor para aplicaciones web progresivas y proyectos simples, pero su rendimiento es inferior debido a su naturaleza híbrida basada en WebView. Ideal para aplicaciones que priorizan el time-to-market sobre el rendimiento.",
    "Kotlin Multiplatform": "KMP es mejor para equipos con experiencia en Android que buscan compartir lógica de negocio entre plataformas. Ofrece mejor rendimiento que soluciones JS pero requiere conocimiento de Kotlin.",
    "NativeScript": "NativeScript ofrece mejor acceso nativo que React Native al evitar el puente JavaScript, pero su ecosistema es más pequeño. Buena opción para aplicaciones que necesitan APIs nativas específicas.",
    "Xamarin": "Xamarin es mejor para empresas con stack Microsoft existente. Ofrece buen rendimiento pero su adopción ha disminuido desde el lanzamiento de .NET MAUI como su sucesor.",
    "SwiftUI": "SwiftUI es mejor exclusivamente para aplicaciones Apple, ofreciendo el máximo rendimiento y integración con iOS/macOS. Su principal limitación es la falta de soporte multiplataforma."
  };

  // Encontrar el mejor framework basado en la puntuación
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
    
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: isSelected ? 6 : 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: isSelected 
          ? BorderSide(color: color, width: 2) 
          : BorderSide.none
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
              // Header with framework name and icon
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        framework['name']![0],
                        style: TextStyle(
                          color: color,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
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
                
                // Language
                _buildInfoRow('Lenguaje', framework['language']!),
                const Divider(height: 20),
                
                // Platform
                _buildInfoRow('Plataforma', framework['platform']!),
                const Divider(height: 20),
                
                // Rating
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Popularidad',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    _buildRating(framework['rating']!),
                  ],
                ),
                
                const SizedBox(height: 16),
                const Text(
                  'Características principales:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                
                // Additional information
                ...additionalInfo[framework['name']]!.map((info) => 
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.circle, 
                          size: 8, 
                          color: info.contains("MEJOR") ? Colors.amber : Colors.grey
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            info,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: info.contains("MEJOR") ? FontWeight.bold : FontWeight.normal,
                              color: info.contains("MEJOR") ? Colors.amber : Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ).toList(),
                
                const SizedBox(height: 16),
                const Text(
                  'Análisis comparativo:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                
                Text(
                  frameworkAnalysis[framework['name']]!,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
                
                const SizedBox(height: 16),
                const Text(
                  'Comparativa de popularidad:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                
                // Mini comparison chart
                _buildMiniComparison(framework['name']!),
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
        SizedBox(
          width: 100,
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
  
  Widget _buildMiniComparison(String selectedName) {
    final selectedRating = double.tryParse(
      widget.tableData.firstWhere((fw) => fw['name'] == selectedName)['rating']!
    ) ?? 0.0;
    
    return Column(
      children: widget.tableData
          .where((fw) => fw['name'] != selectedName)
          .map((fw) {
        final rating = double.tryParse(fw['rating']!) ?? 0.0;
        final isBetter = selectedRating > rating;
        final difference = (selectedRating - rating).abs();
        final isCurrentBest = fw['name'] == bestFramework;
        
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        fw['name']!,
                        style: const TextStyle(fontSize: 14),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (isCurrentBest) ...[
                      const SizedBox(width: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          "MEJOR",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: LinearProgressIndicator(
                  value: rating / 5,
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(
                    _getFrameworkColor(fw['name']!)
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        fw['rating']!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: isBetter ? Colors.green : Colors.red,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Icon(
                        isBetter ? Icons.arrow_upward : Icons.arrow_downward,
                        size: 16,
                        color: isBetter ? Colors.green : Colors.red,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          // Mobile layout - card view
          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 16),
            itemCount: widget.tableData.length,
            itemBuilder: (context, index) {
              final framework = widget.tableData[index];
              final isSelected = selectedFramework == framework['name'];
              return _buildMobileCard(framework, isSelected);
            },
          );
        } else {
          // Tablet/Desktop layout - data table with expandable rows
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columnSpacing: 20,
                    columns: const [
                      DataColumn(label: Text('Framework', style: TextStyle(fontWeight: FontWeight.bold))),
                      DataColumn(label: Text('Lenguaje', style: TextStyle(fontWeight: FontWeight.bold))),
                      DataColumn(label: Text('Plataforma', style: TextStyle(fontWeight: FontWeight.bold))),
                      DataColumn(label: Text('Popularidad', style: TextStyle(fontWeight: FontWeight.bold))),
                      DataColumn(label: Text('', style: TextStyle(fontWeight: FontWeight.bold))),
                    ],
                    rows: widget.tableData.map((fw) {
                      final isSelected = selectedFramework == fw['name'];
                      final isBest = fw['name'] == bestFramework;
                      
                      return DataRow(
                        onSelectChanged: (_) {
                          setState(() {
                            if (selectedFramework == fw['name']) {
                              selectedFramework = null;
                            } else {
                              selectedFramework = fw['name'];
                            }
                          });
                        },
                        cells: [
                          DataCell(
                            Row(
                              children: [
                                Container(
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                    color: _getFrameworkColor(fw['name']!).withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Center(
                                    child: Text(
                                      fw['name']![0],
                                      style: TextStyle(
                                        color: _getFrameworkColor(fw['name']!),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(fw['name']!),
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
                          DataCell(Center(child: Text(fw['language']!))),
                          DataCell(Text(fw['platform']!)),
                          DataCell(Center(child: _buildRating(fw['rating']!))),
                          DataCell(Icon(
                            isSelected ? Icons.expand_less : Icons.expand_more,
                            color: Colors.grey,
                          )),
                        ],
                      );
                    }).toList(),
                  ),
                ),
                
                // Expanded comparison section for desktop
                if (selectedFramework != null) 
                  _buildDesktopComparison(selectedFramework!),
              ],
            ),
          );
        }
      },
    );
  }
  
  Widget _buildDesktopComparison(String selectedName) {
    final selectedFrameworkData = widget.tableData.firstWhere(
      (fw) => fw['name'] == selectedName
    );
    final color = _getFrameworkColor(selectedName);
    final isBest = selectedName == bestFramework;
    
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Comparativa: $selectedName',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              if (isBest) ...[
                const SizedBox(width: 12),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Text(
                    "MEJOR FRAMEWORK",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 16),
          
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInfoRow('Lenguaje', selectedFrameworkData['language']!),
                    const SizedBox(height: 12),
                    _buildInfoRow('Plataforma', selectedFrameworkData['platform']!),
                    const SizedBox(height: 12),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 100,
                          child: Text(
                            'Popularidad',
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        _buildRating(selectedFrameworkData['rating']!),
                      ],
                    ),
                  ],
                ),
              ),
              
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Características principales:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    
                    ...additionalInfo[selectedName]!.map((info) => 
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.circle, 
                              size: 8, 
                              color: info.contains("MEJOR") ? Colors.amber : Colors.grey
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                info,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: info.contains("MEJOR") ? FontWeight.bold : FontWeight.normal,
                                  color: info.contains("MEJOR") ? Colors.amber : Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ).toList(),
                  ],
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 20),
          const Text(
            'Análisis comparativo:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          
          Text(
            frameworkAnalysis[selectedName]!,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
          
          const SizedBox(height: 20),
          const Text(
            'Comparativa de popularidad:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 12),
          
          // Comparison chart
          _buildComparisonChart(selectedName),
        ],
      ),
    );
  }
  
  Widget _buildComparisonChart(String selectedName) {
    final selectedRating = double.tryParse(
      widget.tableData.firstWhere((fw) => fw['name'] == selectedName)['rating']!
    ) ?? 0.0;
    
    return Column(
      children: widget.tableData.map((fw) {
        final rating = double.tryParse(fw['rating']!) ?? 0.0;
        final isSelected = fw['name'] == selectedName;
        final color = _getFrameworkColor(fw['name']!);
        final isBest = fw['name'] == bestFramework;
        
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 6),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          decoration: BoxDecoration(
            color: isSelected ? color.withOpacity(0.1) : null,
            borderRadius: BorderRadius.circular(8),
            border: isSelected 
              ? Border.all(color: color, width: 1) 
              : null,
          ),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        fw['name']!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: isSelected ? color : Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (isBest) ...[
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          "MEJOR",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: LinearProgressIndicator(
                  value: rating / 5,
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(color),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  fw['rating']!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isSelected ? color : Colors.black,
                  ),
                ),
              ),
              if (!isSelected) 
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        selectedRating > rating 
                          ? Icons.arrow_upward 
                          : Icons.arrow_downward,
                        size: 16,
                        color: selectedRating > rating ? Colors.green : Colors.red,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        (selectedRating - rating).abs().toStringAsFixed(1),
                        style: TextStyle(
                          color: selectedRating > rating ? Colors.green : Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        );
      }).toList(),
    );
  }
}