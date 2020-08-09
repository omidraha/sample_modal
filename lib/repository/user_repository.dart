import 'dart:async';

class UserRepository {
  // Sample model of user
  List items = [1, 2, 3, 4, 5];

  Future<List> getItems() async {
    return items;
  }

  Future<void> removeItem({int item}) {
    items.removeAt(item);
  }
}
