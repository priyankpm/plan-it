import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:to_do/Controller/task_controller.dart';
import 'package:to_do/View/Constant/app_strings.dart';
import 'package:to_do/View/Constant/color_utils.dart';
import 'package:to_do/View/Screens/Task/add_task_bottomsheet.dart';
import 'package:to_do/View/Widgets/app_text.dart';
import 'package:to_do/View/Widgets/common_button.dart';

class TaskDetailScreen extends StatefulWidget {
  const TaskDetailScreen({super.key, required this.taskDetails, required this.id});
  final Map<String, dynamic> taskDetails;
  final String id;
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
        child: GetBuilder<TaskController>(builder: (controller) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.045).copyWith(top: height * 0.015),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: textColor,
                    size: height * 0.022,
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                SizedBox(
                  width: width,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                    child: appText(title: widget.taskDetails['title'], fontSize: width * 0.05),
                  ),
                ),
                SizedBox(
                  width: width,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.05)
                        .copyWith(top: height * 0.01, bottom: height * 0.1),
                    child: appText(title: widget.taskDetails['description'], fontSize: width * 0.035, color: appGrey),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.calendar_month,
                      color: textColor,
                    ),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    appText(title: 'Task Date:', fontSize: height * 0.02),
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(color: bottomSheetColor, borderRadius: BorderRadius.circular(5)),
                      padding: EdgeInsets.symmetric(vertical: height * 0.010, horizontal: width * 0.04),
                      child: appText(
                        title: DateFormat('dd-MM-yyyy').format(controller.taskList['statusTime'].toDate()),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: height * 0.04),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.watch_later_outlined,
                        color: textColor,
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      appText(title: 'Task Time:', fontSize: height * 0.02),
                      const Spacer(),
                      Container(
                        decoration: BoxDecoration(color: bottomSheetColor, borderRadius: BorderRadius.circular(5)),
                        padding: EdgeInsets.symmetric(vertical: height * 0.010, horizontal: width * 0.04),
                        child: appText(title: DateFormat('HH:MM').format(controller.taskList['statusTime'].toDate())),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: height * 0.04),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.notification_important,
                        color: textColor,
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      appText(title: 'Status:', fontSize: height * 0.02),
                      const Spacer(),
                      Container(
                        decoration: BoxDecoration(color: bottomSheetColor, borderRadius: BorderRadius.circular(5)),
                        padding: EdgeInsets.symmetric(vertical: height * 0.010, horizontal: width * 0.04),
                        child: appText(title: widget.taskDetails['status']),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    deletePopUp(
                        title: widget.taskDetails['title'], id: widget.id, controller: controller, context: context);
                  },
                  child: Container(
                    width: width,
                    color: Colors.transparent,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.delete_outline,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: width * 0.02,
                        ),
                        appText(title: 'Delete Task', fontSize: height * 0.02, color: Colors.red),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.only(bottom: height * 0.06),
                  child: CommonFullButton(
                      onPressed: () {
                        controller.clearValue();
                        controller.assignValue(widget.taskDetails);
                        TaskBottomSheet()
                            .addTaskBottomSheet(context: context, isFrom: 'editSection', taskDocumentId: widget.id);
                      },
                      title: 'Edit Task'),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}

deletePopUp(
    {required String title, required String id, required TaskController controller, required BuildContext context}) {
  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: bottomSheetColor,
      contentPadding: EdgeInsets.zero,
      actions: [
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: height * 0.015),
            child:
                appText(title: 'Delete Task', color: textColor, fontWeight: FontWeight.w600, fontSize: height * 0.016),
          ),
        ),
        const Divider(
          height: 0,
        ),
        Padding(
          padding: EdgeInsets.only(top: height * 0.015, bottom: height * 0.02),
          child: Center(
            child: appText(
                title: 'Are You sure you want to delete this task?\nTask title : $title',
                fontSize: height * 0.018,
                fontWeight: FontWeight.w500),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: CommonFullButton(
                onPressed: () {
                  Get.back();
                },
                title: AppString.cancel,
                showBorder: true,
              ),
            ),
            SizedBox(
              width: width * 0.05,
            ),
            Expanded(
              child: CommonFullButton(
                onPressed: () {
                  controller.deleteTaskData(id: id, isMainScreen: false);
                },
                title: AppString.delete,
                isLoading: controller.loader,
              ),
            ),
          ],
        )
      ],
    ),
  );
}
