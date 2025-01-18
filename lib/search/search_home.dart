import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_provider_riverpod_with_copywith/search/searchprovider.dart';

class SearchHome extends ConsumerWidget {
  const SearchHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Search your Items',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  ref.read(searchProvider.notifier).filterList(value);
                },
              ),
            ),
          ),
          const SizedBox(height: 25),
          Expanded(
            child: ListView.builder(
              itemCount: ref.watch(searchProvider).filteredItems.length,
              itemBuilder: (context, index) {
                final item = ref.watch(searchProvider).filteredItems[index];
                return ListTile(
                  title: Text(item.name),
                  trailing: Icon(
                    item.favourite ? Icons.favorite : Icons.favorite_border,
                  ),
                );
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          ref.read(searchProvider.notifier).addItem();
        },
      ),
    );
  }
}
