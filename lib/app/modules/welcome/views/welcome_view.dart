import 'package:aplikasi_driver_travel/app/global/color.dart';
import 'package:aplikasi_driver_travel/app/routes/app_pages.dart';
import 'package:aplikasi_driver_travel/app/theme/text_theme.dart';
import 'package:aplikasi_driver_travel/app/widgets/primary_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: Get.width,
            height: Get.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/welcome.jpg"),
              ),
            ),
          ),
          Positioned(
            top: 35,
            left: 20,
            right: 20,
            child: SizedBox(
              width: Get.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Selamat Datang!",
                    style: TextStyle(
                      fontFamily: fontFamily,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Jadilah rekan terbaik kami dalam membantu orang-orang dalam perjalanannya",
                    style: TextStyle(
                      fontFamily: fontFamily,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Material(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: () => Get.toNamed(Routes.LOGIN),
                      borderRadius: BorderRadius.circular(10),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: Text(
                          "Masuk",
                          style: TextStyle(
                            fontFamily: "Rubik",
                            color: whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
