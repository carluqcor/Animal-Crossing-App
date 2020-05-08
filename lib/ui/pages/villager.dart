import 'package:ACApp/models/villager.dart';
import 'package:ACApp/repositories/index.dart';
import 'package:ACApp/util/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../models/index.dart';
import '../widgets/index.dart';

/// COCKTAIL PAGE VIEW
/// It shows detailed information of cocktails like
/// instructions, ingredients and measure
class VillagerPage extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final Villager _villager;

  VillagerPage(this._villager);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
                            initialLabelIndex: Provider.of<VillagerRepository>(
                                    context,
                                    listen: false)
                                .isVillagerSaved(_villager.name),
                            minWidth: 45.0,
                            cornerRadius: 5,
                            activeBgColor: Colors.green,
                            activeTextColor: Colors.white,
                            inactiveBgColor: Colors.grey,
                            inactiveTextColor: Colors.white,
                            labels: ['NO', 'YES'],
                            icons: [FontAwesome.check, FontAwesome.times],
                            onToggle: (index) async {
                              if (index == 1) {
                                if(!(await Provider.of<VillagerRepository>(context,listen: false).addVillagerUser(_villager.name))) {
                                  _scaffoldKey.currentState..hideCurrentSnackBar()..showSnackBar(SnackBar(content: Text('Error'),));
                                }else{
                                  _scaffoldKey.currentState..hideCurrentSnackBar()..showSnackBar(SnackBar(content: Text('Mu bien chiquito'),));
                                }
                              } else {
                                Provider.of<VillagerRepository>(context,
                                        listen: false)
                                    .removeVillagerUser(_villager.name);
                                _scaffoldKey.currentState..hideCurrentSnackBar()..showSnackBar(SnackBar(content: Text('Borrado correctamente'),));
                              }
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
