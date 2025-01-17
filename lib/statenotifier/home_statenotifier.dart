import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_provider_riverpod_with_copywith/provider.dart';

class HomeStateNotifier extends ConsumerWidget {
  const HomeStateNotifier({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Provider with Riverpod'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                ref.read(searchProvider.notifier).search(value);
              },
              decoration: const InputDecoration(
                labelText: 'Enter text',
              ),
            ),
            const SizedBox(height: 20),
            Consumer(
              builder: (context, watch, child) {
                final text = ref.watch(searchProvider);
                return Text(text.search);
              },
            ),
            Consumer(
              builder: (context, ref, child) {
                final search = ref.watch(searchProvider);
                return Switch(
                  value: search.isChange,
                  onChanged: (value) {
                    ref.read(searchProvider.notifier).onChange(value);
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
