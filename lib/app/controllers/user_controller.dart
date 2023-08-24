import 'package:aplikasi_driver_travel/app/global/variable.dart';
import 'package:aplikasi_driver_travel/app/models/driver_model.dart';
import 'package:aplikasi_driver_travel/app/routes/app_pages.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  void checkUserRegistered(String? phoneNumber) async {
    try {
      final checkDriver = await drivers.doc(phoneNumber).get();

      if (checkDriver.data() == null) {
        Get.back();
        Get.toNamed(Routes.REGISTER);
      } else {
        await drivers.doc(phoneNumber).update({
          "lastSignInTime": DateTime.now().toIso8601String(),
        });

        getDataUser();

        Get.back();
        Get.offAllNamed(Routes.HOME);
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  void getDataUser() async {
    try {
      final getDriver = await drivers.doc(auth.currentUser?.phoneNumber).get();
      final driverData = getDriver.data() as Map<String, dynamic>;

      driver(DriverModel.fromJson(driverData));
      driver.refresh();
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  @override
  void onInit() {
    drivers.doc(driver.value.phoneNumber).snapshots().listen((event) {});
    super.onInit();
  }
}
