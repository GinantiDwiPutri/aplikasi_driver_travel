import 'package:aplikasi_driver_travel/app/global/color.dart';
import 'package:aplikasi_driver_travel/app/global/variable.dart';
import 'package:aplikasi_driver_travel/app/models/trip_model.dart';
import 'package:aplikasi_driver_travel/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/list_order_controller.dart';

class ListOrderView extends GetView<ListOrderController> {
  const ListOrderView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Keberangkatanmu',
        ),
      ),
      body: StreamBuilder<List<TripModel>>(
        stream: controller.streamDataTrips(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: primaryColor),
            );
          } else {
            if (snapshot.hasError) {
              return const Center(
                child: Text("Terjadi Kesalahan"),
              );
            }

            List<TripModel> trip = snapshot.data!;
            if (trip.isEmpty) {
              return Center(
                child: Wrap(
                  runSpacing: 10,
                  spacing: 10,
                  alignment: WrapAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/no-trip.png",
                      width: 200,
                    ),
                    const Text(
                      'Aduhh, gaada keberangkatan travel yang tersedia nih.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              );
            }

            return ListView.builder(
              itemCount: trip.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () =>
                      Get.toNamed(Routes.ORDER_DETAIL, arguments: trip[index]),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: primaryColor,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                          "assets/images/route.png",
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              trip[index].route,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Text("Tanggal: ${trip[index].date}"),
                            const SizedBox(
                              height: 3,
                            ),
                            Text("Jam Berangkat: ${trip[index].time} WIB"),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                  color: (trip[index].status == 'Selesai')
                                      ? Colors.lightGreenAccent
                                      : Colors.lightBlueAccent,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                trip[index].status,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
