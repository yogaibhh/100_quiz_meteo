import 'package:flutter/material.dart';

class LeaderboardScreen extends StatelessWidget {
  final List<Map<String, dynamic>> leaderboardData;

  LeaderboardScreen({required this.leaderboardData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Papan Peringkat'),
        backgroundColor: Colors.blueAccent,
      ),
      body: leaderboardData.isEmpty
          ? Center(
              child: Text(
                'Belum ada skor yang tercatat.',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: leaderboardData.length,
              itemBuilder: (context, index) {
                final entry = leaderboardData[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: index == 0
                        ? Colors.yellow[700]
                        : index == 1
                            ? Colors.grey
                            : index == 2
                                ? Colors.brown
                                : Colors.blueAccent,
                    child: Text(
                      '${index + 1}',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  title: Text(
                    'Skor: ${entry['score']}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    'Tanggal: ${entry['date']}',
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                  trailing: Icon(
                    Icons.star,
                    color: index < 3 ? Colors.amber : Colors.grey,
                  ),
                );
              },
            ),
    );
  }
}
