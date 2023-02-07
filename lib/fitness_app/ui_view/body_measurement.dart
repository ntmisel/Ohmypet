import 'dart:io';

import 'package:best_flutter_ui_templates/AppHomeState.dart';
import 'package:best_flutter_ui_templates/fitness_app/fitness_app_theme.dart';
import 'package:best_flutter_ui_templates/fitness_app/my_diary/meals_list_view.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class BodyMeasurementView extends StatefulWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;

  const BodyMeasurementView(
      {super.key, this.animationController, this.animation});

  @override
  State<BodyMeasurementView> createState() => _BodyMeasurementViewState();
}

class _BodyMeasurementViewState extends State<BodyMeasurementView> {
  AnimationController? animationController;
  Animation<double>? animation;

  File? imageDetect;

  @override
  @override
  void initState() {
    super.initState();
  }

  obtenerFotoDevice() async {
    File fotoDe = await AppHomeState().getImagen();
    setState(() {
      imageDetect = fotoDe;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.only(top: 16, left: 16, right: 24),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              print("push");
                              obtenerFotoDevice();
                            },
                            child: Text("Mostrar foto")),
                        imageDetect == null
                            ? Center()
                            : Image.file(imageDetect!),
                      ],
                    )
                  ]))
        ],
      ),
    );
  }
}
