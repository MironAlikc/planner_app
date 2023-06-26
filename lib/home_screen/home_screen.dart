import 'package:flutter/material.dart';
import 'package:planner_app/resources/colors.dart';
import 'package:planner_app/widgets/bottom_navigation_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BottomNavigationBarWidget(),
    );
  }
}


// class HomeAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
//   const HomeAppBarWidget({
//     super.key,
//     required this.title,
//   });
//   final String title;

//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       title: Text(title),
//       actions: const [
//         Icon(Icons.more_vert),
//       ],
//       backgroundColor: Colors.white,
//     );
//   }
// }
