import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:outernet/env/log_service.dart';

final logger = LogService().logger;

class SecureStorage {
  // Create a private constructor
  SecureStorage._privateConstructor();

  // Create a single instance of the class
  static final SecureStorage instance = SecureStorage._privateConstructor();

  // Create an instance of FlutterSecureStorage
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  // Write a value to the secure storage
  Future<void> write(String key, String value) async {
    await _storage.write(key: key, value: value);

    final allKeys = await _storage.readAll();
    logger.i("SecureStorage: write $key: $value\nTotal keys: ${allKeys.length}");
  }

  // Read a value from the secure storage
  Future<String?> read(String key) async {
    return await _storage.read(key: key);
  }

  // Delete a value from the secure storage
  Future<void> delete(String key) async {
    await _storage.delete(key: key);
  }

  // Clear all values from the secure storage
  Future<void> clear() async {
    await _storage.deleteAll();
  }
}
