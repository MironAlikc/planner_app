import 'package:flutter/material.dart';
import 'package:planner_app/ui/navigation/main_navigation.dart';

class MyApp extends StatelessWidget {
  static final mainNavigation = MainNavigation();
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: mainNavigation.routes,
      initialRoute: mainNavigation.initialRoute,
      onGenerateRoute: mainNavigation.onGenerateRoute,
      // routes: {
      //   '/home/screen': (context) => const HomeScreen(),
      //   '/groups/form': (context) => const GroupFormWidget(),
      // },
      // initialRoute: '/home/screen',
      // home: MyHomePage(title: '',),
    );
  }
}
