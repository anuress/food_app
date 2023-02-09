import 'package:dio/dio.dart';

import 'model/food.dart';

class FoodApi {
  final Dio api;

  FoodApi({required this.api});

  Future<List<Food>> getFoods() async {
    try {
      Response response = await api.get('/foods');
      return response.data.map<Food>((x) => Food.fromJson(x)).toList();
    } catch (e) {
      throw e.toString();
    }
  }
}
