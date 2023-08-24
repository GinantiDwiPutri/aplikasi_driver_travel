import 'package:aplikasi_driver_travel/app/widgets/primary_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/order_detail_controller.dart';

class OrderDetailView extends GetView<OrderDetailController> {
  const OrderDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Keberangkatan'),
      ),
      body: StreamBuilder(
        stream: controller.getOrder(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          var order = snapshot.data!;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    runSpacing: 0,
                    spacing: 5,
                    children: [
                      const Text(
                        "Rute :",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        controller.trip.route,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Wrap(
                    runSpacing: 0,
                    spacing: 5,
                    children: [
                      const Text(
                        "Tanggal :",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        controller.trip.date,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Wrap(
                    runSpacing: 0,
                    spacing: 5,
                    children: [
                      const Text(
                        "Jam Keberangkatan :",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "${controller.trip.time} WIB",
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Wrap(
                    runSpacing: 0,
                    spacing: 5,
                    children: [
                      const Text(
                        "Harga Kursi :",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "Rp. ${controller.trip.price}",
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  (controller.trip.status == 'Selesai')
                      ? Container()
                      : (controller.trip.status == 'Menunggu Keberangkatan')
                          ? PrimaryButton(
                              onTap: () => controller.startTrip(),
                              text: 'Mulai Perjalanan',
                            )
                          : PrimaryButton(
                              onTap: () => controller.endTrip(),
                              text: 'Perjalanan Selesai',
                            ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
