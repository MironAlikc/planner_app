import 'package:flutter/material.dart';
import 'package:planner_app/bottom_navigation_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        actions: const [
          Icon(Icons.more_vert),
        ],
        backgroundColor: Colors.amberAccent,
      ),
      body: const BottomNavigationBarWidget(),
    );
  }
}
