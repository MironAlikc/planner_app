import 'package:flutter/material.dart';
import 'package:planner_app/resources/colors.dart';
import 'package:planner_app/screen_bar/affairs_screen.dart';
import 'package:planner_app/screen_bar/finance_screen.dart';
import 'package:planner_app/screen_bar/goals_screen.dart';
import 'package:planner_app/screen_bar/notes_screen.dart';
import 'package:planner_app/screen_bar/tracker_screen.dart';
import 'package:planner_app/theme/app_fonts.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  final List<String> _appBarTitles = [
    'Цели',
    'Дела',
    'Трекер',
    'Заметки',
    'Финансы',
  ];
  final List<List<IconData>> _appBarIcons = [
    [Icons.home],
    [Icons.business, Icons.map],
    [Icons.business, Icons.map],
    [Icons.business, Icons.map],
    [Icons.school, Icons.notifications, Icons.favorite],
  ];

  final List<Widget> _widgetOptions = <Widget>[
    const GoalsScreen(),
    const AffairsScreen(),
    const TrackerScreen(),
    const NotesScreen(),
    const FinanceScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<IconData> data = [
      Icons.folder_open,
      Icons.notes_rounded,
      Icons.track_changes,
      Icons.favorite_outline_sharp,
      Icons.person_outline_sharp,
    ];

    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: const Icon(Icons.volume_up),
                      tooltip: '',
                      onPressed: () {},
                    ),
                  ),
                  Text(
                    'Planner',
                    style: AppFonts.w700s25,
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text('Войти'),
                    ),
                  )
                ],
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
              ),
              title: const Text(
                'Planner Premium',
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.home,
              ),
              title: const Text('Темы'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.business,
              ),
              title: const Text('Language'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.school,
              ),
              title: const Text('Настройки'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.close,
              ),
              title: const Text('Подержать проект'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
              ),
              title: const Text('Поделиться'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.info,
              ),
              title: const Text('Обратная связь'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.arrow_forward),
              title: const Text('Оценить нас'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Spacer(),
            Text('version: 1.0.0'),
            SizedBox(height: 20),
          ],
        ),
      ),
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(_appBarTitles[_selectedIndex]),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: _appBarIcons[_selectedIndex].map((icon) {
                  return IconButton(
                    icon: Icon(icon),
                    onPressed: () {},
                  );

                  //  Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 10),
                  //   child: Icon(icon, size: 20),
                  // );
                }).toList(),
              ),
            ),
          ]),
      backgroundColor: Colors.white,
      body: _widgetOptions[_selectedIndex],
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
                    if (_selectedIndex == i) return;
                    setState(() {
                      _selectedIndex = i;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    width: 40,
                    decoration: BoxDecoration(
                      border: i == _selectedIndex
                          ? const Border(
                              top: BorderSide(
                                width: 3.0,
                                color: Colors.white,
                              ),
                            )
                          : null,
                      gradient: i == _selectedIndex
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
                      color: i == _selectedIndex
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
