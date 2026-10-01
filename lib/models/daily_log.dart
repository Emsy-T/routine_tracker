// lib\models\daily_log.dart
// A daily log is like a copy of the app's routine checklist for a specific day, which the user can edit by checking off tasks. It records the completed tasks and checks whether or not the day counts as complete.

class DailyLog {
  // The date of the daily log is the primary index by which the app references each day's checklist record
  final String date;

  // The ids of every task that has been ticked for the day
  final List<String> completedTaskIds;

  // This is only true if all the tasks for the day have been ticked
  final bool isFullyComplete;

  const DailyLog({
    required this.date,
    required this.completedTaskIds,
    required this.isFullyComplete,
  });

  // This creates a fresh, blank sheet for a new day
  // No tasks are ticked AND the day is not fully complete
  factory DailyLog.empty(String date) {
    return DailyLog(
      date: date,
      completedTaskIds: const [],
      isFullyComplete: false,
    );
  }

  // Returns a copy of the log with some fields changed
  DailyLog copyWith({
    List<String>?
    completedTaskIds, // the new list of ticked tasks, if available
    bool? isFullyComplete, // new completion status, if provided
  }) {
    return DailyLog(
      date: date,
      // For the completedTaskIds and isFullyComplete, the following code ensures that the Daily Log returns their new values if they have any, or else return their old values.
      completedTaskIds: completedTaskIds ?? this.completedTaskIds,
      isFullyComplete: isFullyComplete ?? this.isFullyComplete,
    );
  }

  // Converts the Daily Log into a Map for Hive to save it
  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'completedTaskIds': completedTaskIds,
      'isFullyComplete': isFullyComplete,
    };
  }

  // Rebuilds a log from a Map that Hive can read back from storage
  factory DailyLog.fromMap(Map<dynamic, dynamic> map) {
    return DailyLog(
      date: map['date'] as String,
      completedTaskIds: List<String>.from(map['completedTaskIds'] as List),
      isFullyComplete: map['isFullyComplete'] as bool,
    );
  }
}
