import 'package:demo_app/src/models/profile.dart';

class AuthRepository {
  Future<Profile> register(String email, String name, String lastName) async => Profile(
        name,
        lastName,
        email,
      );
}
