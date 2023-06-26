import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GoalsScreen extends StatelessWidget {
  const GoalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text('У Вас пока нет целей'),
      ),
    );
  }
}
