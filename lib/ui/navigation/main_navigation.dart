import 'package:flutter/material.dart';
import 'package:planner_app/ui/group_form/group_form_widget.dart';
import 'package:planner_app/ui/groups/groups_widget.dart';
import 'package:planner_app/ui/home_screen/home_screen.dart';
import 'package:planner_app/ui/task_form/task_form_widget.dart';
import 'package:planner_app/ui/tasks/tasks_widget.dart';

abstract class MainNavigationRouteNames {
  static const homeScreen = '/';
  static const groups = '/groups';
  static const groupsFrom = '/groupForm';
  static const tasks = '/tasks';
  static const tasksForm = '/tasks/form';
}

class MainNavigation {
  final initialRoute = MainNavigationRouteNames.homeScreen;
  final routes = <String, StatefulWidget Function(dynamic)>{
    MainNavigationRouteNames.homeScreen: (context) => const HomeScreen(),
    MainNavigationRouteNames.groups: (context) => const GroupsWidget(),
    MainNavigationRouteNames.groupsFrom: (context) => const GroupFormWidget(),
  };

  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigationRouteNames.tasks:
        final configuration = settings.arguments as TasksWidgetConfiguration;
        return MaterialPageRoute(
          builder: (context) => TasksWidget(configuration: configuration),
        );
      case MainNavigationRouteNames.tasksForm:
        final groupKey = settings.arguments as int;
        return MaterialPageRoute(
          builder: (context) => TaskFormWidget(groupKey: groupKey),
        );
      default:
        const widget = Text('Navigation Error!!!');
        return MaterialPageRoute(builder: (context) => widget);
    }
  }
}
