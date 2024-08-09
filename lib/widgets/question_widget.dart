import 'package:flutter/material.dart';

class QuestionWidget extends StatelessWidget {
  final String questionText;
  final List<String> options;
  final Function(int) onOptionSelected;

  const QuestionWidget({
    Key? key,
    required this.questionText,
    required this.options,
    required this.onOptionSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          questionText,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        ...options.asMap().entries.map((entry) {
          int idx = entry.key;
          String option = entry.value;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: ElevatedButton(
              onPressed: () => onOptionSelected(idx),
              child: Text(option),
            ),
          );
        }).toList(),
      ],
    );
  }
}
