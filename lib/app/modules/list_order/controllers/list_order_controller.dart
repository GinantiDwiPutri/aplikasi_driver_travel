import 'package:aplikasi_driver_travel/app/global/variable.dart';
import 'package:aplikasi_driver_travel/app/models/trip_model.dart';
import 'package:get/get.dart';

class ListOrderController extends GetxController {
  Stream<List<TripModel>> streamDataTrips() {
    return trips
        .where('driverPhoneNumber', isEqualTo: driver.value.phoneNumber)
        .snapshots()
        .map(
          (event) => event.docs
              .map(
                (snapshot) => TripModel.fromJson(snapshot),
              )
              .toList(),
        );
  }
}
