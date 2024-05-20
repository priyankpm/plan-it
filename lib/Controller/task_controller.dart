import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/View/Constant/color_utils.dart';
import 'package:intl/intl.dart';
import 'package:to_do/View/Constant/show_toast.dart';

class TaskController extends GetxController {
  bool isLoading = false;
  TextEditingController searchController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  String dob = 'Select Date';
  String time = 'Select Time';
  bool loader = false;
  final fireStore = FirebaseFirestore.instance;
  Map taskList = {};
  List taskStatus = ['Pending', 'In Progress', 'Completed'];
  int selectedStatus = 0;

  setTaskStatus(int value) {
    selectedStatus = value;
    update();
  }

  setShowLoader(bool value) {
    loader = value;
    update();
  }

  clearTaskListValue() {
    taskList.clear();
    update();
  }

  clearValue() {
    titleController.clear();
    descriptionController.clear();
    dob = 'Select Date';
    time = 'Select Time';
  }

  /// TASK DATE FUNCTION
  DateTime selectedDate = DateTime.now();
  Future<void> selectTaskDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2028),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: primaryColor,
            useMaterial3: false,
            backgroundColor: Colors.white,
            // Customize other properties of the theme as needed
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      dob = formatDateTime(picked.toString(), 'dd-MM-yyyy');
      update();
    }
    update();
  }

  String formatDateTime(String date, String format) {
    if (DateTime.tryParse(date) != null) {
      return formatDate(date, format);
    }
    return '';
  }

  String formatDate(String? date, String format) {
    if (date != null && DateTime.tryParse(date) != null) {
      return DateFormat(format).format(DateTime.parse(date));
    }
    return '';
  }

  /// TASK TIME FUNCTION
  TimeOfDay selectedTime = TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute);
  Future<void> selectTaskTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context, initialTime: selectedTime,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: primaryColor,
            useMaterial3: false,
            backgroundColor: Colors.white,

            // Customize other properties of the theme as needed
          ),
          child: child!,
        );
      }, // context: context,
    );

    if (picked != null) {
      time = '${picked.hour}:${picked.minute}';
      update();
    }
  }

  /// Add Task To Firebase
  Future<void> addTaskData() async {
    try {
      setShowLoader(true);
      update();
      await fireStore.collection("task").add({
        'title': titleController.text,
        'description': descriptionController.text,
        'date': dob,
        'time': time,
        'status': 'Pending'
      });
      setShowLoader(false);
      update();
      Get.back();
      showToast("Task Added Successfully");
    } catch (e) {
      setShowLoader(false);
      update();
      debugPrint("Catch Error ====> $e");
      showErrorToast("Error: $e");
    }
  }

  Future markAsCompleted(String documentId) async {
    await fireStore.collection("task").doc(documentId).update({
      'status': 'Completed'
    });
    showToast("Task Completed Successfully");
    update();
  }

}
