import 'dart:io';

import 'package:get/get.dart';
import 'package:camera/camera.dart';
import 'package:flutter_tflite/flutter_tflite.dart';

class DetectionController extends GetxController {
  late CameraController cameraController;
  Rx<bool> isInitialized = Rx(false);
  RxString result = "".obs;
  bool isprocessing = false;

  @override
  void onInit() async {
    await loadDataModel();
    await initializeCamera();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future loadDataModel() async {
    await Tflite.loadModel(
      model: "assets/models/ssd_mobilenet.tflite",
      labels: "assets/models/ssd_mobilenet.txt",
    );
  }
  Future initializeCamera() async {
    final cameras = await availableCameras();
    cameraController = CameraController(
      cameras[0], 
      ResolutionPreset.max,
    );
    await cameraController.initialize();
    isInitialized.value = true;
  }
  
  takePicture() async {
    try {
      var file = await cameraController.takePicture();
      File image = File(file.path);
      if (isprocessing) return;
      isprocessing = true;
      await Future.delayed(const Duration(seconds: 1));
      result.value = '';
      var recognitions = await Tflite.detectObjectOnImage(
        path: image.path, numResultsPerClass: 1);
      for (var recognition in recognitions!) {
        result.value += "${recognition["detectedClass"]} - ${recognition["confidenceInClass"]} \n";
      }
    } catch (e) {
    } finally {
      isprocessing = false;
    }
  }

}