import 'package:flutter/material.dart';
import 'package:my_meteorology_quiz_app/screens/selection_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<int, List<Map<String, dynamic>>> leaderboardData = {
      5: [],
      10: [],
      20: [],
      30: [],
      40: [],
      50: []
    };

    return MaterialApp(
      title: 'Kuis Meteorologi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(leaderboardData: leaderboardData),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final Map<int, List<Map<String, dynamic>>> leaderboardData;

  HomeScreen({required this.leaderboardData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/skyhome.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'Quiz Meteo',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        offset: Offset(3.0, 3.0),
                        blurRadius: 3.0,
                        color: Colors.black45,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SelectionScreen(leaderboardData: leaderboardData),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent, // Perbarui primary menjadi backgroundColor
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  textStyle: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: Text('Kerjakan Kuis'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
