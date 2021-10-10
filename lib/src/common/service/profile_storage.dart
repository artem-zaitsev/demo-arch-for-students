import 'package:demo_app/src/models/profile.dart';
import 'package:flutter/foundation.dart';

/// Хранилище профиля, сообщает об изменениях подписчикам.
class ProfileStorage extends ChangeNotifier {
  Profile? _profile;

  Profile? get profile => _profile;

  set profile(Profile? profile) {
    _profile = profile;

    notifyListeners();
  }
}
