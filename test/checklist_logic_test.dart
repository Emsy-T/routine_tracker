// test\toggle_task_completion_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:routine_tracker/models/daily_log.dart';
import 'package:routine_tracker/models/historical_task_snapshot.dart';
import 'package:routine_tracker/logic/checklist_logic.dart';
import 'package:routine_tracker/models/routine_type.dart';

void main() {
  test('toggles a task from incomplete to complete', () {
    // Create test variables
    const tasks = [
      HistoricalTaskSnapshot(
        id: 'wake-up',
        title: 'Wake up',
        type: RoutineType.morning,
        isCompleted: false,
      ),
      HistoricalTaskSnapshot(
        id: 'pray',
        title: 'Pray',
        type: RoutineType.morning,
        isCompleted: false,
      ),
    ];

    const dailyLog = DailyLog(date: '12-09-2026', tasks: tasks);

    // Run the toggle completion function and store the results
    final result = toggleTaskCompletion(dailyLog, 'pray');

    // Check that the Pray task is now marked complete and print the isCompleted status

    /* For Loop version
    for (HistoricalTaskSnapshot snapshot in result.tasks) {
      if (snapshot.id == 'pray') {
        print("The completion status for Pray is: ");
        print(snapshot.isCompleted);
        expect(snapshot.isCompleted, true);
      }
    }
    */

    // FirstWhere version
    final prayTask = result.tasks.firstWhere(
      (snapshot) => snapshot.id == 'pray',
    );
    print(prayTask.isCompleted);
    expect(prayTask.isCompleted, true);
  });
}
