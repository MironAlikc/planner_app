import 'package:flutter/material.dart';
import 'package:planner_app/ui/theme/app_fonts.dart';

class ShoppingListScreen extends StatelessWidget {
  const ShoppingListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'У Вас пока нет задач.',
              style: AppFonts.w700s25,
            ),
            SizedBox(height: 20),
            Text(
              'Диспетчер задач - эффективное средство для планирования и управления повседневными задачами. Совершенствуйтесь и повышайте производительность отслеживая статус выполнения ежедненвых дел.',
              style: AppFonts.w400s18,
              // textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
