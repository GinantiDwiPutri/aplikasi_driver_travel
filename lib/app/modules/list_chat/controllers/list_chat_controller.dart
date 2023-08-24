import 'package:aplikasi_driver_travel/app/global/variable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListChatController extends GetxController {
  Future<QuerySnapshot> listChats() {
    return drivers.doc(driver.value.phoneNumber).collection("chats").get();
  }
}
