import 'package:flutter/material.dart';
import 'detection_controller.dart';
import 'package:get/get.dart';
import 'package:camera/camera.dart';


class DetectPicture extends GetView<DetectionController> {
  const DetectPicture({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detect Picture"),
      ),
      body: Obx(() {
          if (controller.isInitialized.value == false) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Stack(
              children: [
                CameraPreview(controller.cameraController),
                Positioned(
                  right: 10,
                  bottom: 10,
                  child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Obx(
                    () => Text(
                      controller.result.value,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20)
                      ),
                  ),
                ))
              ],
            );
          }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.takePicture();
        },
        child: Icon(Icons.camera_alt),
      ),
    );
  }
}