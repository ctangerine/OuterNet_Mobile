import 'package:flutter/material.dart';

abstract class BaseMapInterface extends StatelessWidget {
  const BaseMapInterface({super.key});

  void onMapCreated();
}