import 'package:demo_app/src/modules/showroom/models/item.dart';
import 'package:demo_app/src/modules/showroom/service/repository/item_repository.dart';

class ShowroomService {
  final ItemsRepository _itemsRepository;

  ShowroomService(this._itemsRepository);

  Future<List<Item>> getItems() {
    return _itemsRepository.getItems();
  }

  Future<void> order(Item item)  async {
    return;
  }
    
}
