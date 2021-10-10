import 'package:demo_app/src/common/service/profile_repository.dart';
import 'package:demo_app/src/modules/showroom/models/item.dart';
import 'package:demo_app/src/modules/showroom/service/showroom_service.dart';
import 'package:flutter/material.dart';

enum States { content, loading, error }

class OrderViewModel with ChangeNotifier {
  final BuildContext context;

  States state = States.loading;

  final ShowroomService _showroomService;
  final ProfileRepository _profileRepository;

  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late final  Item item;

  OrderViewModel(
    this.context,
    this._showroomService,
    this._profileRepository,
  ) {
    item = ModalRoute.of(context)?.settings.arguments as Item;
    load();
  }

  void load() async {
    state = States.loading;
    notifyListeners();

    try {
      final user = await _profileRepository.getProfile();

      nameController.text = user.name;
      lastNameController.text = user.lastName;
      emailController.text = user.email;

      state = States.content;
      
    } on Exception catch (_) {
      state = States.content;
    } finally {
      notifyListeners();
    }
  }

  void orderItem() {
    _showroomService.order(item);
    Navigator.of(context).maybePop();
  }
}
