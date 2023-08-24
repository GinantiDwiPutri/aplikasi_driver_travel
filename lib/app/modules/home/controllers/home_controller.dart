import 'package:aplikasi_driver_travel/app/controllers/location_controller.dart';
import 'package:aplikasi_driver_travel/app/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectedDate = DateTime.now().obs;

  void selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate.value,
      firstDate: DateTime(2018),
      lastDate: DateTime(2025),
    );
    if (pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = pickedDate;
    }
  }

  @override
  void onInit() {
    super.onInit();
    Get.find<LocationController>().locatePosition();
    Get.find<UserController>().getDataUser();
  }
}
