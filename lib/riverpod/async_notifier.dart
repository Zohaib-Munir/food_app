import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/model/meal.dart';
import 'package:food_app/services/food_api_service.dart';

class AppStateNotifier extends AutoDisposeAsyncNotifier<Meal> {
  @override
  Future<Meal> build() async {
    return await fetchInitialData();
  }

  Future<Meal> fetchInitialData() async {
    state = const AsyncValue.loading();
    final api = FoodApiService();

    try {
      final data = await api.fetchAllCategories();
      state = AsyncValue.data(data);
      return data;
    } catch (error, stack) {
      state = AsyncValue.error(error, stack);
      rethrow;
    }
  }
}
