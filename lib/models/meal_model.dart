enum Complexity {
  simple,
  challenging,
  hard,
}

enum Affordability {
  affordable,
  pricey,
  luxurious,
}

class MealModel {
  final String id;
  final String title;
  final String imageURL;
  final List<String> categories;
  final List<String> steps;
  final List<String> ingredients;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;
  const MealModel(
      {required this.id,
      required this.title,
      required this.imageURL,
      required this.categories,
      required this.steps,
      required this.duration,
      required this.isVegan,
      required this.isVegetarian,
      required this.isLactoseFree,
      required this.isGlutenFree,
      required this.affordability,
      required this.complexity,required this.ingredients});
}
