import 'package:flutter/widgets.dart';
import 'package:outernet/presentation/screens/asset_links.dart';
import 'package:outernet/presentation/widgets/icon_custom.dart';

Widget buildFlareIcon() {
  return const Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      IconCustom(
        svgIcon: flareIcon,
        width: 48,
        height: 48,
        color: Color.fromARGB(255, 246, 140, 2),
      ),
    ],
  );
}