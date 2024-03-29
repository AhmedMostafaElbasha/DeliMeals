import 'package:flutter/material.dart';

import './data/dummy_data.dart';
import './screens/filters_screen.dart';
import './screens/favorites_screen.dart';
import './screens/meal-detail_screen.dart';
import './screens/tabs_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/categories_screen.dart';
import './models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);

    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String mealId) {
    return _favoriteMeals.any((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      //home: CategoriesScreen(),
      initialRoute: TabsScreen.routeName, // Default: '/'
      routes: {
        TabsScreen.routeName: (contextt) => TabsScreen(
              favoriteMeals: _favoriteMeals,
            ),
        CategoriesScreen.routeName: (contextt) => CategoriesScreen(),
        // FavoritesScreen.routeName: (contextt) => FavoritesScreen(),
        CategoryMealsScreen.routeName: (contextt) => CategoryMealsScreen(
              availableMeals: _availableMeals,
            ),
        MealDetailScreen.routeName: (contextt) => MealDetailScreen(
              toggleFavorite: _toggleFavorite,
              isMealFavorite: _isMealFavorite,
            ),
        FiltersScreen.routeName: (contextt) => FiltersScreen(
              saveFilters: _setFilters,
              currentFilters: _filters,
            ),
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
        // switch (settings.name) {
        //   case CategoriesScreen.routeName:
        //   return MaterialPageRoute(builder: (contextt) => CategoriesScreen());
        //   break;
        //   case CategoryMealsScreen.routeName:
        //   return MaterialPageRoute(builder: (contextt) => CategoryMealsScreen());
        //   break;
        //   case MealDetailScreen.routeName:
        //   return MaterialPageRoute(builder: (contextt) => MealDetailScreen());
        //   break;
        //   default:
        //   return MaterialPageRoute(builder: (contextt) => CategoriesScreen());
        //   break;
        // }
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (contextt) => CategoriesScreen());
      },
    );
  }
}
