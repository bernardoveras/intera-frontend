abstract class IProfileRepository{
  Future<void> changeName(String name);
  Future<void> changeEmail(String email);
  Future<void> changePassword(String password);
}