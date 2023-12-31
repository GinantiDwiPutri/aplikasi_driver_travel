import 'package:aplikasi_driver_travel/app/global/color.dart';
import 'package:aplikasi_driver_travel/app/routes/app_pages.dart';
import 'package:aplikasi_driver_travel/app/widgets/disabled_button.dart';
import 'package:aplikasi_driver_travel/app/widgets/primary_button.dart';
import 'package:aplikasi_driver_travel/app/widgets/required_label_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(Routes.HELP),
            icon: const Icon(
              BoxIcons.bx_help_circle,
            ),
          ),
        ],
      ),
      body: WillPopScope(
        onWillPop: () async => false,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Eitss, Daftar Dulu!",
                  style: Get.textTheme.headlineLarge,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Masukkan nama lengkap dan emailmu untuk memudahkan kami mengenal kamu",
                  style: Get.textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const RequiredLabelText(label: "Nama Lengkap"),
                    TextField(
                      onChanged: (value) {
                        controller.name.value = value;
                      },
                      autofocus: true,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                      cursorColor: primaryColor,
                      cursorWidth: 3,
                      decoration: const InputDecoration(
                        hintText: "Jangan Pakai Angka dan Simbol ya",
                        focusColor: blackColor,
                        fillColor: blackColor,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: primaryColor,
                            width: 3,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const RequiredLabelText(label: "Email"),
                    TextField(
                      onChanged: (value) {
                        controller.email.value = value;
                      },
                      autofocus: true,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: primaryColor,
                      cursorWidth: 3,
                      decoration: const InputDecoration(
                        hintText: "Isi Dengan Format Email Yang Benar",
                        focusColor: blackColor,
                        fillColor: blackColor,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: primaryColor,
                            width: 3,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const RequiredLabelText(label: "Tipe Mobil"),
                    TextField(
                      onChanged: (value) {
                        controller.carType.value = value;
                      },
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      cursorColor: primaryColor,
                      cursorWidth: 3,
                      decoration: const InputDecoration(
                        hintText: "Contoh: Avanza",
                        focusColor: blackColor,
                        fillColor: blackColor,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: primaryColor,
                            width: 3,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const RequiredLabelText(label: "Nomor Plat Mobil"),
                    TextField(
                      onChanged: (value) {
                        controller.carNumber.value = value;
                      },
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      cursorColor: primaryColor,
                      cursorWidth: 3,
                      decoration: const InputDecoration(
                        hintText: "Contoh: KB XXXX GX",
                        focusColor: blackColor,
                        fillColor: blackColor,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: primaryColor,
                            width: 3,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Obx(
                  () => (controller.name.value.isNotEmpty &&
                          controller.email.value.isNotEmpty &&
                          controller.carType.value.isNotEmpty &&
                          controller.carNumber.value.isNotEmpty)
                      ? PrimaryButton(
                          onTap: () => controller.register(),
                          text: "Daftar",
                        )
                      : const DisabledButton(text: "Daftar"),
                ),
              ],
            ),
          ),
        ),
      ));
}
