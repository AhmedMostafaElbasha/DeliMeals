import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../data/dummy_data.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  var _isInitialLoaded = false;
  @override
  void initState() {
    super.initState();
    //...
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInitialLoaded) {
      final routeArguments =
          ModalRoute.of(context).settings.arguments as Map<String, Object>;
      categoryTitle = routeArguments['title'];
      final categoryId = routeArguments['id'];
      displayedMeals = DUMMY_MEALS.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _isInitialLoaded = true;
    }
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemBuilder: (builderContext, index) {
            return MealItem(
              id: displayedMeals[index].id,
              title: displayedMeals[index].title,
              imageUrl: displayedMeals[index].imageUrl,
              duaration: displayedMeals[index].duration,
              complexity: displayedMeals[index].complexity,
              affordability: displayedMeals[index].affordability,
              removeItem: _removeMeal,
            );
          },
          itemCount: displayedMeals.length,
        ),
      ),
    );
  }
}
