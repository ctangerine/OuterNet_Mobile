import 'dart:convert';

import 'package:flutter/services.dart';

class Config {
  final String apiBaseUrl;
  final String logLevel;

  Config({required this.apiBaseUrl,required this.logLevel});
  
  factory Config.fromJson(Map<String, dynamic> json) {
    return Config( 
      apiBaseUrl: json['apiBaseUrl'], 
      logLevel: json['logLevel'], 
    ); 
  }
}

class ConfigManager {
  static final ConfigManager _instance = ConfigManager._internal();
  late Config _config;

  ConfigManager._internal();

  factory ConfigManager() {
    return _instance;
  }

  void init(Config config) {
    _config = config;
  }

  Config get config => _config;
}

class ConfigLoader {
  static Future<Config> load(String env) async {
    final configString = await rootBundle.loadString('lib/env/${env}_config.json');
    final jsonMap = json.decode(configString) as Map<String, dynamic>;
    return Config.fromJson(jsonMap);
  }
}
