// lib\constants\routine_items.dart
import 'package:routine_tracker/models/routine_item.dart';
import 'package:routine_tracker/models/routine_type.dart';

List<RoutineItem> routineItems = [
  // Morning Routine Tasks
  RoutineItem(id: 'wake-up', title: 'Wake up', type: RoutineType.morning),
  RoutineItem(id: 'pray', title: 'Pray', type: RoutineType.morning),
  RoutineItem(id: 'stretch', title: 'Stretch', type: RoutineType.morning),
  RoutineItem(id: 'boil-water', title: 'Boil water', type: RoutineType.morning),
  RoutineItem(
    id: 'brush-teeth-morning',
    title: 'Brush my teeth',
    type: RoutineType.morning,
  ),
  RoutineItem(id: 'workout', title: 'Workout', type: RoutineType.morning),
  RoutineItem(id: 'bathe-morning', title: 'Bathe', type: RoutineType.morning),
  RoutineItem(id: 'hair-care', title: 'Hair care', type: RoutineType.morning),
  RoutineItem(
    id: 'bible-study',
    title: 'Study the Bible',
    type: RoutineType.morning,
  ),

  // Night Routine Tasks
  RoutineItem(
    id: 'brush-teeth-night',
    title: 'Brush my teeth',
    type: RoutineType.night,
  ),
  RoutineItem(
    id: 'cleanse-face',
    title: 'Cleanse my face',
    type: RoutineType.night,
  ),
  RoutineItem(
    id: 'go-to-bed',
    title: 'Go to bed latest by 10:30pm',
    type: RoutineType.night,
  ),
];
