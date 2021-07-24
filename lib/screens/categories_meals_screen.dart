import 'package:Meal_App/models/meals.dart';

import '../widgets/meals_item.dart';

import '../dummy_data.dart';
import 'package:flutter/material.dart';

class CategoriesMealsScreen extends StatefulWidget {
  static const routeName = '/category_meals';
  List<Meal> avaliableMeals;
  CategoriesMealsScreen(this.avaliableMeals);

  @override
  _CategoriesMealsScreenState createState() => _CategoriesMealsScreenState();
}

class _CategoriesMealsScreenState extends State<CategoriesMealsScreen> {
  String categoryTitle;
  List<Meal> categoryMeals;
  var _loadInitData = false;
  @override
  void didChangeDependencies() {
    if(!_loadInitData) {
      final routesArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routesArgs['id'];
    categoryTitle = routesArgs['title'];
    categoryMeals = widget.avaliableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    _loadInitData = true;
    }
    
    super.didChangeDependencies();
  }
  
  void _removeMeal(String mealId) {
    setState(() {
      categoryMeals.removeWhere((meal) => meal.id == mealId);
    });

  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealsItem(
            id: categoryMeals[index].id,
            title: categoryMeals[index].title,
            imageUrl: categoryMeals[index].imageUrl,
            duration: categoryMeals[index].duration,
            complexity: categoryMeals[index].complexity,
            affordability: categoryMeals[index].affordability,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
