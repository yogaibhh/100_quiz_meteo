class Question {
  String questionText;
  List<String> options;
  int correctOptionIndex;

  Question({required this.questionText, required this.options, required this.correctOptionIndex});

  // Method untuk mengacak jawaban dan mengembalikan indeks baru dari jawaban yang benar
  void shuffleOptions() {
    // Simpan jawaban yang benar
    String correctAnswer = options[correctOptionIndex];

    // Acak opsi jawaban
    options.shuffle();

    // Perbarui indeks jawaban yang benar
    correctOptionIndex = options.indexOf(correctAnswer);
  }

  // Method untuk memeriksa apakah jawaban yang dipilih benar
  bool isCorrect(int selectedIndex) {
    return selectedIndex == correctOptionIndex;
  }
}
