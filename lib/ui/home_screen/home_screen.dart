import 'package:flutter/material.dart';
import 'package:planner_app/ui/widgets/bottom_navigation_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BottomNavigationBarWidget(),
    );
  }
}
