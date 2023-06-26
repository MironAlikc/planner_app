import 'package:flutter/material.dart';
import 'package:planner_app/resources/colors.dart';
import 'package:planner_app/screen_bar/affairs_screen.dart';
import 'package:planner_app/screen_bar/goals_screen.dart';
import 'package:planner_app/screen_bar/notes_screen.dart';
import 'package:planner_app/screen_bar/tracker_screen.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget>
    with SingleTickerProviderStateMixin {
  int selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    const GoalsScreen(),
    const AffairsScreen(),
    const TrackerScreen(),
    const NotesScreen(),
    const Center(child: Text('пять')),
  ];

  @override
  Widget build(BuildContext context) {
    List<IconData> data = [
      Icons.folder_open,
      Icons.calendar_month,
      Icons.add_task,
      Icons.favorite_outline_sharp,
      Icons.person_outline_sharp,
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: _widgetOptions[selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15),
        child: Material(
          // elevation: 10,
          borderRadius: BorderRadius.circular(20),
          color: ColorsApp.mainColor,
          child: SizedBox(
            height: 50,
            width: double.infinity,
            child: ListView.builder(
              itemCount: data.length,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemBuilder: (ctx, i) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: GestureDetector(
                  onTap: () {
                    if (selectedIndex == i) return;
                    setState(() {
                      selectedIndex = i;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    width: 40,
                    decoration: BoxDecoration(
                      border: i == selectedIndex
                          ? const Border(
                              top: BorderSide(
                                width: 3.0,
                                color: Colors.white,
                              ),
                            )
                          : null,
                      gradient: i == selectedIndex
                          ? LinearGradient(
                              colors: [
                                  Colors.grey.shade700,
                                  const Color(0xFF0abab5)
                                ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)
                          : null,
                    ),
                    child: Icon(
                      data[i],
                      size: 35,
                      color: i == selectedIndex
                          ? Colors.white
                          : Colors.grey.shade700,
                    ),
                  ),
                ),
              ),
              scrollDirection: Axis.horizontal,
            ),
          ),
        ),
      ),
    );
  }
}
