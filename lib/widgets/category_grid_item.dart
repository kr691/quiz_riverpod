import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rmeals/models/category_model.dart';
import 'package:rmeals/screens/meal_list.dart';
import 'package:rmeals/notifiers/meals_provider.dart';

class CategoryGridItem extends ConsumerWidget {
  final CategoryModel category;
  const CategoryGridItem({super.key, required this.category});

  @override
  Widget build(BuildContext context, ref) {
    final mealList = ref.read(mealProviderProvider);
    final filterMeal = mealList.where((meals) {
      return meals.categories.contains(category.id);
    }).toList();
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MealList(
                      mealList: filterMeal,
                      title: category.title,
                    )));
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(colors: [
              category.color.withOpacity(0.55),
              category.color.withOpacity(0.9),
            ])),
        child: Text(
          category.title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      ),
    );
  }
}
