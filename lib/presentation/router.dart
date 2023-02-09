import 'package:flutter/material.dart';

import '../data/remote/model/food.dart';
import 'food_detail/food_detail_screen.dart';
import 'food_list/food_list_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case FoodDetailScreen.route:
        final args = settings.arguments as Food;
        return MaterialPageRoute(builder: (_) => FoodDetailScreen(food: args));
      default:
        return MaterialPageRoute(builder: (_) => const FoodListScreen());
    }
  }
}
