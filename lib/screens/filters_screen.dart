import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> filters;

  FiltersScreen(this.filters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _lactoseFree = false;
  var _vegetarian = false;
  var _vegan = false;

  @override
  initState() {
    _glutenFree = widget.filters['gluten'];
    _lactoseFree = widget.filters['lactose'];
    _vegetarian = widget.filters['vegetarian'];
    _vegan = widget.filters['vegan'];

    super.initState();
  }

  Widget _buildSwitchListTile(
      String title, String description, bool currValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final updates = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegetarian': _vegetarian,
                  'vegan': _vegan
                };

                widget.saveFilters(updates);
              })
        ],
      ),
      drawer: MainDrawer(),
      body: Column(children: [
        Container(
          padding: EdgeInsets.all(20),
          child: Text('Adjust your meal selection.'),
        ),
        Expanded(
            child: ListView(
          children: [
            _buildSwitchListTile(
                'Gluten-free', 'Only include gluten-free meals.', _glutenFree,
                (newValue) {
              setState(() {
                _glutenFree = newValue;
              });
            }),
            _buildSwitchListTile(
                'Lactose-free', 'Only include lactose-free meals.', _glutenFree,
                (newValue) {
              setState(() {
                _lactoseFree = newValue;
              });
            }),
            _buildSwitchListTile(
                'Vegetarian', 'Only include vegetarian meals.', _glutenFree,
                (newValue) {
              setState(() {
                _vegetarian = newValue;
              });
            }),
            _buildSwitchListTile(
                'Vegan', 'Only include vegan meals.', _glutenFree, (newValue) {
              setState(() {
                _vegan = newValue;
              });
            }),
          ],
        ))
      ]),
    );
  }
}
