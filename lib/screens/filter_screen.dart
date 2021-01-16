import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterSreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function savefilters;
  final Map<String, bool> currentfilters;
  FilterSreen(this.currentfilters, this.savefilters);

  @override
  _FilterSreenState createState() => _FilterSreenState();
}

class _FilterSreenState extends State<FilterSreen> {
  bool _gluternFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactosefree = false;

  @override
  initState() {
    _gluternFree = widget.currentfilters['gluten'];
    _lactosefree = widget.currentfilters['lactose'];
    _vegetarian = widget.currentfilters['vegetarian'];
    _vegan = widget.currentfilters['vegan'];

    super.initState();
  }

  Widget builderSwitchListTile(
      String title, var currentValue, String subtitle, Function updatevalue) {
    return SwitchListTile(
        title: Text(title),
        value: currentValue,
        subtitle: Text(subtitle),
        onChanged: updatevalue);
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
                final selectedFilters = {
                  'gluten': _gluternFree,
                  'lactose': _lactosefree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                widget.savefilters(selectedFilters);
              },
            )
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust Your Meal selection',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                builderSwitchListTile(
                    'gluten-free', _gluternFree, 'only gluten free meal',
                    (newValue) {
                  setState(() {
                    _gluternFree = newValue;
                  });
                }),
                builderSwitchListTile(
                    'Lactose-free', _lactosefree, 'only lactos free meal',
                    (newValue) {
                  setState(() {
                    _lactosefree = newValue;
                  });
                }),
                builderSwitchListTile(
                    'Vegetarian', _vegetarian, 'only vegetrain meal',
                    (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                }),
                builderSwitchListTile('Vegan', _vegan, 'only vegan meal',
                    (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                }),
              ],
            ))
          ],
        ));
  }
}
