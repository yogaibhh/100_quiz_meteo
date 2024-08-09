import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'leaderboard_screen.dart';
import 'package:my_meteorology_quiz_app/models/question.dart';
import 'package:my_meteorology_quiz_app/utils/data_provider.dart';
import 'package:my_meteorology_quiz_app/screens/checkpoint_screen.dart';
import 'package:my_meteorology_quiz_app/widgets/question_widget.dart';

class QuizScreen extends StatefulWidget {
  final Map<int, List<Map<String, dynamic>>> leaderboardData;
  final int numQuestions;

  QuizScreen({required this.leaderboardData, required this.numQuestions});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late List<Question> questions;
  int currentQuestionIndex = 0;
  int score = 0;
  final List<int> checkpoints = [5, 10, 15]; // Set checkpoints setiap 5 pertanyaan

  @override
  void initState() {
    super.initState();
    loadQuestions();
  }

  void loadQuestions() async {
    List<Question> allQuestions = await DataProvider.getQuestions();
    allQuestions.shuffle();
    questions = allQuestions.take(widget.numQuestions).toList();

    for (var question in questions) {
      question.shuffleOptions();
    }

    setState(() {});
  }

  void handleOptionSelected(int selectedIndex) {
    if (questions[currentQuestionIndex].isCorrect(selectedIndex)) {
      setState(() {
        score += 1000;
      });

      if (isCheckpoint(currentQuestionIndex + 1)) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CheckpointScreen(
              currentLevel: currentQuestionIndex + 1,
              rewardAmount: score,
            ),
          ),
        ).then((_) {
          if (currentQuestionIndex < questions.length - 1) {
            setState(() {
              currentQuestionIndex++;
              questions[currentQuestionIndex].shuffleOptions();
            });
          } else {
            showResultDialog();
          }
        });
        return;
      }
    } else {
      showCorrectAnswerDialog(selectedIndex);
      return;
    }

    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        questions[currentQuestionIndex].shuffleOptions();
      });
    } else {
      showResultDialog();
    }
  }

  bool isCheckpoint(int questionIndex) {
    return checkpoints.contains(questionIndex);
  }

  void showCorrectAnswerDialog(int selectedIndex) {
    int correctIndex = questions[currentQuestionIndex].correctOptionIndex;
    String correctAnswer = questions[currentQuestionIndex].options[correctIndex];

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Jawaban Salah"),
        content: Text("Jawaban yang benar adalah: $correctAnswer"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              if (currentQuestionIndex < questions.length - 1) {
                setState(() {
                  currentQuestionIndex++;
                  questions[currentQuestionIndex].shuffleOptions();
                });
              } else {
                showResultDialog();
              }
            },
            child: Text("Lanjutkan"),
          ),
        ],
      ),
    );
  }

  void showResultDialog() {
    String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now());
    widget.leaderboardData[widget.numQuestions]?.add({'score': score, 'date': formattedDate});

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Kuis Selesai"),
        content: Text("Skor Anda: \$${score.toString()}"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              resetQuiz();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LeaderboardScreen(
                    leaderboardData: widget.leaderboardData[widget.numQuestions]!,
                  ),
                ),
              );
            },
            child: Text("Lihat Papan Peringkat"),
          ),
        ],
      ),
    );
  }

  void resetQuiz() {
    setState(() {
      currentQuestionIndex = 0;
      score = 0;
      questions.shuffle();
      questions.forEach((question) => question.shuffleOptions());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blueAccent, Colors.lightBlueAccent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Pertanyaan ${currentQuestionIndex + 1}/${widget.numQuestions}',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: LinearProgressIndicator(
                  value: (currentQuestionIndex + 1) / widget.numQuestions,
                  backgroundColor: Colors.white,
                  color: Colors.greenAccent,
                  minHeight: 8,
                ),
              ),
              Expanded(
                child: Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          questions[currentQuestionIndex].questionText,
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: questions[currentQuestionIndex].options.map((option) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                child: SizedBox(
                                  width: double.infinity, // Agar tombol menutupi seluruh lebar
                                  child: ElevatedButton(
                                    onPressed: () {
                                      handleOptionSelected(questions[currentQuestionIndex].options.indexOf(option));
                                    },
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.symmetric(vertical: 15),
                                      backgroundColor: Colors.blueGrey[50],
                                      foregroundColor: Colors.black87, // Mengganti onPrimary dengan foregroundColor
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12.0),
                                      ),
                                    ),
                                    child: Text(option, style: TextStyle(fontSize: 18)),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
