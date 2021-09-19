import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoritesMeals;

  FavoritesScreen(this.favoritesMeals);

  @override
  Widget build(BuildContext context) {
    if (favoritesMeals.isEmpty) {
      return Container(
        child: Text('You have no favorites yet.'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, i) => MealItem(
          id: favoritesMeals[i].id,
          title: favoritesMeals[i].title,
          imageUrl: favoritesMeals[i].imageUrl,
          duration: favoritesMeals[i].duration,
          complexity: favoritesMeals[i].complexity,
          affordability: favoritesMeals[i].affordability,
        ),
        itemCount: favoritesMeals.length,
      );
    }
  }
}
