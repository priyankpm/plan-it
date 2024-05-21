import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/Controller/task_controller.dart';
import 'package:to_do/View/Constant/app_strings.dart';
import 'package:to_do/View/Constant/color_utils.dart';
import 'package:to_do/View/Constant/font_utils.dart';
import 'package:to_do/View/Constant/show_toast.dart';
import 'package:to_do/View/Widgets/app_text.dart';
import 'package:to_do/View/Widgets/common_button.dart';
import 'package:to_do/View/Widgets/common_textfield.dart';

class TaskBottomSheet {
  TaskController taskController = Get.put(TaskController());
  addTaskBottomSheet({required BuildContext context, required String isFrom, String? taskDocumentId}) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return showModalBottomSheet(
      backgroundColor: bottomSheetColor,
      shape: const OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      context: context,
      isScrollControlled: true,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          return GetBuilder<TaskController>(
            builder: (controller) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05)
                    .copyWith(top: height * 0.02, bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    appText(title: AppString.addTask, fontSize: height * 0.022, fontWeight: FontWeight.w500),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: height * 0.018),
                      child: CommonTextField(
                        hint: AppString.enterTitle,
                        controller: controller.titleController,
                        contentPaddingVertical: height * 0.012,
                        color: bottomSheetColor,
                        textHintColor: textColor,
                      ),
                    ),
                    CommonTextField(
                      hint: AppString.enterDescription,
                      controller: controller.descriptionController,
                      contentPaddingVertical: height * 0.012,
                      color: bottomSheetColor,
                      textHintColor: textColor,
                    ),
                    GestureDetector(
                      onTap: () async {
                        await controller.selectTaskDate(context);
                        setState(() {});
                      },
                      child: Container(
                        width: width,
                        margin: EdgeInsets.symmetric(vertical: height * 0.018),
                        padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.height * 0.012,
                            horizontal: MediaQuery.of(context).size.width * 0.04),
                        decoration: BoxDecoration(
                          border: Border.all(color: borderColor, width: 0.8),
                          borderRadius: BorderRadius.circular(4),
                          color: bottomSheetColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            appText(title: controller.dob, color: textColor, fontSize: 17),
                            const Icon(
                              Icons.calendar_month,
                              color: textColor,
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        await controller.selectTaskTime(context);
                        setState(() {});
                      },
                      child: Container(
                        width: width,
                        padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.height * 0.012,
                            horizontal: MediaQuery.of(context).size.width * 0.04),
                        decoration: BoxDecoration(
                          border: Border.all(color: borderColor, width: 0.8),
                          borderRadius: BorderRadius.circular(4),
                          color: bottomSheetColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            appText(title: controller.time, color: textColor, fontSize: 17),
                            const Icon(
                              Icons.watch_later_outlined,
                              color: textColor,
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: width,
                      height: height * 0.055,
                      margin: EdgeInsets.symmetric(vertical: height * 0.018),
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.012,
                          horizontal: MediaQuery.of(context).size.width * 0.04),
                      decoration: BoxDecoration(
                        border: Border.all(color: borderColor, width: 0.8),
                        borderRadius: BorderRadius.circular(4),
                        color: bottomSheetColor,
                      ),
                      child: DropdownButton(
                        padding: EdgeInsets.zero,
                        elevation: 0,
                        disabledHint: const SizedBox(),
                        underline: const SizedBox(),
                        isExpanded: true,
                        value: controller.selectedStatusValue,
                        style: FontUtils.h17(fontColor: textColor),
                        dropdownColor: textFieldColor,
                        // value: controller.taskStatus[0],
                        items: controller.taskStatus.map((items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (value) {
                          controller.selectedStatusValue = value.toString();
                          setState(() {});
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height * 0.02, bottom: height * 0.02),
                      child: CommonFullButton(
                        isLoading: controller.loader,
                        onPressed: () {
                          if (controller.titleController.text.isEmpty) {
                            showErrorToast(AppString.enterTitle);
                          } else if (controller.descriptionController.text.isEmpty) {
                            showErrorToast(AppString.enterDescription);
                          } else if (controller.dob == 'Select Date') {
                            showErrorToast(AppString.selectDate);
                          } else if (controller.time == 'Select Time') {
                            showErrorToast(AppString.selectTime);
                          } else {
                            isFrom == 'addSection'
                                ? controller.addTaskData()
                                : controller.updateTaskData(id: taskDocumentId ?? '');
                          }
                        },
                        title: isFrom == 'addSection' ? AppString.addTask : AppString.editTask,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: height * 0.04),
                      child: CommonFullButton(
                        onPressed: () {
                          Get.back();
                        },
                        title: AppString.cancel,
                        showBorder: true,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
