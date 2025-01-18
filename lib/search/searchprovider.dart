import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_provider_riverpod_with_copywith/search/searchitem.dart';
import 'package:state_provider_riverpod_with_copywith/search/searchmodel.dart';
import 'package:state_provider_riverpod_with_copywith/todostatenotifier/item_model.dart';

final searchProvider = StateNotifierProvider<Searchprovider, Searchitem>((ref) {
  return Searchprovider();
});

class Searchprovider extends StateNotifier<Searchitem> {
  Searchprovider()
      : super(Searchitem(allitems: [], filteredItems: [], search: ''));
  void addItem() {
    final List<Items> items = [
      Items(id: 1, name: 'Mohit', favourite: false),
      Items(id: 2, name: 'Rohan', favourite: true),
      Items(id: 3, name: 'Arjun', favourite: false),
      Items(id: 4, name: 'Bheem', favourite: true),
      Items(id: 5, name: 'Pj', favourite: false),
    ];

    state = state.copyWith(
      allitems: items.toList(),
      filteredItems: items.toList(),
    );
  }

  void filterList(String search) {
    state = state.copyWith(filteredItems: _filterItems(state.allitems, search));
  }

  List<Items> _filterItems(List<Items> items, String search) {
    if (search.isEmpty) {
      return items;
    }
    return items
        .where((item) => item.name.toLowerCase().contains(search.toLowerCase()))
        .toList(); //For each item in the list:
//Converts item.name and search to lowercase using .toLowerCase() (to make the comparison case-insensitive).
//Checks if item.name contains the search string using .contains().
// Returns true if it matches, or false otherwise.
// .toList():
// After filtering, the result is a lazy Iterable.
// .toList() converts this Iterable into a new list, which is the final filtered result.
// "item1".toLowerCase().contains("i") → true
// "apple".toLowerCase().contains("i") → false
// "ink".toLowerCase().contains("i") → true
// "orange".toLowerCase().contains("i") → false
  }
}
