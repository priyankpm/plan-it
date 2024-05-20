import 'package:flutter/material.dart';
import 'package:to_do/View/Constant/color_utils.dart';
import 'package:to_do/View/Widgets/app_text.dart';

class TaskDetailScreen extends StatefulWidget {
  const TaskDetailScreen({super.key});

  @override
  State<TaskDetailScreen> createState() => _TaskDetailScreenState();
}

class _TaskDetailScreenState extends State<TaskDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: themeColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.045)
              .copyWith(top: height * 0.015),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.arrow_back_ios,
                color: textColor,
                size: height * 0.022,
              ),
              SizedBox(height: height * 0.02,),
              appText(title: 'Do your Homework',fontSize: width * 0.05),
              appText(title: 'Do your HomeworDo chapter 2 to 5 for next week',fontSize: width * 0.035)
            ],
          ),
        ),
      ),
    );
  }
}
