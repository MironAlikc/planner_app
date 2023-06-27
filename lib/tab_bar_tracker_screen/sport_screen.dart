import 'package:flutter/material.dart';
import 'package:planner_app/theme/app_fonts.dart';

class SportScreen extends StatelessWidget {
  const SportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'К цели - через привычки.',
              style: AppFonts.w700s25,
            ),
            SizedBox(height: 20),
            Text(
              'Трекер привычек - это инструмент, который помагает Вам формировать, закреплять новые, полезные привычки и избавляться от старых, вредных',
              style: AppFonts.w400s18,
            ),
          ],
        ),
      ),
    );
  }
}
