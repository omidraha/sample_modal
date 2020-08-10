import 'dart:async';

class UserRepository {
  // Sample model of user
  List items = [1, 2, 3, 4, 5];

  Future<List> getItems() async {
    return items;
  }

  Future<void> removeItem({int item}) async {
    // Load from API
    items.removeAt(item);
  }

  Future<void> addItem() async {
    // Load from API
    items.add(items.length);
  }
}
