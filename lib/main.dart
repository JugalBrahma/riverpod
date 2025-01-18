import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_provider_riverpod_with_copywith/search/search_home.dart';
import 'package:state_provider_riverpod_with_copywith/statenotifier/home_statenotifier.dart';
import 'package:state_provider_riverpod_with_copywith/todostatenotifier/home_page.dart';
//import 'package:state_provider_riverpod_with_copywith/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const ProviderScope(
      child: MaterialApp(
        home: SearchHome(),
      ),
    );
  }
}
