import 'package:demo_app/src/modules/showroom/models/item.dart';
import 'package:demo_app/src/modules/showroom/service/showroom_service.dart';
import 'package:flutter/material.dart';

enum States { content, loading, error }

class ShowroomViewModel with ChangeNotifier {
  final BuildContext context;

  late final Iterable<Item> items;
  States state = States.loading;

  final ShowroomService _showroomService;

  ShowroomViewModel(this.context, this._showroomService) {
    load();
  }

  void load() async  {
    state = States.loading;
    notifyListeners();

    items = await _showroomService.getItems();
    state = States.content;
    notifyListeners();
  }

  void orderItem(Item item) {
    Navigator.pushNamed(context, '/order', arguments: item);
  }
}
