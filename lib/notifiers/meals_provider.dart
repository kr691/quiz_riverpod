import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rmeals/data/data.dart';
import 'package:rmeals/models/meal_model.dart';
part 'meals_provider.g.dart';
@riverpod
List<MealModel> mealProvider(MealProviderRef ref) {
  return dummyMeals;
}
