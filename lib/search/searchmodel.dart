import 'package:state_provider_riverpod_with_copywith/todostatenotifier/item_model.dart';

class Items {
  final int id;
  final String name;
  final bool favourite;
  Items({
    required this.id,
    required this.name,
    required this.favourite,
  });
  Items copyWith({
    int? id,
    String? name,
    bool? favourite,
  }) {
    return Items(
      id: id ?? this.id,
      name: name ?? this.name,
      favourite: favourite ?? this.favourite,
    );
  }
}
