import 'package:flutter/material.dart';

import 'package:planner_app/ui/group_form/group_form_widget.dart';
import 'package:planner_app/ui/home_screen/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/home/screen': (context) => const HomeScreen(),
        '/groups/form': (context) => const GroupFormWidget(),
      },
      initialRoute: '/home/screen',
      // home: MyHomePage(title: '',),
    );
  }
}
