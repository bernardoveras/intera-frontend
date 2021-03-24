import 'dart:async';

abstract class ILocalStorage {
  Future add(String key, String value);
  Future<String?> get(String key);
  Future<Map<String, String>> getAll();
  Future<void> remove(String key);
  Future<void> removeKeys(List<String> keys);
  Future<void> removeAll();
  Future<bool> containsKey(String key);
}
