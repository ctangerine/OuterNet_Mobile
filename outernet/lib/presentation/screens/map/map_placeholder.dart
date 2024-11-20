import 'package:flutter/material.dart';
import 'package:outernet/env/log_service.dart';
import 'package:outernet/presentation/screens/map/base_map_interface.dart';

class MapPlaceholder extends StatelessWidget implements BaseMapInterface {

  @override
  void onMapCreated() {
    // handle map creation logic
    LogService().logger.i('Map created');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child: const Center(
        child: Text(
          "Map Placeholder\nChoose a map provider (Google Maps, Mapbox, etc.)",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: Colors.black54),
        ),
      ),
    );
  }
}