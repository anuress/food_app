import 'dart:async';

import 'package:bloc/bloc.dart';

import '../data/repository/food_repository.dart';
import '../data/remote/model/food.dart';
import 'food_event.dart';
import 'food_state.dart';
import 'food_status.dart';

class FoodBloc extends Bloc<FoodEvent, FoodListState> {
  final FoodRepository _repository;

  FoodBloc({required FoodRepository repository})
      : _repository = repository,
        super(const FoodListState()) {
    on<FoodListRequested>(_onFoodListRequested);
  }

  FutureOr<void> _onFoodListRequested(
      FoodListRequested event, Emitter<FoodListState> emit) async {
    emit(state.copyWith(status: () => FoodListStatus.loading));

    await emit.forEach<List<Food>>(_repository.getFoodList(),
        onData: (foods) => state.copyWith(
            status: () => FoodListStatus.success, foods: () => foods),
        onError: (_, __) => state.copyWith(status: () => FoodListStatus.error));
  }
}
