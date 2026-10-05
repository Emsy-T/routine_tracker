// lib\logic\checklist_logic.dart

import 'package:routine_tracker/models/daily_log.dart';
import 'package:routine_tracker/models/historical_task_snapshot.dart';
import 'package:routine_tracker/models/routine_item.dart';

// Create a function that constructs the Daily Log
createDailyLog(String date, List<RoutineItem> routineItems) {
  // Create a variable to store the list of snaphots for the tasks (routine items)
  List<HistoricalTaskSnapshot> snapshots = [];

  // Ensure that each task in the routine items list is captured and added to the snapshots list
  for (RoutineItem routineItem in routineItems) {
    var snapshot = HistoricalTaskSnapshot(
      id: routineItem.id,
      title: routineItem.title,
      type: routineItem.type,
      // Each task should be marked incomplete by default
      isCompleted: false,
    );
    snapshots.add(snapshot);
  }

  // Return the Daily Log with its date and tasks
  return DailyLog(date: date, tasks: snapshots);
}

DailyLog toggleTaskCompletion(DailyLog dailyLog, String taskId) {
  List<HistoricalTaskSnapshot> snapshots = [];
  for (HistoricalTaskSnapshot snapshot in dailyLog.tasks) {
    if (snapshot.id == taskId) {
      snapshot = snapshot.copyWith(isCompleted: !snapshot.isCompleted);
    }

    snapshots.add(snapshot);
  }
  var newDailyLog = DailyLog(date: dailyLog.date, tasks: snapshots);
  return newDailyLog;
}
