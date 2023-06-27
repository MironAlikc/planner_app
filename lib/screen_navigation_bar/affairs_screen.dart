import 'package:flutter/material.dart';
import 'package:planner_app/resources/colors.dart';
import 'package:planner_app/tab_bar_affairs_screen/other_screen.dart';
import 'package:planner_app/tab_bar_affairs_screen/private_screen.dart';
import 'package:planner_app/tab_bar_affairs_screen/shopping_list_screen.dart';
import 'package:planner_app/tab_bar_affairs_screen/work_screen.dart';

class AffairsScreen extends StatefulWidget {
  const AffairsScreen({super.key});

  @override
  State<AffairsScreen> createState() => _AffairsScreenState();
}

class _AffairsScreenState extends State<AffairsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
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
          isScrollable: true,
          controller: _tabController,
          indicatorColor: ColorsApp.mainColor,
          unselectedLabelColor: Colors.grey,
          labelColor: Colors.black,
          indicatorWeight: 3.0,
          dividerColor: Colors.white,
          labelStyle: const TextStyle(fontSize: 20),
          labelPadding: const EdgeInsets.symmetric(horizontal: 5),
          tabs: const [
            Tab(text: 'Личные'),
            Tab(text: 'Работа'),
            Tab(text: 'Список покупок'),
            Tab(text: 'Другое'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          OtherScreen(),
          PrivateScreen(),
          ShoppingListScreen(),
          WorkScreen(),
        ],
      ),
    );
  }
}
