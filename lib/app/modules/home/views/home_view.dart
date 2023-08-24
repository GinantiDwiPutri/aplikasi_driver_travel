import 'package:aplikasi_driver_travel/app/controllers/location_controller.dart';
import 'package:aplikasi_driver_travel/app/global/color.dart';
import 'package:aplikasi_driver_travel/app/global/variable.dart';
import 'package:aplikasi_driver_travel/app/routes/app_pages.dart';
import 'package:aplikasi_driver_travel/app/widgets/list_tile_drawer.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:icons_plus/icons_plus.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  final locateC = Get.find<LocationController>();

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: Drawer(
          width: MediaQuery.of(context).size.width * 0.7,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: (driver.value.photoURL == "")
                              ? Image.asset(
                                  "assets/images/man.png",
                                  width: 80,
                                  fit: BoxFit.cover,
                                )
                              : Image.network(
                                  driver.value.photoURL!,
                                  width: 80,
                                  fit: BoxFit.cover,
                                ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "${driver.value.displayName}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${driver.value.phoneNumber}",
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const Divider(),
                      ],
                    ),
                  ),
                  ListTileDrawerCustom(
                    title: "Edit Profil",
                    onTap: () => Get.toNamed(Routes.EDIT_PROFILE),
                  ),
                  ListTileDrawerCustom(
                    title: "Perjalanan",
                    onTap: () => Get.toNamed(Routes.LIST_ORDER),
                  ),
                  ListTileDrawerCustom(
                    title: "FAQ",
                    onTap: () => Get.toNamed(Routes.HELP),
                  ),
                  ListTileDrawerCustom(
                    title: "Ketentuan Layanan",
                    onTap: () => Get.toNamed(Routes.TERMS_OF_SERVICE),
                  ),
                  ListTileDrawerCustom(
                    title: "Kebijakan Privasi",
                    onTap: () => Get.toNamed(Routes.PRIVACY_POLICY),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 40),
                width: double.infinity,
                height: 55,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text(
                          "Yakin ingin keluar dari aplikasi?",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text(
                              "Batal",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              auth.signOut();
                              Get.offAllNamed(Routes.SPLASH);
                            },
                            child: const Text(
                              "Keluar",
                              style: TextStyle(
                                color: dangerColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    child: Row(
                      children: const [
                        SizedBox(
                          width: 15,
                        ),
                        Icon(BoxIcons.bx_log_out_circle),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Keluar"),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            const GoogleMap(
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              initialCameraPosition: CameraPosition(
                target: LatLng(
                  -1.8295394,
                  109.9771097,
                ),
                zoom: 14,
              ),
            ),
            Positioned(
              bottom: 30,
              right: 15,
              child: Material(
                color: Colors.transparent,
                elevation: 3,
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(15),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(15),
                      splashColor: primaryColor,
                      onTap: () {},
                      child: const Icon(
                        BoxIcons.bx_target_lock,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 35,
              left: 15,
              child: Material(
                color: Colors.transparent,
                elevation: 3,
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(15),
                    child: Builder(builder: (context) {
                      return InkWell(
                        borderRadius: BorderRadius.circular(15),
                        splashColor: primaryColor,
                        onTap: () => Scaffold.of(context).openDrawer(),
                        child: const Icon(
                          BoxIcons.bx_menu_alt_left,
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 35,
              right: 15,
              child: Material(
                color: Colors.transparent,
                elevation: 3,
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(15),
                    child: Builder(builder: (context) {
                      return InkWell(
                        borderRadius: BorderRadius.circular(15),
                        splashColor: primaryColor,
                        onTap: () => Get.toNamed(Routes.LIST_CHAT),
                        child: const Icon(
                          BoxIcons.bx_chat,
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
