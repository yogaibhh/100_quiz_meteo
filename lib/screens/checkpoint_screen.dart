import 'package:flutter/material.dart';

class CheckpointScreen extends StatelessWidget {
  final int currentLevel;
  final int rewardAmount;

  CheckpointScreen({required this.currentLevel, required this.rewardAmount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkpoint Tercapai!'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Anda telah mencapai level $currentLevel!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Reward Anda: \$${rewardAmount.toString()}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Lanjutkan'),
            ),
          ],
        ),
      ),
    );
  }
}
