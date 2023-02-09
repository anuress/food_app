import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/food_bloc.dart';
import '../../bloc/food_event.dart';
import '../../bloc/food_state.dart';
import '../../bloc/food_status.dart';
import '../../data/repository/food_repository.dart';
import '../../di/locator.dart';
import 'food_list.dart';

class FoodListScreen extends StatelessWidget {
  const FoodListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Foodies'),
        ),
        body: SafeArea(
          child: Column(
            children: [
              BlocProvider<FoodBloc>(
                create: (_) =>
                    FoodBloc(repository: sl<FoodRepository>())
                      ..add(FoodListRequested()),
                child: Expanded(
                  child: BlocBuilder<FoodBloc, FoodListState>(
                      builder: (context, state) {
                    switch (state.status) {
                      case FoodListStatus.loading:
                        return const Center(child: CircularProgressIndicator());
                      case FoodListStatus.success:
                        return FoodList(
                            foods: state.foods,
                            onRefresh: () async {
                              context.read<FoodBloc>().add(FoodListRequested());
                            });
                      case FoodListStatus.error:
                        return const Text('Error');
                    }
                  }),
                ),
              )
            ],
          ),
        ));
  }
}
