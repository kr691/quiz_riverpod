import 'package:flutter/material.dart';
import 'package:rmeals/data/data.dart';
import 'package:rmeals/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 3 / 2),
        children: availableCategories.map((category) {
          return CategoryGridItem(category: category);
        }).toList(),
      ),
    );
  }
}



