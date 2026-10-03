// lib\models\historical_task_snapshot.dart

import 'package:routine_tracker/models/routine_type.dart';

class HistoricalTaskSnapshot {
  final String id;
  final String title;
  final RoutineType type;
  final bool isCompleted;

  const HistoricalTaskSnapshot({
    required this.id,
    required this.title,
    required this.type,
    required this.isCompleted,
  });

  // Convert the Historical Task Snapshot into a data format that can be saved
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'type': type.name,
      'isCompleted': isCompleted,
    };
  }

  factory HistoricalTaskSnapshot.fromMap(Map<dynamic, dynamic> map) {
    return HistoricalTaskSnapshot(
      id: map['id'] as String,
      title: map['title'] as String,
      type: RoutineType.values.firstWhere(
        (element) => element.name == map['type'] as String,
      ),
      isCompleted: map['isCompleted'] as bool,
    );
  }
}
