import 'package:flutter/material.dart';

class CompletedButton extends StatelessWidget {
  const CompletedButton({
    super.key,
    required this.isCompleted,
    required this.onPressed,
  });

  final bool isCompleted;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: isCompleted ? null : onPressed,
        icon: Icon(isCompleted ? Icons.check_circle : Icons.task_alt),
        label: Text(isCompleted ? "Completed" : "Mark as Completed"),
        style: ElevatedButton.styleFrom(
          backgroundColor: isCompleted ? Colors.green : Colors.deepPurpleAccent,
          foregroundColor: Colors.white,
          disabledBackgroundColor: Colors.green,
          disabledForegroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
    );
  }
}
