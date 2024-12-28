import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:outernet/env/log_service.dart';

final logger = LogService().logger;

class SecureStorage {
  // Private constructor
  SecureStorage._privateConstructor();

  // Single instance
  static final SecureStorage instance = SecureStorage._privateConstructor();

  // FlutterSecureStorage instance
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  // Write a value (String)
  Future<void> write(String key, String value) async {
    await _storage.write(key: key, value: value);
    final allKeys = await _storage.readAll();
    logger.i("SecureStorage: write $key: $value\nTotal keys: ${allKeys.length}");
  }

  // Write a value (bool)
  Future<void> writeBool(String key, bool value) async {
    await _storage.write(key: key, value: value.toString());
    final allKeys = await _storage.readAll();
    logger.i("SecureStorage: writeBool $key: $value\nTotal keys: ${allKeys.length}");
  }

  // Read a value (String)
  Future<String?> read(String key) async {
    return await _storage.read(key: key);
  }

  // Read a value (bool)
  Future<bool> readBool(String key) async {
    final value = await _storage.read(key: key);
    if (value == null) return false;
    return value.toLowerCase() == 'true';
  }

  // Delete a value
  Future<void> delete(String key) async {
    await _storage.delete(key: key);
  }

  // Clear all values
  Future<void> clear() async {
    await _storage.deleteAll();
  }
}
