
import 'package:Meal_App/widgets/meals_item.dart';

import '../models/meals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  FavoriteScreen(this.favoriteMeals);
  @override
  Widget build(BuildContext context) {
   if(favoriteMeals.isEmpty) {
      return Center(
        child: Text('No Favorite Meals yet - Try to add some'),
    );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealsItem(
            id: favoriteMeals[index].id,
            title: favoriteMeals[index].title,
            imageUrl: favoriteMeals[index].imageUrl,
            duration: favoriteMeals[index].duration,
            complexity: favoriteMeals[index].complexity,
            affordability: favoriteMeals[index].affordability,
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
   
  }
}
