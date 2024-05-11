import 'package:my_app/models/task.dart';
import 'package:my_app/shared/shared.dart';

class TaskController {
  List<Task> getTasks() {
    return dummyTaskes;
  }

  List<Task> getVLTasks() {
    return vlTasks;
  }

  List<Task> getCompletedTasks() {
    return Completed;
  }
}
