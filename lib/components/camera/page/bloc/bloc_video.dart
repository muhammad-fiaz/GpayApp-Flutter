import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:video_player/video_player.dart';

class BlocVideo {
  var cameras = BehaviorSubject<List<CameraDescription>>();
  var selectCamera = BehaviorSubject<bool?>();
  var videoPath = BehaviorSubject<File?>();
  var cameraOn = BehaviorSubject<int>();
  var videoOn = BehaviorSubject<bool?>();
  var playPause = BehaviorSubject<bool>.seeded(false);
  var timeVideo = BehaviorSubject<double>.seeded(0.0);
  FloatingActionButtonLocation fabLocation = FloatingActionButtonLocation.centerDocked;

  CameraController? controllCamera;
  VideoPlayerController? controllVideo;

  Future getCameras() async {
    await availableCameras().then((lista) {
      cameras.sink.add(lista);
    }).catchError((e) {
      if (kDebugMode) {
        print("ERROR CAMERA: $e");
      }
    });
  }

  Future<String?> takePicture() async {
    if (!controllCamera!.value.isInitialized) {
      if (kDebugMode) {
        print("selecionado camera");
      }
      return null;
    }
    final Directory extDir = await getApplicationDocumentsDirectory();
    final String dirPath = '${extDir.path}/Pictures/flutter_test';
    await Directory(dirPath).create(recursive: true);
    final String filePath = '$dirPath/${timestamp()}.jpg';

    if (controllCamera!.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return null;
    }

    try {
      await controllCamera!.takePicture();
    } on CameraException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
    return filePath;
  }

  String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();

  void onNewCameraSelected(CameraDescription cameraDescription) async {
    selectCamera.sink.add(null);
    if (controllCamera != null) {
      await controllCamera!.dispose();
    }
    controllCamera = CameraController(cameraDescription, ResolutionPreset.medium);
    controllCamera!.addListener(() {
      if (controllCamera!.value.hasError) selectCamera.sink.add(false);
    });

    await controllCamera!.initialize().then((value) {
      selectCamera.sink.add(true);
    }).catchError((e) {
      if (kDebugMode) {
        print(e);
      }
    });
  }

  void changeCamera() {
    var list = cameras.value;

    if (list.length == 2) {
      if (controllCamera!.description.name == "0") {
        onNewCameraSelected(list[1]);
        cameraOn.sink.add(1);
      } else {
        onNewCameraSelected(list[0]);
        cameraOn.sink.add(0);
      }
    }
  }

  void deleteVideo() {
    var dir = Directory(videoPath.value!.path);
    dir.deleteSync(recursive: true);
    videoPath.sink.add(null);
    videoOn.sink.add(null);
  }

  //Recording video

  void onVideoRecordButtonPressed() {
    fabLocation = FloatingActionButtonLocation.centerFloat;
    startVideoRecording().then((String? filePath) {
      if (filePath != null) videoPath.sink.add(File(filePath));
    });
  }

  void onStopButtonPressed() {
    fabLocation = FloatingActionButtonLocation.centerDocked;
    stopVideoRecording().then((_) {
      //AQUI VC PAUSA O VIDEO
    });
  }

  Future<String?> startVideoRecording() async {
    final Directory extDir = await getApplicationDocumentsDirectory();
    final String dirPath = '${extDir.path}/Movies/flutter_test';
    await Directory(dirPath).create(recursive: true);
    final String filePath = '$dirPath/${timestamp()}.mp4';

    if (controllCamera!.value.isRecordingVideo) {
      // A recording is already started, do nothing.
      return null;
    }

    try {
      await controllCamera!.startVideoRecording();
    } on CameraException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
    videoOn.sink.add(false);
    return filePath;
  }

  Future<void> stopVideoRecording() async {
    if (!controllCamera!.value.isRecordingVideo) {
      return;
    }

    try {
      await controllCamera!.stopVideoRecording();
    } on CameraException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return;
    }

    _startVideoPlayer();
    if (controllVideo != null) videoOn.sink.add(true);
  }

  Future<void> _startVideoPlayer() async {
    controllVideo = VideoPlayerController.file(videoPath.value!);

    await controllVideo!.initialize();
    await controllVideo!.setLooping(true);
    await controllVideo!.play();
    playPause.sink.add(true);
  }

  void dispose() {
    cameras.close();
    controllCamera!.dispose();
    controllVideo!.dispose();
    selectCamera.close();
    videoPath.close();
    cameraOn.close();
    videoOn.close();
    timeVideo.close();
    playPause.close();
  }
}
