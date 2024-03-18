import 'dart:io';

import 'package:camera/camera.dart';
import 'package:gpay/components/camera/page/bloc/bloc_camera.dart';
import 'package:gpay/components/camera/shared/widget/orientation_icon.dart';
import 'package:gpay/components/camera/shared/widget/rotate_icon.dart';
import 'package:flutter/material.dart';
import 'package:native_device_orientation/native_device_orientation.dart';
import 'package:nb_utils/nb_utils.dart';

enum CameraOrientation { landscape, portrait, all }
enum CameraMode { fullscreen, normal }
enum CameraSide { front, back }

class Camera extends StatefulWidget {
  final Widget? imageMask;
  final CameraMode mode;
  final Widget? warning;
  final CameraOrientation orientationEnablePhoto;
  final Function(File? image)? onFile;
  final bool enableCameraChange;
  final CameraSide initialCamera;
  final Function(CameraLensDirection direction, List<CameraDescription> cameras)? onChangeCamera;

  const Camera({
    Key? key,
    this.imageMask,
    this.mode = CameraMode.normal,
    this.orientationEnablePhoto = CameraOrientation.all,
    this.onFile,
    this.warning,
    this.onChangeCamera,
    this.initialCamera = CameraSide.back,
    this.enableCameraChange = true,
  }) : super(key: key);

  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  var bloc = BlocCamera();
  var previewH;
  var previewW;
  var screenRatio;
  late var previewRatio;
  Size? tmp;
  Size? sizeImage;

  @override
  void initState() {
    super.initState();

    bloc.getCameras();
    bloc.cameras.listen((data) {
      bloc.controllCamera = CameraController(data[0], ResolutionPreset.high);
      bloc.cameraOn.sink.add(0);
      bloc.controllCamera!.initialize().then((_) {
        bloc.selectCamera.sink.add(true);
        if (widget.initialCamera == CameraSide.front) bloc.changeCamera();
      });
    });

    setOrientationPortrait();
  }

  @override
  void dispose() {
    super.dispose();
    bloc.dispose();
  }

