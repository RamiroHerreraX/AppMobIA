import 'package:flutter/material.dart';
import 'framework.dart';

class FrameworkDetailPage extends StatelessWidget {
  final Framework framework;

  const FrameworkDetailPage({super.key, required this.framework});

  Widget _buildSection(String title, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 6),
        ...items.map((e) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("• ",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Expanded(child: Text(e)),
                ],
              ),
            )),
        const SizedBox(height: 12),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(framework.name)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Lenguaje principal: ${framework.language}",
                  style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 16),
              _buildSection("Ventajas", framework.advantages),
              _buildSection("Desventajas", framework.disadvantages),
              _buildSection("Ejemplos de uso", framework.examples),
              Text(
                "Justificación:",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              Text(framework.justification),
            ],
          ),
        ),
      ),
    );
  }
}
