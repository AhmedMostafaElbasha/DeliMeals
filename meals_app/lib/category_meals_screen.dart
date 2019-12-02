import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  // final String categoryId;
  // final String categoryTitle;

  // CategoryMealsScreen({
  //   @required this.categoryId,
  //   @required this.categoryTitle,
  // });
  @override
  Widget build(BuildContext context) {
    final routeArguments = ModalRoute.of(context).settings.arguments as Map<String, Object>;

    final categoryTitle = routeArguments['title'];
    final categoryId = routeArguments['id'];
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(itemBuilder: (builderContext, index) {

      },itemCount: 0,),
    );
  }
}
