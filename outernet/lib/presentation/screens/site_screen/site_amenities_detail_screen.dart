import 'package:flutter/material.dart';
import 'package:outernet/data/models/sites/common_site_model.dart';
import 'package:outernet/presentation/ui_component_resused/amenity_card.dart';

class SiteAmenitiesDetailScreen extends StatelessWidget {
  final List<GroupedService> serviceGroups;

  const SiteAmenitiesDetailScreen({super.key, required this.serviceGroups});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: serviceGroups.isNotEmpty ? ListView.separated(
        itemBuilder: (context, index) {
          return AmenityCard(
            services: serviceGroups[index].services ?? [],
            serviceGroup: serviceGroups[index].serviceGroup ?? ServiceGroup.defaultInstance,
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 20),
        itemCount: serviceGroups.length,
      ) : const Center(
        child: Text('No amenities available')
      ),
    );
  }
}