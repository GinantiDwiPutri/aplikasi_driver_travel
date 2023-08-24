import 'package:aplikasi_driver_travel/app/global/variable.dart';
import 'package:aplikasi_driver_travel/app/models/order_model.dart';
import 'package:aplikasi_driver_travel/app/models/trip_model.dart';
import 'package:aplikasi_driver_travel/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class OrderDetailController extends GetxController {
  final TripModel trip = Get.arguments;

  Stream<List<OrderModel>> getOrder() {
    return orders.where('tripID', isEqualTo: trip.id).snapshots().map(
        (snapshot) =>
            snapshot.docs.map((e) => OrderModel.fromJson(e)).toList());
  }

  void startTrip() async {
    await trips.doc(trip.id).update({
      'status': 'Dalam Perjalanan',
    });

    Fluttertoast.showToast(msg: "Perjalanan Dimulai");
    Get.offNamed(Routes.HOME);
  }

  void endTrip() async {
    await trips.doc(trip.id).update({
      'status': 'Selesai',
    }).then((value) async {
      orders
          .where('tripID', isEqualTo: trip.id)
          .get()
          .then((value) => value.docs.forEach((element) {
                orders.doc(element.id).update({'status': 'Selesai'});
              }));
    });

    Fluttertoast.showToast(msg: "Perjalanan Selesai");
    Get.back();
  }
}
