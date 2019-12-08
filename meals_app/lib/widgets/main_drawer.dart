import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';
import '../screens/tabs_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTitle({@required String title, @required IconData icon, @required onTapHandler}) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            color: Theme.of(context).accentColor,
            alignment: Alignment.centerLeft,
            width: double.infinity,
            height: 120,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                color: Theme.of(context).primaryColor,
                fontSize: 30,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTitle(
            title: 'Meals',
            icon: Icons.restaurant,
            onTapHandler: () {
              Navigator.of(context).pushReplacementNamed(TabsScreen.routeName);
            },
          ),
          buildListTitle(
            title: 'Filters',
            icon: Icons.settings,
            onTapHandler: () {
              Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
