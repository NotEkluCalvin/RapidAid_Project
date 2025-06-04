import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationProvider with ChangeNotifier {
  String? currentAddress;

  LocationProvider() {
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        currentAddress = "Location services are disabled.";
        notifyListeners();
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          currentAddress = "Location permissions are denied.";
          notifyListeners();
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        currentAddress = "Location permissions are permanently denied.";
        notifyListeners();
        return;
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      currentAddress = "Lat: ${position.latitude}, Long: ${position.longitude}";
      notifyListeners();
    } catch (e) {
      currentAddress = "Error fetching location";
      notifyListeners();
    }
  }
}
