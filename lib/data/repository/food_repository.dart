import '../remote/model/food.dart';

abstract class FoodRepository {
  Stream<List<Food>> getFoodList();
}
