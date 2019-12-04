import 'package:flutter/material.dart';
import '../widgets/category_item.dart';

import '../data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  static const routeName = '/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DeliMeals'),
      ),
      body: SafeArea(
        child: GridView(
          padding: const EdgeInsets.all(25),
          children: DUMMY_CATEGORIES
              .map(
                (categoryData) => CategoryItem(
                  title: categoryData.title,
                  color: categoryData.color,
                  id: categoryData.id,
                ),
              )
              .toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
        ),
      ),
    );
  }
}
