abstract class JsonSerializer<T extends Object> {
  T fromMap(Map<String, dynamic> json);
  Map<String, dynamic> mapOf(T object);
}