import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app_routes.dart';



class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.toNamed(AppRoutes.streamPage);
              },
              child: const Text("Start Detection"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(AppRoutes.detectionPage);
              },
              child: const Text("Take Picture"),
            ),
          ],
        )
      )
    );
  }
}