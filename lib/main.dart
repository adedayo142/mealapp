import 'package:flutter/material.dart';
import 'package:mealapp/screens/categories_screen.dart';
import 'package:mealapp/screens/category_meals_screen.dart';
import 'package:mealapp/screens/filters_screen.dart';
import 'package:mealapp/screens/meal_detail_screen.dart';
import 'package:mealapp/screens/tabs_screen.dart';
import './screens/meal_detail_screen.dart';
import 'models/meal.dart';
import './dummy_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoritedMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if ((_filters['gluten'] ?? false) && !meal.isGlutenFree) {
          return false;
        }
        if ((_filters['lactose'] ?? false) && !meal.isLactoseFree) {
          return false;
        }
        if ((_filters['vegan'] ?? false) && !meal.isVegan) {
          return false;
        }
        if ((_filters['vegetarian'] ?? false) && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoritedMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoritedMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoritedMeals
            .add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoritedMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        //primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
        ),
        //   textTheme: ThemeData.light().textTheme.copyWith(
        //     bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1),),
        //     bodyText2: TextStyle(
        //             color: Color.fromRGBO(20, 51, 51, 1),
        //           ),
        //           titleSmall: TextStyle(
        //             fontSize: 20,
        //           )
        //   )
      ),
      //home: const TabsScreen(),
      routes: {
        '/': (ctx) => TabsScreen(
              favoriteMeals: _favoritedMeals,
            ),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(
              availableMeals: _availableMeals,
            ),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(
              toggleFavorite: _toggleFavorite,
              isFavorite: _isMealFavorite,
            ),
        FilterScreen.routeName: (ctx) => FilterScreen(
              currentFilters: _filters,
              saveFilters: _setFilters,

            )
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => CategoriesScreen(),
        );
      },
    );
  }
}
