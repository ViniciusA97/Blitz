import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';


class CameraPage extends StatefulWidget{
 
  State<StatefulWidget> createState() => _CameraPageState();

}

class _CameraPageState extends State<CameraPage>{

  CameraController controller;
  List cameras;
  int selectedCameraIdx;
  String imagePath;

  Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    availableCameras().then((availableCameras) {
    
    cameras = availableCameras;
    if (cameras.length > 0) {
      setState(() {
        selectedCameraIdx = 0;
      });
      _initCameraController(cameras[selectedCameraIdx]).then((void v) {});
    }else{
      print("No camera available");
    }
  }).catchError((err) {
    print('Error: $err.code\nError Message: $err.message');
  });

  }

  Future _initCameraController(CameraDescription cameraDescription) async {
    
    if (controller != null) {
      await controller.dispose();
    }
    controller = CameraController(cameraDescription, ResolutionPreset.veryHigh);
    controller.addListener(() {
      if (mounted) {
        setState(() {});
      }
      if (controller.value.hasError) {
        print('Camera error ${controller.value.errorDescription}');
      }
    });
    try {
      await controller.initialize();
    } on CameraException catch (e) {
    }
    if (mounted) {
      setState(() {});
    }
  }

  Widget _cameraPreviewWidget() {
    if (controller == null || !controller.value.isInitialized) {
      return const Text(
        'Loading',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.w900,
        ),
      );
  }

  return AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: CameraPreview(controller),
    );
  }

  void takePicture() async{
     try {
        var dir = await getExternalStorageDirectory();
        var finalPath = dir.path +"/${DateTime.now()}.png";
        print("[INFO][CAMERA-PATH]: "+finalPath);
        await controller.takePicture(finalPath);
        print("[INFO][CAMERA-PICTURE]: Successful picture saved on "+finalPath);
        Navigator.pop(context, finalPath);
        } catch (e) {
        print("[INFO][CAMERA-PICTURE]: Unsuccessful picture saved. error:");
        print(e);
      }
  }

  void changeCam(){
    var total = cameras.length;
    if(this.selectedCameraIdx == total-1){
      setState(() {
      this.selectedCameraIdx = 0;
      });
    }else{
      setState(() {
      this.selectedCameraIdx +=1;
      });
    }

    _initCameraController(cameras[selectedCameraIdx]);

  }


  @override
  Widget build(BuildContext context) {
    return
    WillPopScope(
      onWillPop: () async{
        Navigator.pop(context,"");
        return false;
      },
      child:
     Scaffold(
      body: Container(
        color: Colors.black,
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: _cameraPreviewWidget(),
              height: MediaQuery.of(context).size.height*0.8,
            ),
              Container(
                alignment: Alignment.bottomCenter,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RaisedButton(onPressed: (){this.changeCam();}, child: Icon(Icons.camera_front, color: Colors.white,),color: Colors.orange),
                    RaisedButton(onPressed: () async{
                        await takePicture();
                      }, child: Icon(Icons.camera, color: Colors.white,), color: Colors.orange,),
                    RaisedButton(onPressed: (){}, color: Colors.orange, child: Icon(Icons.add_photo_alternate, color: Colors.white,))
                  ],
                ),
              )
          ],
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        ),
    ));
  }



}