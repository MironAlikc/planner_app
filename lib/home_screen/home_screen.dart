import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:planner_app/bottom_navigation_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}
