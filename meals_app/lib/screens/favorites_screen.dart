import 'package:flutter/material.dart';

import 'package:meals_app/models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  static const routeName = '/favorites-screen';

  final List<Meal> favoriteMeals;

  FavoritesScreen({
    @required this.favoriteMeals,
  });

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text('There is no favorites - try add some!'),
      );
    } else {
      return ListView.builder(
          itemBuilder: (builderContext, index) {
            return MealItem(
              id: favoriteMeals[index].id,
              title: favoriteMeals[index].title,
              imageUrl: favoriteMeals[index].imageUrl,
              duaration: favoriteMeals[index].duration,
              complexity: favoriteMeals[index].complexity,
              affordability: favoriteMeals[index].affordability,
            );
          },
          itemCount: favoriteMeals.length,
        );
    }
  }
}
