import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class LocationProvider extends ChangeNotifier {
  final MapController mapController = MapController();

  LatLng? _currentLocation;
  String? _currentAddress;

  LatLng? get currentLocation => _currentLocation;
  String? get currentAddress => _currentAddress;

  Future<void> fetchLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        return;
      }
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    _currentLocation = LatLng(position.latitude, position.longitude);
    await _getAddressFromCoordinates(position.latitude, position.longitude);

    notifyListeners();
  }

  Future<void> _getAddressFromCoordinates(double lat, double lon) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, lon);
      if (placemarks.isNotEmpty) {
        final p = placemarks.first;
        _currentAddress = "${p.street}, ${p.locality}";
      }
    } catch (e) {
      _currentAddress = "Unknown location";
    }
  }

  void recenterMap() {
    if (_currentLocation != null) {
      mapController.move(_currentLocation!, 15.0);
    }
  }
}
