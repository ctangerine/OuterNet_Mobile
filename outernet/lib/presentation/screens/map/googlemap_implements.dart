import 'package:flutter/material.dart';
import 'package:outernet/presentation/screens/map/base_map_interface.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class GoogleMapWidget extends StatelessWidget implements BaseMapInterface {
  final LatLng initialPosition;

  const GoogleMapWidget({super.key, required this.initialPosition});

  @override
  void onMapCreated() {
    // handle map creation logic
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: initialPosition,
        zoom: 15,
      ),
      onMapCreated: (GoogleMapController controller) {
        onMapCreated();
      },
    );
  }
}