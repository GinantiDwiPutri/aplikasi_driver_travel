import 'package:aplikasi_driver_travel/app/global/variable.dart';
import 'package:aplikasi_driver_travel/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

import '../controllers/list_chat_controller.dart';

class ListChatView extends GetView<ListChatController> {
  const ListChatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Daftar Pesanmu',
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: drivers
            .doc(driver.value.phoneNumber)
            .collection("chats")
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          var listChat = snapshot.data!.docs;

          return ListView.builder(
              itemCount: listChat.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(
                    BoxIcons.bx_user_circle,
                    size: 40,
                  ),
                  title: Text(listChat[index]['displayName']),
                  subtitle: Text(listChat[index].id),
                  onTap: () => Get.toNamed(Routes.CHAT_ROOM, arguments: {
                    "phoneNumber": listChat[index].id,
                    "displayName": listChat[index]['displayName'],
                  }),
                );
              });
        },
      ),
    );
  }
}
