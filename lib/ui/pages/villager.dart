import 'package:ACApp/models/villager.dart';
import 'package:ACApp/repositories/index.dart';
import 'package:ACApp/util/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:provider/provider.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../models/index.dart';
import '../widgets/index.dart';

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
          GestureDetector(
            onTap: () async => await FlutterWebBrowser.openWebPage(
              url: _villager.link,
            ),
            child: HeadCardPage(
              title: '',
              imageUrl: _villager.image,
              body: Text(
                _villager.quote,
              ),
              separator: true,
            ),
          ),
          Separator.cardSpacer(),
          CardPage(
            title: FlutterI18n.translate(
              context,
              'ac.villagers.details.title',
            ),
            body: Column(
              children: <Widget>[
                _villager.gender != null
                    ? RowItem(
                        FlutterI18n.translate(
                          context,
                          'ac.villagers.details.selected',
                        ),
                        ToggleSwitch(
                            initialLabelIndex: Provider.of<VillagerRepository>(
                                    context,
                                    listen: false)
                                .isVillagerSaved(_villager.name),
                            minWidth: MediaQuery.of(context).size.width / 8,
                            cornerRadius: 5,
                            activeBgColor: Colors.grey,
                            activeTextColor: Colors.white,
                            inactiveBgColor: Colors.grey,
                            inactiveTextColor: Colors.white,
                            labels: [
                              FlutterI18n.translate(
                                context,
                                'ac.villagers.selected',
                              ),
                              FlutterI18n.translate(
                                context,
                                'ac.villagers.non_selected',
                              )
                            ],
                            activeColors: [Colors.redAccent, Colors.green],
                            icons: [FontAwesome.times, FontAwesome.check],
                            onToggle: (index) async {
                              if (index == 1) {
                                if (!(await Provider.of<VillagerRepository>(
                                        context,
                                        listen: false)
                                    .addVillagerUser(_villager.name))) {
                                  _scaffoldKey.currentState
                                    ..hideCurrentSnackBar()
                                    ..showSnackBar(SnackBar(
                                      content: Text(
                                        FlutterI18n.translate(
                                          context,
                                          'settings.notifications.villager_error',
                                        ),
                                      ),
                                    ));
                                } else {
                                  _scaffoldKey.currentState
                                    ..hideCurrentSnackBar()
                                    ..showSnackBar(SnackBar(
                                      content: Text(
                                        FlutterI18n.translate(
                                          context,
                                          'settings.notifications.villager_selected',
                                        ),
                                      ),
                                    ));
                                }
                              } else {
                                Provider.of<VillagerRepository>(context,
                                        listen: false)
                                    .removeVillagerUser(_villager.name);
                                _scaffoldKey.currentState
                                  ..hideCurrentSnackBar()
                                  ..showSnackBar(SnackBar(
                                    content: Text(
                                      FlutterI18n.translate(
                                        context,
                                        'settings.notifications.villager_unselected',
                                      ),
                                    ),
                                  ));
                              }
                            }),
                      )
                    : Separator.none(),
                Separator.divider(),
                _villager.gender != null
                    ? RowItem.iconRowSet(
                        FlutterI18n.translate(
                          context,
                          'ac.villagers.details.gender',
                        ),
                        getIconGender(
                            _villager.gender != null ? _villager.gender : ''),
                      )
                    : Separator.none(),
                Separator.spacer(),
                _villager.personality != null
                    ? RowItem.textRow(
                        context,
                        FlutterI18n.translate(
                          context,
                          'ac.villagers.details.personality',
                        ),
                        _villager.personality,
                      )
                    : Separator.none(),
                Separator.spacer(),
                _villager.species != null
                    ? RowItem.textRow(
                        context,
                        FlutterI18n.translate(
                          context,
                          'ac.villagers.details.species',
                        ),
                        _villager.species,
                      )
                    : Separator.none(),
                Separator.spacer(),
                _villager.sign != null
                    ? RowItem.textRow(
                        context,
                        FlutterI18n.translate(
                          context,
                          'ac.villagers.details.sign',
                        ),
                        _villager.sign,
                      )
                    : Separator.none(),
                Separator.spacer(),
                _villager.birthday != null
                    ? RowItem.textRow(
                        context,
                        FlutterI18n.translate(
                          context,
                          'ac.villagers.details.birthday',
                        ),
                        _villager.birthday,
                      )
                    : Separator.none(),
                isDataFilled(_villager.islanderFavorite)
                    ? Separator.spacer()
                    : Separator.none(),
                isDataFilled(_villager.islanderFavorite)
                    ? RowItem.textRow(
                        context,
                        FlutterI18n.translate(
                          context,
                          'ac.villagers.details.fav_islander',
                        ),
                        _villager.islanderFavorite,
                      )
                    : Separator.none(),
                Separator.spacer(),
                isDataFilled(_villager.islanderAllergic)
                    ? RowItem.textRow(
                        context,
                        FlutterI18n.translate(
                          context,
                          'ac.villagers.details.allergic_islander',
                        ),
                        _villager.islanderAllergic,
                      )
                    : Separator.none(),
                isDataFilled(_villager.islanderAllergic)
                    ? Separator.spacer()
                    : Separator.none(),
                _villager.skill != null
                    ? RowItem.textRow(
                        context,
                        FlutterI18n.translate(
                          context,
                          'ac.villagers.details.skill',
                        ),
                        _villager.skill,
                      )
                    : Separator.none(),
                Separator.spacer(),
                _villager.goal != null
                    ? RowItem.textRow(
                        context,
                        FlutterI18n.translate(
                          context,
                          'ac.villagers.details.goal',
                        ),
                        _villager.goal,
                      )
                    : Separator.none(),
                Separator.spacer(),
                _villager.fear != null
                    ? RowItem.textRow(
                        context,
                        FlutterI18n.translate(
                          context,
                          'ac.villagers.details.fear',
                        ),
                        _villager.fear,
                      )
                    : Separator.none(),
                Separator.spacer(),
                _villager.favClothing != null
                    ? RowItem.textRow(
                        context,
                        FlutterI18n.translate(
                          context,
                          'ac.villagers.details.favorite_cloth',
                        ),
                        _villager.favClothing,
                      )
                    : Separator.none(),
                Separator.spacer(),
                _villager.leastFavClothing != null
                    ? RowItem.textRow(
                        context,
                        FlutterI18n.translate(
                          context,
                          'ac.villagers.details.least_cloth',
                        ),
                        _villager.leastFavClothing,
                      )
                    : Separator.none(),
                Separator.spacer(),
                _villager.favColor != null
                    ? RowItem.textRow(
                        context,
                        FlutterI18n.translate(
                          context,
                          'ac.villagers.details.favorite_color',
                        ),
                        _villager.favColor,
                      )
                    : Separator.none(),
                Separator.spacer(),
                _villager.coffeeType != null
                    ? RowItem.textRow(
                        context,
                        FlutterI18n.translate(
                          context,
                          'ac.villagers.details.coffee',
                        ),
                        _villager.coffeeType,
                      )
                    : Separator.none(),
                Separator.spacer(),
                _villager.coffeeMilk != null
                    ? RowItem.textRow(
                        context,
                        FlutterI18n.translate(
                          context,
                          'ac.villagers.details.coffee_milk',
                        ),
                        _villager.coffeeMilk,
                      )
                    : Separator.none(),
                Separator.spacer(),
                _villager.coffeeSugar != null
                    ? RowItem.textRow(
                        context,
                        FlutterI18n.translate(
                          context,
                          'ac.villagers.details.coffee_sugar',
                        ),
                        _villager.coffeeSugar,
                      )
                    : Separator.none(),
                Separator.spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
