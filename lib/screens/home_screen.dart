import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Latar belakang gambar
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/skyhome.png'),
                fit: BoxFit.cover, // Menutupi seluruh layar dengan gambar
              ),
            ),
          ),
          // Konten di atas latar belakang
          Center(
            child: Text(
              'Welcome to Quiz Meteo',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: [
                  Shadow(
                    offset: Offset(2.0, 2.0),
                    blurRadius: 3.0,
                    color: Colors.black45,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
