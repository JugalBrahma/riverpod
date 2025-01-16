import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchProvider =
    StateNotifierProvider<SearchNotifier, SearchState>((ref) {
  return SearchNotifier();
});

// class SearchNotifier extends StateNotifier<String> {
//   SearchNotifier() : super(''); // Initialize state as an empty string

//   void search(String query) {
//     state = query;
//   }
// }
class SearchNotifier extends StateNotifier<SearchState> {
  SearchNotifier()
      : super(SearchState(search: '', isChange: false)); // Initialize state

  void search(String query) {
    state = state.copyWith(search: query);
  }

  void onChange(bool isChange) {
    state = state.copyWith(isChange: isChange);
  }
}

class SearchState {
  final String search;
  final bool isChange;
  SearchState({required this.search, required this.isChange});

  SearchState copyWith({
    String? search,
    bool? isChange,
  }) {
    return SearchState(
      search: search ?? this.search,
      isChange: isChange ?? this.isChange,
    );
  }
}
