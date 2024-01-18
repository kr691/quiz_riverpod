import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rmeals/models/meal_model.dart';
import 'package:rmeals/notifiers/favorite_meals_notifier.dart';

class MealsDetailScreen extends ConsumerWidget {
  final MealModel meal;
  const MealsDetailScreen({super.key, required this.meal});

  @override
  Widget build(BuildContext context, ref) {
    final favoriteMeal = ref.watch(favoriteMealNotifiersProvider);
    final bool isFavorite = favoriteMeal.contains(meal);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        centerTitle: false,
        actions: [
          IconButton(
              onPressed: () {
                final wasAdded = ref
                    .read(favoriteMealNotifiersProvider.notifier)
                    .setFavoriteMeal(meal);
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(wasAdded ? "Meal Added" : "Meal Removed")));
              },
              icon: Icon(isFavorite ? Icons.star : Icons.star_border))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageURL,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 14),
            Text(
              "Ingredient",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 14),
            ...meal.ingredients.map((ingredient) {
              return Text(
                ingredient,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              );
            }).toList(),
            const SizedBox(height: 14),
            Text(
              "Steps",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 14),
            ...meal.steps.map((steps) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Text(
                  steps,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
