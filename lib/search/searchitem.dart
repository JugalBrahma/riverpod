import 'package:state_provider_riverpod_with_copywith/search/searchmodel.dart';

class Searchitem {
  final List<Items> allitems;
  final List<Items> filteredItems;
  final String search;
  Searchitem({
    required this.allitems,
    required this.filteredItems,
    required this.search,
  });

  Searchitem copyWith({
    List<Items>? allitems,
    List<Items>? filteredItems,
    String? search,
  }) {
    return Searchitem(
      allitems: allitems ?? this.allitems,
      filteredItems: filteredItems ?? this.filteredItems,
      search: search ?? this.search,
    );
  }
}
