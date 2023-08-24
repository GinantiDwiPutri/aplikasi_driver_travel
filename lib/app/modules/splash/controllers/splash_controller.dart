import 'package:aplikasi_driver_travel/app/controllers/location_controller.dart';
import 'package:aplikasi_driver_travel/app/global/variable.dart';
import 'package:aplikasi_driver_travel/app/models/driver_model.dart';
import 'package:aplikasi_driver_travel/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  void checkLoggedInUser() {
    Future.delayed(const Duration(milliseconds: 1500), () async {
      try {
        if (auth.currentUser != null) {
          final getDriver =
              await drivers.doc(auth.currentUser!.phoneNumber).get();
          final driverData = getDriver.data() as Map<String, dynamic>;

          driver(DriverModel.fromJson(driverData));
          driver.refresh();

          if (driverData['status'] == "blocked") {
            Get.offNamed(Routes.BLOCKED);
          } else if (driverData['status'] == "registrant") {
            Get.offNamed(Routes.WAITING);
          } else {
            Get.offNamed(Routes.HOME);
          }
        } else {
          Get.offNamed(Routes.WELCOME);
        }
      } catch (e) {
        Get.snackbar('Error', e.toString());

        auth.signOut();

        Get.offNamed(Routes.WELCOME);
      }
    });
  }

  @override
  void onInit() {
    Get.find<LocationController>().checkLocationPermission();
    super.onInit();
  }

  @override
  void onReady() {
    checkLoggedInUser();
    super.onReady();
  }
}
