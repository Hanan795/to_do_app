import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../size_config.dart';
import '../theme.dart';

class InputField extends StatelessWidget {
  const InputField(
      {Key? key,
      required this.title,
      required this.hint,
      this.controller,
      this.widget})
      : super(key: key);

  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Themes().titleStyle,
          ),
          Container(
              width: SizeConfig.screenWidth,
              height: 52,
              padding: const EdgeInsets.only(top: 8.0),
              margin: const EdgeInsets.only(left: 14.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey)),
              child: SingleChildScrollView(
                child: Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                      controller: controller,
                      autofocus: false,
                      style: Themes().subTitleStyle,
                      cursorColor:
                          Get.isDarkMode ? Colors.grey[100] : Colors.grey[700],
                      readOnly: widget != null ? true : false,
                      decoration: InputDecoration(
                        hintText: hint,
                        hintStyle: Themes().subTitleStyle,
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                width: 0,
                                color: context.theme.backgroundColor)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                width: 0,
                                color: context.theme.backgroundColor)),
                      ),
                    )),
                    widget ?? Container()
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
