import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../controllers/privacy_policy_controller.dart';

class PrivacyPolicyView extends GetView<PrivacyPolicyController> {
  const PrivacyPolicyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Kebijakan Privasi"),
        ),
        body: Obx(
          () => (controller.isLoading.isTrue)
              ? Column(
                  children: [
                    LinearProgressIndicator(
                      value: controller.progressIndicator.value,
                      color: Colors.green,
                    ),
                    const Expanded(
                      child: Center(
                        child: Text("Mohon Tunggu..."),
                      ),
                    ),
                  ],
                )
              : WebViewWidget(
                  controller: controller.webviewController,
                ),
        ),
      );
}
