import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/Controller/task_controller.dart';
import 'package:to_do/View/Constant/app_assets.dart';
import 'package:to_do/View/Constant/app_strings.dart';
import 'package:to_do/View/Constant/color_utils.dart';
import 'package:to_do/View/Screens/Task/add_task_bottomsheet.dart';
import 'package:to_do/View/Widgets/app_text.dart';
import 'package:to_do/View/Widgets/common_button.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  TaskController taskController = Get.put(TaskController());
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return GetBuilder<TaskController>(
      builder: (controller) => Scaffold(
        backgroundColor: themeColor,
        floatingActionButton: controller.taskList.isEmpty
            ? const SizedBox()
            : FloatingActionButton(
                onPressed: () {
                  controller.clearValue();
                  TaskBottomSheet().addTaskBottomSheet(context: context);
                },
                shape: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
                backgroundColor: Colors.white,
                child: const Icon(Icons.add, color: lightPrimary),
              ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05).copyWith(top: height * 0.012),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    appText(title: AppString.task, fontSize: height * 0.035, fontWeight: FontWeight.w600),
                    const Icon(
                      Icons.search,
                      color: primaryColor,
                    )
                  ],
                ),

                /// TASK LIST STREAMING
                StreamBuilder(
                  stream: controller.fireStore.collection('task').snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.data!.docs.isEmpty) {
                      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                        controller.clearTaskListValue();
                      });
                      return noTaskData(controller);
                    } else {
                      return Column(
                        children: [
                          Container(
                            height: height * 0.055,
                            width: width,
                            margin: EdgeInsets.only(top: height * 0.03),
                            decoration: BoxDecoration(
                              color: textFieldColor,
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(
                                controller.taskStatus.length,
                                (index) => Padding(
                                  padding: const EdgeInsets.all(6),
                                  child: GestureDetector(
                                    onTap: () {
                                      controller.setTaskStatus(index);
                                    },
                                    child: Container(
                                      width: width * 0.26,
                                      height: height * 0.45,
                                      decoration: BoxDecoration(
                                        color: controller.selectedStatus == index ? borderColor : Colors.transparent,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Center(
                                        child: appText(
                                          title: controller.taskStatus[index],
                                          color: controller.selectedStatus == index ? textColor : lightTextColor,
                                          fontWeight:
                                              controller.selectedStatus == index ? FontWeight.w500 : FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data?.docs.length,
                            itemBuilder: (context, index) {
                              controller.taskList = snapshot.data?.docs[index].data() as Map<String, dynamic>;
                              return snapshot.data?.docs[index].data()['status'] ==
                                      controller.taskStatus[controller.selectedStatus]
                                  ? Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        controller.taskList['title'],
                                        style: const TextStyle(color: Colors.red),
                                      ),
                                    )
                                  : const SizedBox();
                            },
                          ),
                        ],
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget noTaskData(TaskController controller) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(top: height * 0.14),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              AppAssets.noTaskVector,
              height: height * 0.35,
            ),
          ),
          appText(title: AppString.whatToWantToday, fontSize: height * 0.025),
          Padding(
            padding: EdgeInsets.symmetric(vertical: height * 0.02),
            child: appText(title: AppString.tapButtonToAddTask, fontSize: height * 0.017),
          ),
          CommonFullButton(
              onPressed: () {
                controller.clearValue();
                TaskBottomSheet().addTaskBottomSheet(context: context);
              },
              title: "Add Task")
        ],
      ),
    );
  }
}
