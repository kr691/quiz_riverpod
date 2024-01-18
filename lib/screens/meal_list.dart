import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/meal_model.dart';
import '../widgets/meal_item_widget.dart';

class MealList extends StatelessWidget {
  final List<MealModel> mealList;
  final String? title;
  const MealList({super.key, required this.mealList,this.title});

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
        itemCount: mealList.length,
        itemBuilder: (context, index) {
          final data = mealList[index];
          return MealItemWidget(data: data);
        });
    if(mealList.isEmpty){
      content = Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Uh ho .... nothing here",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              "Try selecting a different category!",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
          ],
        ),
      );
    }

    if (title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(title!),
      ),
      body: content
    );
  }
}


