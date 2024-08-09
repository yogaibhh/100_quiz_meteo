import 'package:flutter/material.dart';

class LearningScreen extends StatelessWidget {
  final List<Map<String, dynamic>> learningMaterials = [
    {
      'title': 'Lapisan Atmosfer',
      'content': 'Atmosfer bumi terdiri dari lapisan-lapisan seperti troposfer, stratosfer, mesosfer, dan termosfer.'
    },
    {
      'title': 'Fenomena La Niña',
      'content': 'La Niña adalah fenomena iklim yang ditandai dengan pendinginan suhu permukaan laut di Samudra Pasifik.'
    },
    {
      'title': 'Efek Rumah Kaca',
      'content': 'Efek rumah kaca terjadi ketika gas-gas di atmosfer menjebak panas, meningkatkan suhu global.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Materi Pembelajaran'),
      ),
      body: ListView.builder(
        itemCount: learningMaterials.length,
        itemBuilder: (context, index) {
          final material = learningMaterials[index];
          return Card(
            child: ListTile(
              title: Text(material['title']),
              subtitle: Text(material['content']),
            ),
          );
        },
      ),
    );
  }
}
