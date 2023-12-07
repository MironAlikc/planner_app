import 'package:flutter/material.dart';
import 'package:planner_app/ui/resources/colors.dart';
import 'package:planner_app/ui/tab_bar_affairs_screen/other_screen.dart';
import 'package:planner_app/ui/tab_bar_affairs_screen/work_screen.dart';
import 'package:planner_app/ui/tab_bar_tracker_screen/development_screen.dart';
import 'package:planner_app/ui/tab_bar_tracker_screen/health_screen.dart';
import 'package:planner_app/ui/tab_bar_tracker_screen/sport_screen.dart';

class TrackerScreen extends StatefulWidget {
  const TrackerScreen({super.key});

  @override
  State<TrackerScreen> createState() => _TrackerScreenState();
}

class _TrackerScreenState extends State<TrackerScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: TabBar( 
          controller: _tabController,
          isScrollable: true,
          //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          indicatorColor: ColorsApp.mainColor,
          // automaticIndicatorColorAdjustment: true,
          indicatorWeight: 4.0,
          // indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
          indicator: const UnderlineTabIndicator(
            borderSide: BorderSide(color: ColorsApp.mainColor, width: 4.0),
            //insets: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 5.0),
          ),
          indicatorSize: TabBarIndicatorSize.label,
          dividerColor: Colors.white,
          labelColor: Colors.black,
          labelStyle: const TextStyle(fontSize: 20),
          labelPadding: const EdgeInsets.symmetric(horizontal: 5),
          unselectedLabelColor: Colors.grey,

          tabs: const [
            Tab(text: 'Развитие'),
            Tab(text: 'Спорт'),
            Tab(text: 'Здоровье'),
            Tab(text: 'Другое'),
            Tab(text: 'Работа'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          DevelopmentScreen(),
          SportScreen(),
          HealtScreen(),
          OtherScreen(),
          WorkScreen(),
        ],
      ),
    );
  }
}
