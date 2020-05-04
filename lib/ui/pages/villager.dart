import 'package:ACApp/models/villager.dart';
import 'package:ACApp/util/index.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../models/index.dart';
import '../widgets/index.dart';

/// COCKTAIL PAGE VIEW
/// It shows detailed information of cocktails like
/// instructions, ingredients and measure
class VillagerPage extends StatelessWidget {
  final Villager _villager;
  SharedPreferences prefs;
  List<String> villagersSelected;

  VillagerPage(this._villager);

  @override
  Widget build(BuildContext context) {
    Future<bool> _saveList() async {
      return await prefs.setStringList("key", villagersSelected);
    }

    List<String> _getList() {
      return prefs.getStringList("key");
    }

    return Scaffold(
      appBar: AppBar(title: Text(_villager.name), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          HeadCardPage(
            title: '',
            imageUrl: _villager.image,
            body: Text(
              _villager.quote,
            ),
            separator: true,
          ),
          Separator.cardSpacer(),
          CardPage(
            title: 'DETAILS',
            body: Column(
              children: <Widget>[
                _villager.gender != null
                    ? RowItem(
                        'Custom',
                        ToggleSwitch(
                            minWidth: 45.0,
                            cornerRadius: 5,
                            activeBgColor: Colors.green,
                            activeTextColor: Colors.white,
                            inactiveBgColor: Colors.grey,
                            inactiveTextColor: Colors.white,
                            labels: ['NO', 'YES'],
                            icons: [FontAwesome.check, FontAwesome.times],
                            onToggle: (index) {
                              if(index == 0)
                                removePreferences(_villager.name, 'villager');
                              else 
                                savePreferences(_villager.name, 'villager');
                                print(readPreferences('villager'));
                            }),
                      )
                    : Separator.none(),
                Separator.spacer(),
                _villager.gender != null
                    ? RowItem.iconRowSet(
                        'Gender',
                        getIconGender(
                            _villager.gender != null ? _villager.gender : ''),
                      )
                    : Separator.none(),
                Separator.spacer(),
                _villager.personality != null
                    ? RowItem.textRow(
                        context,
                        'Personality',
                        _villager.personality,
                      )
                    : Separator.none(),
                Separator.spacer(),
                _villager.species != null
                    ? RowItem.textRow(
                        context,
                        'Species',
                        _villager.species,
                      )
                    : Separator.none(),
                Separator.spacer(),
                _villager.birthday != null
                    ? RowItem.textRow(
                        context,
                        'Birthday',
                        _villager.birthday,
                      )
                    : Separator.none(),
                isDataFilled(_villager.islanderFavorite)
                    ? Separator.spacer()
                    : Separator.none(),
                isDataFilled(_villager.islanderFavorite)
                    ? RowItem.textRow(
                        context,
                        'Islander Favorite',
                        _villager.islanderFavorite,
                      )
                    : Separator.none(),
                Separator.spacer(),
                isDataFilled(_villager.islanderAllergic)
                    ? RowItem.textRow(
                        context,
                        'Islander Allergic',
                        _villager.islanderAllergic,
                      )
                    : Separator.none(),
                isDataFilled(_villager.islanderAllergic)
                    ? Separator.spacer()
                    : Separator.none(),
                _villager.skill != null
                    ? RowItem.textRow(
                        context,
                        'Skill',
                        _villager.skill,
                      )
                    : Separator.none(),
                Separator.spacer(),
                _villager.goal != null
                    ? RowItem.textRow(
                        context,
                        'Goal',
                        _villager.goal,
                      )
                    : Separator.none(),
                Separator.spacer(),
                _villager.fear != null
                    ? RowItem.textRow(
                        context,
                        'Fear',
                        _villager.fear,
                      )
                    : Separator.none(),
                Separator.spacer(),
                _villager.favClothing != null
                    ? RowItem.textRow(
                        context,
                        'Favorite Clothing',
                        _villager.favClothing,
                      )
                    : Separator.none(),
                Separator.spacer(),
                _villager.leastFavClothing != null
                    ? RowItem.textRow(
                        context,
                        'Least Favorite Clothing',
                        _villager.leastFavClothing,
                      )
                    : Separator.none(),
                Separator.spacer(),
                _villager.favColor != null
                    ? RowItem.textRowColored(
                        context,
                        'Favorite Colour',
                        _villager.favColor,
                        colors[_villager.favColor],
                      )
                    : Separator.none(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
