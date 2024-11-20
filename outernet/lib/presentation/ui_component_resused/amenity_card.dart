import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:outernet/data/models/sites/site_response_model.dart';
import 'package:outernet/presentation/themes.dart';

class AmenityCard extends StatelessWidget {
  final groupIconMapping = {
    "Internet": Iconsax.wifi,
    "Đồ ăn & Đồ uống": Iconsax.cake,
    "Hoạt động giải trí": Iconsax.game,
    "Tiện nghi trong phòng": Iconsax.home,
    "Loại phòng": Iconsax.ranking,
    "Tiện nghi": Iconsax.verify,
  };

  final ServiceGroup serviceGroup;
  final List<Service> services;

  AmenityCard({super.key, required this.services, required this.serviceGroup});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(groupIconMapping[serviceGroup.serviceGroupName] ?? Iconsax.home),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 7),
              Text(
                serviceGroup.serviceGroupName?.isNotEmpty == true
                    ? serviceGroup.serviceGroupName!
                    : 'Chưa rõ',
                style: AppTextStyles.title1Semibold,
              ),
              const SizedBox(height: 10),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: services.length,
                separatorBuilder: (context, index) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  return Text(
                    services[index].serviceName ?? 'Unknown',
                    style: AppTextStyles.body1Regular,
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}