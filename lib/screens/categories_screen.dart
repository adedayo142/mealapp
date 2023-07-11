import 'package:flutter/material.dart';
//import 'package:mealapp/models/meal.dart';
import '../dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen( {Key? key}) : super(key: key);
  //List<Meal> availableMeals,

  @override
  Widget build(BuildContext context) {
    return  GridView(
        padding: const EdgeInsets.all(25),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: DUMMY_CATEGORIES.map((e)=> CategoryItem(title: e.title, color: e.color, id: e.id,)).toList(),
    );
  }
}
