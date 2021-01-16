import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoritemeals;
  FavoriteScreen(this.favoritemeals);
  @override
  Widget build(BuildContext context) {
    if (favoritemeals.isEmpty) {
      return Center(
          child: Text('You have no favorites yet- start adding some!'));
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favoritemeals[index].id,
            title: favoritemeals[index].title,
            imageUrl: favoritemeals[index].imageUrl,
            duration: favoritemeals[index].duration,
            complexity: favoritemeals[index].complexity,
            affordability: favoritemeals[index].affordability,
          );
        },
        itemCount: favoritemeals.length,
      );
    }
  }
}
