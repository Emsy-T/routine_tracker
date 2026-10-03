// lib\models\routine_item.dart
// The routine item class is the template for creating each task with an id, title, and type

import 'package:routine_tracker/models/routine_type.dart';

class RoutineItem {
  final String id;
  final String title;
  final RoutineType type;

  const RoutineItem({
    required this.id,
    required this.title,
    required this.type,
  });
}
