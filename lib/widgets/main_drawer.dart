import 'package:flutter/material.dart';
import 'package:mealapp/screens/filters_screen.dart';
import 'package:mealapp/screens/tabs_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget buildListTile(String text, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        text,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
      ),
      onTap: () {
        tapHandler();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).colorScheme.secondary,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile(
            'Meals',
            Icons.restaurant,
            () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          buildListTile('Filters', Icons.settings, () {
            Navigator.pushReplacementNamed(context, FilterScreen.routeName);
          }),
          // ListTile(
          //   leading: Icon(
          //     Icons.settings,
          //     size: 26,
          //   ),
          //   title: Text(
          //     'Filters',
          //     style: TextStyle(
          //       fontSize: 24,
          //       fontWeight: FontWeight.w700,
          //     ),
          //   ),
          //   onTap: null,
          // )
        ],
      ),
    );
  }
}
