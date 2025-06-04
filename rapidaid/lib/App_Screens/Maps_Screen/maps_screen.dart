import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:provider/provider.dart';
import 'package:rapidaidv2/App_Components/App_Style/colors.dart';
import 'package:rapidaidv2/App_Functions/Map_Logic/map_location.dart';
import 'package:rapidaidv2/App_Functions/Reports/report_function.dart';
import 'package:unicons/unicons.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({super.key});

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<LocationProvider>(context, listen: false).fetchLocation();
    });
  }

  @override
  Widget build(BuildContext context) {
    final locationProvider = Provider.of<LocationProvider>(context);
    final location = locationProvider.currentLocation;
    return Scaffold(
      appBar: AppBar(
        title: Text(locationProvider.currentAddress ?? 'Fetching location...'),
        automaticallyImplyLeading: false,
      ),
      body:
          location == null
              ? Center(child: CircularProgressIndicator())
              : FlutterMap(
                mapController: locationProvider.mapController,
                options: MapOptions(initialCenter: location, initialZoom: 15.0),
                children: [
                  TileLayer(
                    urlTemplate:
                        "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    userAgentPackageName: 'com.example.app',
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: location,
                        width: 40,
                        height: 40,
                        alignment: Alignment.center,
                        child: Icon(
                          UniconsSolid.keyhole_circle,
                          // size: 40,
                          color: Colors.black,
                        ),
                      ),
                      ...Provider.of<ReportFunction>(context).reports
                          .where((report) => report.location != null)
                          .map(
                            (report) => Marker(
                              point: report.location!,
                              width: 90,
                              height: 90,
                              alignment: Alignment.center,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color.fromARGB(
                                        255,
                                        240,
                                        199,
                                        139,
                                      ),
                                      blurRadius: 50,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                    ],
                  ),
                ],
              ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: myAltColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onPressed: locationProvider.recenterMap,
        tooltip: 'Recenter Map',
        child: Icon(Icons.my_location, color: myMainColor),
      ),
    );
  }
}




// FlutterMap(
//                 mapController: _mapController,
//                 options: MapOptions(
//                   initialCenter: currentLocation!,
//                   initialZoom: 15.0,
//                 ),
//                 children: [
//                   TileLayer(
//                     urlTemplate:
//                         "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
//                     userAgentPackageName: 'com.example.app',
//                   ),
//                   MarkerLayer(
//                     markers: [
//                       Marker(
//                         point: currentLocation!,
//                         width: 40,
//                         height: 40,
//                         alignment: Alignment.center,
//                         child: Icon(
//                           Icons.location_pin,
//                           size: 40,
//                           color: Colors.red,
//                         ),
                        
//                       ),
//                       // ...reports.where((r)=>r.location != null).map(
//                       //     (r)=> Marker(point: r.location!, child: Icon(Icons.report_problem))
//                       //   )
//                     ],
//                   ),
//                 ],
//               ),