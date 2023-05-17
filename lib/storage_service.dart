import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  final _service = const FlutterSecureStorage();

  void saveValue(String key, String value) async => await _service.write(
        key: key,
        value: value,
        aOptions: const AndroidOptions(encryptedSharedPreferences: true),
      );

  Future<String> fetchValue(String key) async {
    return await _service.read(key: key) ?? "";
  }
}
