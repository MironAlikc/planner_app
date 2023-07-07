import 'package:hive_flutter/hive_flutter.dart';
part 'group.g.dart';
@HiveType(typeId: 1)
class Group {
//last used HiveField key 1

  @HiveField(0)
  String name;

  Group({
    required this.name,
  });
}
