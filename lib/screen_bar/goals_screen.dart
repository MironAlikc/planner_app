import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:planner_app/theme/app_fonts.dart';

class GoalsScreen extends StatelessWidget {
  const GoalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'У Вас пока нет целей.',
              style: AppFonts.w700s25,
            ),
            SizedBox(height: 20),
            Text(
              'Цели должны быть ясными, простыми и записаными. Если они не записаны и их каждый день не пересматривать - это не цели. Это пожелания',
              style: AppFonts.w400s18,
            ),
          ],
        ),
      ),
    );
  }
}
