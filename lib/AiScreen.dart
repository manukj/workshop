import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:ui' as ui;

class AiScreen extends StatefulWidget {
  const AiScreen({Key? key}) : super(key: key);

  @override
  State<AiScreen> createState() => _AiScreenState();
}

class _AiScreenState extends State<AiScreen> {
  File? imageFile;
  bool isDetection = false;
  List<Rect> rect = [];
  FacePainter? painter;
  final FaceDetector _faceDetector = FaceDetector(
    options: FaceDetectorOptions(
      enableClassification: true,
      enableContours: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AI screen'),
      ),
      body: Column(
        children: [
          if (isDetection) const CircularProgressIndicator(),
          if (imageFile != null && !(painter != null)) Image.file(imageFile!),
          if (painter != null)
            Center(
              child: SizedBox(
                height: 300,
                width: 300,
                child: CustomPaint(
                  painter: painter,
                ),
              ),
            ),
          SizedBox(
            height: 100,
          ),
          ElevatedButton(
            onPressed: () async {
              var temp =
                  await ImagePicker().pickImage(source: ImageSource.gallery);
              if (temp != null) {
                imageFile = File(temp.path);
                setState(() {});
              }
            },
            child: const Text('Image Picker'),
          ),
          ElevatedButton(
            onPressed: () async {
              isDetection = true;
              setState(() {});
              if (imageFile != null) {
                var inputImage = InputImage.fromFile(imageFile!);
                List<Face> result =
                    await _faceDetector.processImage(inputImage);
                isDetection = false;

                for (var value in result) {
                  rect.add(value.boundingBox);
                }
                var image =
                    await decodeImageFromList(imageFile!.readAsBytesSync());
                painter = FacePainter(image, rect);
                setState(() {});
              }
            },
            child: const Text('Face Detection'),
          )
        ],
      ),
    );
  }
}

class FacePainter extends CustomPainter {
  final ui.Image image;
  final List<Rect> rect;

  FacePainter(this.image, this.rect);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawImage(image, Offset.zero, Paint());
    for (var value in rect) {
      canvas.drawRect(
          value,
          Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 3
            ..color = Colors.red);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    throw UnimplementedError();
  }
}
