import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
final class LocationHandler {
  final StreamController<LatLng> _locationController = StreamController<LatLng>.broadcast();
  Stream<LatLng> get locationStream => _locationController.stream;

  StreamSubscription<Position>? _positionStreamSubscription;

  Future<void> initialize() async {
    final isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isLocationServiceEnabled) {
      throw Exception('Location services are disabled');
    }

    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permissions are permanently denied');
    }

    // Start listening to location updates
    await startLocationUpdates();
  }

  Future<void> startLocationUpdates() async {
    _positionStreamSubscription?.cancel();

    _positionStreamSubscription = Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 80, // Update every 10 meters
      ),
    ).listen(
      (Position position) {
        _locationController.add(LatLng(position.latitude, position.longitude));
      },
      onError: (error) {
        if (kDebugMode) {
          print('Location Error: $error');
        }
      },
    );
  }

  Future<LatLng> getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 80, // Update every 10 meters
      ),
    );
    return LatLng(position.latitude, position.longitude);
  }

  void dispose() {
    _positionStreamSubscription?.cancel();
    _locationController.close();
  }
}
