import 'package:equatable/equatable.dart';

import '../data/remote/model/food.dart';
import 'food_status.dart';

class FoodListState extends Equatable {
  final FoodListStatus status;
  final List<Food> foods;
  final String errorMessage;

  const FoodListState(
      {this.status = FoodListStatus.loading,
      this.foods = const [],
      this.errorMessage = ''});

  @override
  List<Object?> get props => [status, foods];

  FoodListState copyWith(
      {FoodListStatus Function()? status,
      List<Food> Function()? foods,
      String Function()? errorMessage}) {
    return FoodListState(
        status: status != null ? status() : this.status,
        foods: foods != null ? foods() : this.foods,
        errorMessage: errorMessage != null ? errorMessage() : this.errorMessage);
  }
}
