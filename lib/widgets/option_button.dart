import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  final String optionText;
  final VoidCallback onPressed;

  const OptionButton({
    Key? key,
    required this.optionText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(optionText),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        textStyle: TextStyle(fontSize: 16),
      ),
    );
  }
}
