import 'package:flutter/material.dart';

import '../../data/remote/model/food.dart';
import 'food_item.dart';

class FoodList extends StatelessWidget {
  final List<Food> foods;
  final Future<void> Function() onRefresh;

  const FoodList({super.key, required this.foods, required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: onRefresh,
        child: GridView.builder(
            itemCount: foods.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 250,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0),
            itemBuilder: (context, index) {
              final item = foods[index];
              return FoodItem(food: item);
            }));
  }
}
