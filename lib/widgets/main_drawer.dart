import 'package:Meal_App/screens/filters_screen.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String text, IconData icon, Function selectPage) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        text,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: selectPage,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          buildListTile(
            'Meals',
            Icons.restaurant_menu,
            () {
              Navigator.of(context).pushReplacementNamed('/');
            }
          ),
          buildListTile(
            'Filters',
            Icons.settings,
            () {
              Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
            }
          ),
        ],
      ),
    );
  }
}
