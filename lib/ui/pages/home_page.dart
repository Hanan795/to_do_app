import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/controllers/task_controller.dart';
import 'package:to_do_app/models/task.dart';
import 'package:to_do_app/services/notification_services.dart';
import 'package:to_do_app/services/theme_services.dart';
import 'package:to_do_app/ui/pages/add_task_page.dart';
import 'package:to_do_app/ui/size_config.dart';
import 'package:to_do_app/ui/theme.dart';
import 'package:to_do_app/ui/widgets/button.dart';
import 'package:to_do_app/ui/widgets/task_tile.dart';

import '../theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TaskController _taskController = Get.put(TaskController());
  DateTime _selectedDate = DateTime.now();
  late NotifyHelper notifyHelper;

  @override
  void initState() {
    notifyHelper = NotifyHelper();
    notifyHelper.initializationNotification();
    // notifyHelper.requestLinuxPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: _appBar(context),
      body: SingleChildScrollView(
        child: Column(children: [
          _addTaskBar(),
          _addDateBar(),
          const SizedBox(
            height: 6.0,
          ),
          _showTasks(),
        ]),
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Get.isDarkMode
              ? Icons.wb_sunny_outlined
              : Icons.nightlight_round_outlined,
          size: 24,
          color: Get.isDarkMode ? white : darkGreyClr,
        ),
        onPressed: () {
          ThemeServices().swithTheme();
          notifyHelper.displayNotification(
              title: 'Theme Changed!',
              body: 'You switched th theme ofthe app now.');
          notifyHelper.ScheduledNotification();
        },
      ),
      elevation: 0,
      backgroundColor: context.theme.backgroundColor,
      actions: const [
        CircleAvatar(
          radius: 18,
          backgroundImage: AssetImage('assets/images/person.jpeg'),
        ),
        SizedBox(
          width: 20,
        )
      ],
    );
  }

  _addTaskBar() {
    return Container(
        margin: const EdgeInsets.only(
          left: 20.0,
          right: 10.0,
          top: 10.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat.yMMMMd().format(DateTime.now()),
                  style: Themes().headingStyle,
                ),
                Text(
                  'Today',
                  style: Themes().subHeadingStyle,
                )
              ],
            ),
            MyButton(
              label: '+ Add Task',
              onTap: () async {
                await Get.to(const AddTaskPage());
                _taskController.getTasks();
              },
            )
          ],
        ));
  }

  _addDateBar() {
    return Container(
      margin: const EdgeInsets.only(top: 6.0, left: 20.0),
      child: DatePicker(
        DateTime.now(),
        initialSelectedDate: DateTime.now(),
        width: 70,
        height: 100,
        selectedTextColor: white,
        selectionColor: primaryClr,
        dateTextStyle: GoogleFonts.lato(
            textStyle: const TextStyle(
                color: Colors.grey, fontSize: 20, fontWeight: FontWeight.w600)),
        dayTextStyle: GoogleFonts.lato(
            textStyle: const TextStyle(
                color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w600)),
        monthTextStyle: GoogleFonts.lato(
            textStyle: const TextStyle(
                color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w600)),
        onDateChange: (newDate) {
          setState(() {
            _selectedDate = newDate;
          });
        },
      ),
    );
  }

  _showTasks() {
    // return Expanded(child: Obx(() {
    //   if (_taskController.taskList.isEmpty) {
    //     return _noTaskMsg();
    //   } else {
    //     return Container();
    //   }
    // }));
    // return
    // Expanded(child:
    // _noTaskMsg();
    return TaskTile(
      task: Task(
        id: 1,
        title: 'Title 1',
        note: 'Note Something',
        isCompleted: 1,
        startTime: '20:15',
        endTime: '05:30',
        color: 0,
        remind: 0,
        repeat: '',
      ),
    );
  }

  _noTaskMsg() {
    return Stack(
      children: [
        AnimatedPositioned(
          duration: const Duration(milliseconds: 2000),
          child: SingleChildScrollView(
            child: Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              direction: SizeConfig.orientation == Orientation.landscape
                  ? Axis.horizontal
                  : Axis.vertical,
              children: [
                SizeConfig.orientation == Orientation.landscape
                    ? const SizedBox(
                        height: 6.0,
                      )
                    : const SizedBox(
                        height: 220.0,
                      ),
                SvgPicture.asset(
                  'assets/images/task.svg',
                  color: primaryClr.withOpacity(0.5),
                  height: 90.0,
                  semanticsLabel: 'Task',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 10.0),
                  child: Text(
                    'You don\'t have any tasks yet.\nAdd new tasks to make your days productive.',
                    style: Themes().subTitleStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizeConfig.orientation == Orientation.landscape
                    ? const SizedBox(
                        height: 120.0,
                      )
                    : const SizedBox(
                        height: 180.0,
                      ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
