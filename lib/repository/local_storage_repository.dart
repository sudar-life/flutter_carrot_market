import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorageRepository {
  final _storage = FlutterSecureStorage();
  Future<String?> getStoredValue(String key) async {
    try {
      return await _storage.read(key: key);
    } catch (error) {
      return null;
    }
  }

  Future<void> storeValue(String key, String value) async {
    try {
      await _storage.write(key: key, value: value.toString());
    } catch (error) {
      return null;
    }
  }

  Future<void> deleteStoredValue(String key) async {
    try {
      await _storage.delete(key: key);
    } catch (exception) {
      print(exception);
    }
  }
}
