//import 'package:camera/camera.dart';
//import 'package:flutter/material.dart';
//
//class Cameratest extends StatefulWidget {
//  var cameras;
//  Cameratest({this.cameras});
//  @override
//  _CameratestState createState() => _CameratestState();
//}
//
//class _CameratestState extends State<Cameratest> {
//
//  CameraController controller;
//  @override
//  void initState() {
//    super.initState();
//    controller = CameraController(widget.cameras[0], ResolutionPreset.medium);
//    controller.initialize().then((_) {
//      if (!mounted) {
//        return;
//      }
//      setState(() {});
//    });
//  }
//  @override
//  Widget build(BuildContext context) {
//     return new Stack(
//      alignment: FractionalOffset.center,
//      children: <Widget>[
//        new Positioned.fill(
//          child: new AspectRatio(
//              aspectRatio: controller.value.aspectRatio,
//              child: new CameraPreview(controller)),
//        ),
//        new Positioned.fill(
//          child: new Opacity(
//            opacity: 0.3,
//            child: new Image.network(
//              'https://picsum.photos/3000/4000',
//              fit: BoxFit.fill,
//            ),
//          ),
//        ),
//      ],
//    );;
//  }
//}
