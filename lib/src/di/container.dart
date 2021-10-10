import 'package:demo_app/src/common/service/profile_repository.dart';
import 'package:demo_app/src/common/service/profile_storage.dart';
import 'package:demo_app/src/modules/showroom/service/repository/item_repository.dart';
import 'package:demo_app/src/modules/showroom/service/showroom_service.dart';

class Di {
  static final Di instance = Di._();

  late ProfileStorage profileStorage;
  late ProfileRepository profileRepository;

  late ShowroomService showroomService;

  Di._() {
    profileStorage = ProfileStorage();
    profileRepository = ProfileRepository(profileStorage);

    showroomService = ShowroomService(ItemsRepository());
  }
}
