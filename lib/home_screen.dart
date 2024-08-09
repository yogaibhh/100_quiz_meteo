ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LeaderboardScreen()),
    );
  },
  child: Text('Papan Peringkat'),
  style: ElevatedButton.styleFrom(
    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
    textStyle: TextStyle(fontSize: 18),
  ),
),
