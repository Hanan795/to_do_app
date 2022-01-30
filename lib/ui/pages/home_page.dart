import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/services/theme_services.dart';
import 'package:to_do_app/ui/pages/notification_screen.dart';
import 'package:to_do_app/ui/widgets/button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              ThemeServices().swithTheme();
              Get.to(NotificationScreen(payLoad: 'Title|Desc|10:10'));
            },
            icon: Icon(Icons.dark_mode)),
      ),
      body: Center(
        child: MyButton(
          label: 'Add Task',
          onTap: () {},
        ),
      ),
    );
  }
}
