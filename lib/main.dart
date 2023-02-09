import 'package:flutter/material.dart';

import 'di/locator.dart';
import 'presentation/food_list/food_list_screen.dart';
import 'presentation/router.dart';

void main() {
  initLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foodie',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const FoodListScreen(),
      onGenerateRoute: _appRouter.onGenerateRoute,
    );
  }
}
