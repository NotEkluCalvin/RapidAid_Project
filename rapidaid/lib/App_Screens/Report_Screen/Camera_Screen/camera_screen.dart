import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:rapidaidv2/App_Components/App_Style/colors.dart';
import 'package:rapidaidv2/App_Screens/Report_Screen/report_screen.dart';
import 'package:rapidaidv2/main.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  CameraScreenState createState() => CameraScreenState();
}

class CameraScreenState extends State<CameraScreen> {
  CameraController? _controller;
  Future<void>? _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(cameras![0], ResolutionPreset.medium);
    _initializeControllerFuture = _controller!.initialize();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<void>(
          future: _initializeControllerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return SizedBox.expand(child: CameraPreview(_controller!));
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),

          onPressed: () async {
            try {
              await _initializeControllerFuture;
              final image = await _controller?.takePicture();
              if (!mounted) return;

              // Display the captured image
              await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ReportScreen(imagePath: image!.path),
                ),
              );
            } catch (e) {
              print(e);
            }
          },
          backgroundColor: myMainColor,
          child: Icon(Icons.camera),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
