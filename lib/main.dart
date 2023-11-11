import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mechanic_baato/src/features/routing/app_router.dart';
import 'package:mechanic_baato/src/utils/themes/theme.dart';

void main() {
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: goRouter(),
      theme: BaatoAppTheme.lightTheme,
      darkTheme: BaatoAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      title: 'Bato Mechanic',
    );
  }
}
