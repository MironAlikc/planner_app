import 'package:flutter/material.dart';
import 'package:planner_app/ui/widgets/bottom_navigation_bar_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BottomNavigationBarWidget(),
    );
  }
}
