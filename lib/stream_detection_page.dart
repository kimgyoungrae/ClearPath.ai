import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:clearpath/detection_controller.dart';

class StreamDetectionPage extends GetView<DetectionController> {
  const StreamDetectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stream Detection"),
      ),
    );
  }
}