import 'package:hive_flutter/hive_flutter.dart';

part 'group.g.dart';

@HiveType(typeId: 1)
class Group extends HiveObject {
  @HiveField(0)
  String name;

  // @HiveField(1)
  // HiveField? tasks;

  Group({
    required this.name,
  });
}
