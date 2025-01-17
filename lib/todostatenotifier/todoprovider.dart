import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_provider_riverpod_with_copywith/todostatenotifier/item_model.dart';

final todoprovider = StateNotifierProvider<Todoprovider, List<Item>>((ref) {
  return Todoprovider();
});

class Todoprovider extends StateNotifier<List<Item>> {
  Todoprovider() : super([]);

  void addItem(String task) {
    final list = Item(id: DateTime.now().toString(), name: task);
    state.add(list);
    state = state.toList();
  }

  // void removeItem(int id) {
  //   state.removeAt(id);
  //   state = state.toList();
  // }
  void deletItem(String id) {
    state.removeWhere((item) => item.id == id);
    state = state.toList();
  }

  void updateItems(String id, String task) {
    int foundIndex = state.indexWhere((item) => item.id == id);
    state[foundIndex].name = task;
    state = state.toList();
  }
}
