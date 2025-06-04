import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rapidaidv2/App_Components/App_Widgets/custom_text_field.dart';
import 'package:rapidaidv2/App_Functions/Map_Logic/map_location.dart';
import 'package:rapidaidv2/App_Functions/Reports/report_function.dart';
import 'package:rapidaidv2/App_Functions/Reports/report_model.dart';
import 'package:unicons/unicons.dart';
import 'package:uuid/uuid.dart';

import 'Camera_Screen/Camera_Screen_Widgets/picture_screen.dart';

class ReportScreen extends StatefulWidget {
  final String imagePath;
  const ReportScreen({super.key, required this.imagePath});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  final _uuid = Uuid();
  final TextEditingController _reportController = TextEditingController();

  @override
  void dispose() {
    _reportController.dispose();
    super.dispose();
  }

  //
  Future<void> _submitReport() async {
    final message = _reportController.text.trim();
    if (message.isEmpty) return;

    final locationProvider = Provider.of<LocationProvider>(
      context,
      listen: false,
    );
    final currentLoc = locationProvider.currentLocation;
    final address = locationProvider.currentAddress;

    final report = ReportModel(
      id: _uuid.v4(),
      imagePath: widget.imagePath,
      message: message,
      createdAt: DateTime.now(),
      comments: [],
      location: currentLoc,
      address: address,
    );

    Provider.of<ReportFunction>(context, listen: false).addReport(report);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final locationProvider = Provider.of<LocationProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Flexible(child: DisplayPictureScreen(imagePath: widget.imagePath)),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    controller: _reportController,
                    hinttext: "Report a case!",
                  ),
                ),

                IconButton(
                  icon: Icon(UniconsLine.message),
                  onPressed:
                      locationProvider.currentLocation == null
                          ? null
                          : _submitReport,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



// Future<void> _submitReport() async {
  //   final message = _reportController.text.trim();
  //   if (message.isEmpty) return;

  //   // adding location
  //   LatLng? currentLoc;
  //   try {
  //     Position pos = await Geolocator.getCurrentPosition(
  //       locationSettings: LocationSettings(accuracy: LocationAccuracy.high),
  //     );
  //     currentLoc = LatLng(pos.latitude, pos.longitude);
  //   } catch (e) {
  //     print('Could not get location: $e');
  //   }
  //   //

  //   final report = ReportModel(
  //     id: _uuid.v4(),
  //     imagePath: widget.imagePath,
  //     message: message,
  //     createdAt: DateTime.now(),
  //     comments: [],
  //     location: currentLoc,
  //   );

  //   Provider.of<ReportFunction>(context, listen: false).addReport(report);
  //   Navigator.of(context).pop();
  // }