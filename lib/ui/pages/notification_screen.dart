import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/ui/theme.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key, required this.payLoad}) : super(key: key);

  final String payLoad;

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  String _payLoad = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: Text(
            _payLoad.toString().split('|')[0],
            style: TextStyle(
              color: Get.isDarkMode ? Colors.white : darkGreyClr,
            ),
          ),
          backgroundColor: context.theme.backgroundColor,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Get.back(),
          )),
      body: SafeArea(
        child: Column(
          children: [
            Text(
              'Hello, Hanan',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w900,
                color: Get.isDarkMode ? Colors.white : darkGreyClr,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'You have a new reminder',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w300,
                color: Get.isDarkMode ? Colors.grey[100] : darkGreyClr,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
