import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/models/task.dart';

class TaskController extends GetxController {
  final taskList = <Task>[
    Task(
      title: 'Title 1',
      note: 'Note Something',
      isCompleted: 0,
      startTime: DateFormat('hh:mm a')
          .format(DateTime.now().add(const Duration(minutes: 1))),
      // endTime: '16:40',
      color: 1,
    ),
    // Task(
    //   title: 'Title 2',
    //   note: 'Note Something',
    //   isCompleted: 1,
    //   startTime: '12:50',
    //   endTime: '16:40',
    //   color: 2,
    // ),
    // Task(
    //   title: 'Title 3',
    //   note: 'Note Something',
    //   isCompleted: 0,
    //   startTime: '12:50',
    //   endTime: '16:40',
    //   color: 3,
    // ),
  ];

  addTask({Task? task}) {
    
  }

  getTasks() {}
}
