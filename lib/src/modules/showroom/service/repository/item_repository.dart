import 'package:demo_app/src/modules/showroom/models/item.dart';

class ItemsRepository {
  Future<List<Item>> getItems() {
    return Future.value(
      [
        Item("Master's table", 'https://images.megapixl.com/2661/26616139.jpg'),
        Item("Master's table", 'https://images.megapixl.com/2661/26616139.jpg'),
        Item("Master's table", 'https://images.megapixl.com/2661/26616139.jpg'),
        Item("Master's sofa", 'https://images.unsplash.com/photo-1555041469-a586c61ea9bc?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1770&q=80'),
        Item("Master's table", 'https://images.megapixl.com/2661/26616139.jpg'),
        Item("Master's table", 'https://images.megapixl.com/2661/26616139.jpg'),
        Item("Master's table", 'https://images.megapixl.com/2661/26616139.jpg'),
        Item("Master's table", 'https://images.megapixl.com/2661/26616139.jpg'),
        Item("Master's table", 'https://images.megapixl.com/2661/26616139.jpg'),
        Item("Master's table", 'https://images.megapixl.com/2661/26616139.jpg'),
        Item("Master's table", 'https://images.megapixl.com/2661/26616139.jpg'),
        Item("Master's table", 'https://images.megapixl.com/2661/26616139.jpg'),
        Item("Master's table", 'https://images.megapixl.com/2661/26616139.jpg'),
        Item("Master's table", 'https://images.megapixl.com/2661/26616139.jpg'),
        Item("Master's table", 'https://images.megapixl.com/2661/26616139.jpg'),
        Item("Master's table", 'https://images.megapixl.com/2661/26616139.jpg'),
        Item("Master's table", 'https://images.megapixl.com/2661/26616139.jpg'),
        Item("Master's table", 'https://images.megapixl.com/2661/26616139.jpg'),
      ],
    );
  }
}
