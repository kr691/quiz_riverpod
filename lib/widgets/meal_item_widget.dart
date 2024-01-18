import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import '../models/meal_model.dart';
import '../screens/meal_details_screen.dart';
import 'meal_item_trait.dart';

class MealItemWidget extends StatelessWidget {
  const MealItemWidget({
    super.key,
    required this.data,
  });

  final MealModel data;
  String get complexityText {
    return data.complexity.name[0].toUpperCase() +
        data.complexity.name.substring(1);
  }

  String get affordabilityText {
    return data.affordability.name[0].toUpperCase() +
        data.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MealsDetailScreen(meal: data)));
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(data.imageURL),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
                left: 0,
                bottom: 0,
                child: Container(
                  color: Colors.black54,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 44),
                  child: Column(
                    children: [
                      Text(
                        data.title,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MealItemTrait(
                            icon: Icons.schedule,
                            label: '${data.duration} min',
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          MealItemTrait(
                            icon: Icons.work,
                            label: complexityText,
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          MealItemTrait(
                            icon: Icons.attach_money,
                            label: affordabilityText,
                          ),
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
