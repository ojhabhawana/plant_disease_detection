import 'package:cropssafe/consts/constants.dart';
import 'package:flutter/material.dart';

class PredictionButton extends StatelessWidget {
  final VoidCallback onPressed;

  const PredictionButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
            (states) => kMain,
          ),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.all(15), // Set padding
          ),
        ),
        onPressed: onPressed,
        child: Text(
          'Predict',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
