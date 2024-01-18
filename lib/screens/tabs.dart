import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rmeals/notifiers/favorite_meals_notifier.dart';
import 'package:rmeals/notifiers/set_tabindex_notifier.dart';
import 'package:rmeals/screens/categories_screen.dart';
import 'package:rmeals/screens/meal_list.dart';

class Tabs extends ConsumerWidget {
  const Tabs({super.key});

  @override
  Widget build(BuildContext context, ref) {
    var activeScreenTitle = "Categories";
    Widget activeScreen = const CategoriesScreen();
    final selectedPageIndex = ref.watch(setIndexPageProvider);
    if (selectedPageIndex == 1) {
      final favoritesMeals = ref.watch(favoriteMealNotifiersProvider);
      activeScreen = MealList(
        mealList: favoritesMeals,
      );
      activeScreenTitle = 'Your Favorites';
    }
    return Scaffold(
        appBar: AppBar(centerTitle: false, title: Text(activeScreenTitle)),
        body: activeScreen,
        drawer: Drawer(),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            ref.read(setIndexPageProvider.notifier).setIndexPage(index);
          },
          currentIndex: selectedPageIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.set_meal), label: "Categories"),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorites"),
          ],
        ));
  }
}


class Drawer extends StatelessWidget {
  const Drawer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
