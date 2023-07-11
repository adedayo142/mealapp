import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
   static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  const FilterScreen(
      {Key? key, required this.saveFilters, required this.currentFilters})
      : super(key: key);



  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten']!;
    _lactoseFree = widget.currentFilters['lactose']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    _vegan = widget.currentFilters['vegan']!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your filters"),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                widget.saveFilters(selectedFilters);
              })
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text('Adjust your meal selection'),
          ),
          Expanded(
            child: ListView(
              children: [
                // _buildSwitchListTile("Gluten-free",
                //     "Only include gluten-free meals", _glutenFree, (newValue) {
                //   setState(() {
                //     _glutenFree = newValue;
                //   });
                // }),
                // _buildSwitchListTile(
                //     "Lactose-free",
                //     "Only include lactose-free meals",
                //     _lactoseFree, (newValue) {
                //   setState(() {
                //     _lactoseFree = newValue;
                //   });
                // }),
                // _buildSwitchListTile(
                //     "Vegetarian", "Only include vegetarian meals", _vegetarian,
                //     (newValue) {
                //   setState(() {
                //     _vegetarian = newValue;
                //   });
                // }),
                // _buildSwitchListTile(
                //     "Vegan", "Only include vegan meals", _vegan, (newValue) {
                //   setState(() {
                //     _vegan = newValue;
                //   });
                // }),
                SwitchListTile(
                    title: Text("Gluten-free"),
                    value: _glutenFree,
                    subtitle: Text('Only include gluten-free meals'),
                    onChanged: (newValue) {
                      setState(() {
                        _glutenFree = newValue;
                      });
                    }),
                      SwitchListTile(
                    title: Text("Lactose-free"),
                    value: _lactoseFree,
                    subtitle: Text('Only include lactose-free meals'),
                    onChanged: (newValue) {
                      setState(() {
                        _lactoseFree = newValue;
                      });
                    }),
                       SwitchListTile(
                    title: Text("Vegetarian"),
                    value: _vegetarian,
                    subtitle: Text('Only include vegetarian meals'),
                    onChanged: (newValue) {
                      setState(() {
                        _vegetarian = newValue;
                      });
                    }),
                       SwitchListTile(
                    title: Text("Vegan"),
                    value: _vegan,
                    subtitle: Text('Only include vegan meals'),
                    onChanged: (newValue) {
                      setState(() {
                        _vegan = newValue;
                      });
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
        title: Text(title),
        value: currentValue,
        subtitle: Text(description),
        onChanged:
       updateValue(currentValue),


        );
  }
}
