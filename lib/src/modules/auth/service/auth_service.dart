import 'package:demo_app/src/common/service/profile_repository.dart';
import 'package:demo_app/src/models/profile.dart';
import 'package:demo_app/src/modules/auth/service/repository/auth_repository.dart';

class AuthService {
  final AuthRepository _repo;
  final ProfileRepository _profileRepository;

  AuthService(this._repo, this._profileRepository);

  Future<Profile> register(String email, String name, String lastName) async {
    final user = await _repo.register(email, name, lastName);

    _profileRepository.saveProfile(user);

    return user;
  }
}