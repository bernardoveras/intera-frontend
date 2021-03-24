import 'dart:async';
import 'package:get_storage/get_storage.dart';
import 'package:intera/domain/services/local_storage_service.dart';

class LocalStorageService implements ILocalStorage {
  final GetStorage _storage;
  LocalStorageService(this._storage);

  /// Saves a [value] to persistent storage in the background.
  @override
  Future add(String key, String value) async {
    return await _storage.write(key, value);
  }

  /// Reads a value of any type from persistent storage.
  @override
  Future<String?> get(String key) async => _storage.read(key);

  // Reads all value of any type from persistent storage.
  @override
  Future<Map<String, String>> getAll() async => await _storage.getValues();

  /// Removes an entry from persistent storage.
  @override
  Future<void> remove(String key) async => await _storage.remove(key);

  /// Remove a list of data from storage
  @override
  Future<void> removeKeys(List<String> keys) async {
    if (keys.length > 0) {
      for (var i = 0; i < keys.length; i++) {
        await _storage.remove(keys[i]);
      }
    }
  }

  /// Completes with true once the user preferences for the app has been cleared.
  @override
  Future<void> removeAll() async => await _storage.erase();

  /// Returns true if persistent storage the contains the given [key].
  @override
  Future<bool> containsKey(String key) async => _storage.hasData(key);
}
