import 'package:flutter/material.dart';
import 'package:food_app/presentation/food_detail/food_detail_screen.dart';

import '../../data/remote/model/food.dart';

class FoodItem extends StatelessWidget {
  final Food food;

  const FoodItem({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .pushNamed(FoodDetailScreen.route, arguments: food);
        },
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SizedBox(
              width: 300,
              height: 300,
              child: Image.network(
                food.image,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.black.withOpacity(0.5),
              padding: const EdgeInsets.all(8.0),
              child: Text(
                food.name,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
