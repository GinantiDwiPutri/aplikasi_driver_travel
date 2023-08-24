import 'package:aplikasi_driver_travel/app/global/variable.dart';
import 'package:aplikasi_driver_travel/app/models/driver_model.dart';
import 'package:aplikasi_driver_travel/app/routes/app_pages.dart';
import 'package:aplikasi_driver_travel/app/widgets/progress_dialog.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  Rx<String> name = ''.obs;
  Rx<String> email = ''.obs;
  Rx<String> carType = ''.obs;
  Rx<String> carNumber = ''.obs;

  void register() async {
    Get.dialog(
      const ProgressDialog(message: "Mohon Tunggu"),
    );

    try {
      await drivers.doc(auth.currentUser?.phoneNumber).set({
        'uid': auth.currentUser?.uid,
        'phoneNumber': auth.currentUser?.phoneNumber,
        'displayName': name.value,
        'email': email.value,
        'emailVerifiedAt': '',
        'photoURL': '',
        'updatedTime': '',
        'status': 'registrant',
        'creationTime': DateTime.now().toIso8601String(),
        'lastSignInTime': DateTime.now().toIso8601String(),
        'carType': carType.value,
        'carNumber': carNumber.value,
      });

      await drivers
          .doc(auth.currentUser?.phoneNumber)
          .collection('notifications')
          .add({
        'title': 'Selamat Bergabung!',
        'description': 'Jadilah rekan terbaik kami di Berangkut!',
        'isRead': false,
        'time': DateTime.now().toIso8601String(),
      });

      final getDriver = await drivers.doc(auth.currentUser?.phoneNumber).get();
      final driverData = getDriver.data() as Map<String, dynamic>;

      driver(DriverModel.fromJson(driverData));
      driver.refresh();

      Get.offAllNamed(Routes.HOME);
    } catch (e) {
      Get.back();
      Get.snackbar("Error", "message");
    }
  }
}
