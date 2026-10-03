// lib\models\daily_log.dart
// A daily log is like a copy of the app's routine checklist for a specific day, which the user can edit by checking off tasks. It records the completed tasks and checks whether or not the day counts as complete.

import 'package:routine_tracker/models/historical_task_snapshot.dart';

class DailyLog {
  // The date of the daily log is the primary index by which the app references each day's record
  final String date;

  // The record of the tasks for the day
  final List<HistoricalTaskSnapshot> tasks;

  const DailyLog({required this.date, required this.tasks});

  // This creates a fresh, blank sheet for a new day
  // No tasks are ticked AND the day is not fully complete
  factory DailyLog.empty(String date) {
    return DailyLog(date: date, tasks: const []);
  }

  // Returns a copy of the log with some fields changed
  DailyLog copyWith({
    List<HistoricalTaskSnapshot>? tasks, // the new list of tasks, if available
  }) {
    return DailyLog(
      date: date,
      // The following code ensures that the Daily Log returns the new tasks if there are any, else it returns the old values.
      tasks: tasks ?? this.tasks,
    );
  }

  // Converts the Daily Log into a Map for Hive to save it
  Map<String, dynamic> toMap() {
    return {'date': date, 'tasks': tasks.map((task) => task.toMap()).toList()};
  }

  // Rebuilds a log from a Map that Hive can read back from storage
  factory DailyLog.fromMap(Map<dynamic, dynamic> map) {
    return DailyLog(
      date: map['date'] as String,
      tasks: (map['tasks'] as List)
          .map((task) => HistoricalTaskSnapshot.fromMap(task))
          .toList(),
    );
  }
}
