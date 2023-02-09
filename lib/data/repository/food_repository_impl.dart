import 'package:food_app/data/repository/food_repository.dart';
import 'package:food_app/data/remote/food_api.dart';
import 'package:food_app/data/remote/model/food.dart';

class FoodRepositoryImpl extends FoodRepository {
  final FoodApi api;

  FoodRepositoryImpl({required this.api});

  @override
  Stream<List<Food>> getFoodList() {
    return api.getFoods().asStream();
  }
}
