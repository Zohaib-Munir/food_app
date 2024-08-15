import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/model/meal.dart';
import 'package:food_app/riverpod/async_notifier.dart';

final appStateNotifierPovider =
    AsyncNotifierProvider.autoDispose<AppStateNotifier, Meal>(() {
  return AppStateNotifier();
});