  void _changeCamera() async {
    await bloc.changeCamera();

    if (widget.onChangeCamera != null) {
      widget.onChangeCamera!(
        bloc.controllCamera!.description.lensDirection,
        bloc.cameras.value,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Size sizeImage = size;
    double width = size.width;
    double height = size.height;

    return NativeDeviceOrientationReader(
      useSensor: true,
      builder: (context) {
        NativeDeviceOrientation orientation = NativeDeviceOrientationReader.orientation(context);

        buttonPhoto() {
          return CircleAvatar(
            backgroundColor: Colors.black38,
            radius: 25.0,
            child: IconButton(
              icon: OrientationWidget(orientation: orientation, child: const Icon(Icons.camera_alt, color: Colors.white)),
              onPressed: () {
                sizeImage = MediaQuery.of(context).size;
                bloc.onTakePictureButtonPressed();
              },
            ),
          );
        }

        Widget getButtonPhoto() {
          if (widget.orientationEnablePhoto == CameraOrientation.all) {
            return buttonPhoto();
          } else if (widget.orientationEnablePhoto == CameraOrientation.landscape) {
            if (orientation == NativeDeviceOrientation.landscapeLeft || orientation == NativeDeviceOrientation.landscapeRight) {
              return buttonPhoto();
            } else {
              return const SizedBox(width: 0.0, height: 0.0);
            }
          } else {
            if (orientation == NativeDeviceOrientation.portraitDown || orientation == NativeDeviceOrientation.portraitUp) {
              return buttonPhoto();
            } else {
              return const SizedBox(width: 0.0, height: 0.0);
            }
          }
        }

        if (orientation == NativeDeviceOrientation.portraitDown || orientation == NativeDeviceOrientation.portraitUp) {
          sizeImage = Size(width, height);
        } else {
          sizeImage = Size(height, width);
        }

        return Scaffold(
          backgroundColor: Colors.black,
          body: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width,
              maxHeight: MediaQuery.of(context).size.height,
            ),
            child: Stack(
              children: <Widget>[
                Center(
                  child: StreamBuilder<File?>(
                    stream: bloc.imagePath.stream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return OrientationWidget(
                          orientation: orientation,
                          child: SizedBox(height: sizeImage.height, width: sizeImage.height, child: Image.file(snapshot.data!, fit: BoxFit.contain)),
                        );
                      } else {
                        return Stack(
                          children: <Widget>[
                            Center(
                              child: StreamBuilder<bool?>(
                                stream: bloc.selectCamera.stream,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    if (snapshot.data!) {
                                      previewRatio = bloc.controllCamera!.value.aspectRatio;

                                      return widget.mode == CameraMode.normal
                                          ? OverflowBox(maxHeight: size.height, maxWidth: size.height * previewRatio, child: CameraPreview(bloc.controllCamera!))
                                          : AspectRatio(aspectRatio: bloc.controllCamera!.value.aspectRatio, child: CameraPreview(bloc.controllCamera!));
                                    } else {
                                      return Container();
                                    }
                                  } else {
                                    return Container();
                                  }
                                },
                              ),
                            ),
                            if (widget.imageMask != null) Center(child: widget.imageMask),
                          ],
                        );
                      }
                    },
                  ),
                ),
                if (widget.mode == CameraMode.normal)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: StreamBuilder<Object?>(
                        stream: bloc.imagePath.stream,
                        builder: (context, snapshot) {
                          return snapshot.hasData
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    CircleAvatar(
                                      backgroundColor: Colors.black38,
                                      radius: 25.0,
                                      child: IconButton(
                                        icon: OrientationWidget(orientation: orientation, child: const Icon(Icons.close, color: Colors.white)),
                                        onPressed: () {
                                          bloc.deletePhoto();
                                        },
                                      ),
                                    ),
                                    CircleAvatar(
                                      backgroundColor: Colors.black38,
                                      radius: 25.0,
                                      child: IconButton(
                                        icon: OrientationWidget(orientation: orientation, child: const Icon(Icons.check, color: Colors.white)),
                                        onPressed: () {
                                          if (widget.onFile == null) {
                                            Navigator.pop(context, bloc.imagePath.value);
                                          } else {
                                            widget.onFile!(bloc.imagePath.value);
                                          }
                                        },
                                      ),
                                    )
                                  ],
                                )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    // /_getButtonPhoto(),
                                    (widget.enableCameraChange)
                                        ? CircleAvatar(
                                            backgroundColor: Colors.black38,
                                            radius: 25.0,
                                            child: RotateIcon(
                                              child: OrientationWidget(orientation: orientation, child: const Icon(Icons.cached, color: Colors.white)),
                                              onTap: () => _changeCamera(),
                                            ),
                                          )
                                        : CircleAvatar(backgroundColor: Colors.transparent, radius: 25.0, child: Container()),
                                  ],
                                );
                        },
                      ),
                    ),
                  )
              ],
            ),
          ),
          bottomNavigationBar: widget.mode == CameraMode.normal
              ? BottomAppBar(
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
                    child: StreamBuilder<Object?>(
                        stream: bloc.imagePath.stream,
                        builder: (context, snapshot) {
                          return snapshot.hasData
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    CircleAvatar(
                                      backgroundColor: Colors.black38,
                                      radius: 25.0,
                                      child: IconButton(
                                        icon: OrientationWidget(orientation: orientation, child: const Icon(Icons.close, color: Colors.white)),
                                        onPressed: () {
                                          bloc.deletePhoto();
                                        },
                                      ),
                                    ),
                                    CircleAvatar(
                                      backgroundColor: Colors.black38,
                                      radius: 25.0,
                                      child: IconButton(
                                        icon: OrientationWidget(orientation: orientation, child: const Icon(Icons.check, color: Colors.white)),
                                        onPressed: () {
                                          if (widget.onFile == null) {
                                            Navigator.pop(context, bloc.imagePath.value);
                                          } else {
                                            widget.onFile!(bloc.imagePath.value);
                                          }
                                        },
                                      ),
                                    )
                                  ],
                                )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    getButtonPhoto(),
                                    (widget.enableCameraChange)
                                        ? CircleAvatar(
                                            backgroundColor: Colors.black38,
                                            radius: 25.0,
                                            child: RotateIcon(
                                              child: OrientationWidget(
                                                orientation: orientation,
                                                child: const Icon(Icons.cached, color: Colors.white),
                                              ),
                                              onTap: () => _changeCamera(),
                                            ),
                                          )
                                        : CircleAvatar(backgroundColor: Colors.transparent, radius: 25.0, child: Container()),
                                  ],
                                );
                        }),
                  ),
                )
              : const SizedBox(width: 0.0, height: 0.0),
        );
      },
    );
  }
}
