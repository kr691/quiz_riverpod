import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rmeals/models/meal_model.dart';
part 'favorite_meals_notifier.g.dart';

@Riverpod(keepAlive: true)
class FavoriteMealNotifiers extends _$FavoriteMealNotifiers {
  @override
  List<MealModel> build() {
    return [];
  }

  bool setFavoriteMeal(MealModel mealModel) {
    final mealFavorites = state.contains(mealModel);
    if (mealFavorites) {
      state = state.where((m) => m.id != mealModel.id).toList();
      return false;
    } else {
      state = [...state, mealModel];
      return true;
    }
  }
}
