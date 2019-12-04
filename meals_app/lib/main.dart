import 'package:flutter/material.dart';
import 'package:meals_app/screens/meal-detail_screen.dart';

import './screens/category_meals_screen.dart';
import './screens/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
      initialRoute: CategoriesScreen.routeName, // Default: '/' 
      routes: {
        CategoriesScreen.routeName:  (contextt) => CategoriesScreen(),
        CategoryMealsScreen.routeName: (contextt) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (contextt) => MealDetailScreen(),
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