import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/waiting_controller.dart';

class WaitingView extends GetView<WaitingController> {
  const WaitingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Wrap(
          runSpacing: 10,
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            Image.asset(
              "assets/images/drivers-license.png",
              width: 200,
            ),
            const Text(
              'Untuk melanjutkan proses pendaftaran, bawa Surat Izin Mengemudi anda ke kantor kami.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              onPressed: () async {
                Uri url = Uri.parse(
                    'https://www.google.com/maps/search/?api=1&query=-1.8345558,109.9676581');

                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                } else {
                  Fluttertoast.showToast(
                      msg: "Gagal mengarahkan anda ke lokasi kami");
                }
              },
              child: const Text("Lokasi Kantor Kami"),
            ),
          ],
        ),
      ),
    );
  }
}
