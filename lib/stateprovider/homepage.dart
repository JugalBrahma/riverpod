import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_provider_riverpod_with_copywith/slide_provider.dart';

class Homepage extends ConsumerWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer(
            builder: (context, ref, child) {
              print("build1");
              final slider = ref
                  .watch(sliderProvider.select((state) => state.showPassword));
              return InkWell(
                onTap: () {
                  final stateProvider = ref.read(sliderProvider.notifier);
                  stateProvider.state = stateProvider.state.copyWith(
                      showPassword:
                          !slider); //update with new one like ture or false
                },
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: slider
                      ? const Icon(Icons.remove_red_eye)
                      : const Icon(Icons.image),
                ),
              );
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              final slider =
                  ref.watch(sliderProvider.select((state) => state.slider));
              print("build2");
              return Container(
                height: 200,
                width: 200,
                color: Colors.red.withOpacity(slider),
              );
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              final slider =
                  ref.watch(sliderProvider.select((state) => state.slider));

              return Slider(
                  value: slider,
                  onChanged: (value) {
                    final stateProvider = ref.read(sliderProvider.notifier);
                    stateProvider.state =
                        stateProvider.state.copyWith(slider: value);
                  });
            },
          )
        ],
      ),
    );
  }
}
