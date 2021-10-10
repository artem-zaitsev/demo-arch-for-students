import 'package:demo_app/src/common/service/profile_storage.dart';
import 'package:demo_app/src/models/profile.dart';

class ProfileRepository {

  final ProfileStorage _storage;

  ProfileRepository(this._storage);


  Future<Profile> getProfile() async {
    final profile = _storage.profile;

    if (profile == null) throw Exception();

    return profile;
  }


  Future<void> saveProfile(Profile profile) async {
    _storage.profile = profile;
  }

}