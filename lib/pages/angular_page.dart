import 'package:flutter/material.dart';

class AngularPage extends StatelessWidget {
  const AngularPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Angular",
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
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icono Angular
            Center(
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: const Color(0xFFDD0031).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: const Icon(
                  Icons.change_history,
                  size: 60,
                  color: Color(0xFFDD0031),
                ),
              ),
            ),
            const SizedBox(height: 20),

            const Center(
              child: Text(
                "Angular Framework",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 8),
            const Center(
              child: Text(
                "Desarrollado por Google",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),

            const SizedBox(height: 24),

            _buildInfoCard(
              "Lenguaje: TypeScript",
              Icons.code,
              const Color(0xFFDD0031),
            ),

            const SizedBox(height: 16),

            const Text("Valoración:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),

            Row(
              children: const [
                Icon(Icons.star, color: Colors.amber, size: 20),
                Icon(Icons.star, color: Colors.amber, size: 20),
                Icon(Icons.star, color: Colors.amber, size: 20),
                Icon(Icons.star_half, color: Colors.amber, size: 20),
                Icon(Icons.star_border, color: Colors.amber, size: 20),
                SizedBox(width: 10),
                Text("3.8/5", style: TextStyle(fontWeight: FontWeight.w500)),
              ],
            ),

            const SizedBox(height: 24),

            const Text(
              "Características principales:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),

            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                _buildFeatureChip("MVC completo", Icons.architecture),
                _buildFeatureChip("TypeScript", Icons.code),
                _buildFeatureChip("RxJS y Observables", Icons.sync),
                _buildFeatureChip("CLI potente", Icons.terminal),
                _buildFeatureChip("Google support", Icons.business),
              ],
            ),

            const SizedBox(height: 24),

            _buildProsConsCard(
              "Ventajas",
              Icons.check_circle,
              Colors.green,
              [
                "Arquitectura completa para grandes proyectos",
                "Soporte oficial de Google",
                "Excelente integración con TypeScript",
                "Herramientas como Angular CLI",
                "Buen rendimiento en apps empresariales",
              ],
            ),

            const SizedBox(height: 16),

            _buildProsConsCard(
              "Desventajas",
              Icons.cancel,
              Colors.red,
              [
                "Curva de aprendizaje pronunciada",
                "Mayor complejidad que otros frameworks",
                "Menor popularidad en proyectos pequeños",
                "Pesado en comparación con Vue o React",
              ],
            ),

            const SizedBox(height: 24),

            const Text(
              "Aplicaciones destacadas:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),

            SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildAppExample("Google Cloud Console"),
                  _buildAppExample("Microsoft Office Online"),
                  _buildAppExample("Santander Banking"),
                  _buildAppExample("Forbes"),
                ],
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              "Estadísticas:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
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
                    _buildStatistic("70%", "Uso en empresas"),
                    _buildStatistic("3M+", "Devs"),
                    _buildStatistic("500k+", "Proyectos"),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              elevation: 0,
              color: Colors.white,
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.lightbulb_outline, color: Colors.amber),
                        SizedBox(width: 8),
                        Text(
                          "Justificación:",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Angular es recomendable para grandes empresas y proyectos corporativos que requieren estructura robusta, seguridad y mantenibilidad a largo plazo.",
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                elevation: 0,
                color: Color(0xFFDD0031),
                child: InkWell(
                  borderRadius: BorderRadius.circular(20.0),
                  onTap: () => Navigator.pop(context),
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.arrow_back, color: Colors.white),
                        SizedBox(width: 8),
                        Text(
                          "Volver al listado",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String text, IconData icon, Color color) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 0,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(icon, color: color),
            const SizedBox(width: 12),
            Text(text,
                style: const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureChip(String text, IconData icon) {
    return Chip(
      avatar: Icon(icon, size: 18, color: const Color(0xFFDD0031)),
      label: Text(text),
      backgroundColor: const Color(0xFFDD0031).withOpacity(0.1),
      labelStyle:
          const TextStyle(fontSize: 14, color: Colors.black87),
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
                        padding:
                            const EdgeInsets.symmetric(vertical: 4.0),
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
              color: const Color(0xFFDD0031).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Center(
              child: Text(name[0],
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color(0xFFDD0031))),
            ),
          ),
          const SizedBox(height: 8),
          Text(name,
              style: const TextStyle(
                  fontSize: 12, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }

  Widget _buildStatistic(String value, String label) {
    return Column(
      children: [
        Text(value,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFFDD0031))),
        const SizedBox(height: 4),
        Text(label,
            style:
                const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }
}
