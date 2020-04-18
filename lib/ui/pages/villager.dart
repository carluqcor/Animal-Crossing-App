import 'package:ACApp/models/villager.dart';
import 'package:flutter/material.dart';

import '../../models/index.dart';
import '../widgets/index.dart';

/// COCKTAIL PAGE VIEW
/// It shows detailed information of cocktails like
/// instructions, ingredients and measure
class VillagerPage extends StatelessWidget {
  final Villager _villager;

  VillagerPage(this._villager);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_villager.name), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          HeadCardPage(
            title: _villager.name,
            imageUrl: _villager.image,
            subtitle: Text(
              _villager.quote,
              style: Theme.of(context).textTheme.subhead.copyWith(
                    color: Theme.of(context).textTheme.caption.color,
                  ),
            ),
            body: Text(
              _villager.quote,
            ),
          ),
          Separator.cardSpacer(),
          CardPage(
            title: 'DETAILS',
            body: Column(
              children: <Widget>[
                RowItem.textRow(
                  context,
                  'Gender',
                  _villager.gender,
                ),
                Separator.spacer(),
                RowItem.textRow(
                  context,
                  'Personality',
                  _villager.personality,
                ),
                Separator.spacer(),
                RowItem.textRow(
                  context,
                  'Species',
                  _villager.species,
                ),
                Separator.spacer(),
                RowItem.textRow(
                  context,
                  'Birthday',
                  _villager.birthday,
                ),
                Separator.spacer(),
                RowItem.textRow(
                  context,
                  'Islander Favorite',
                  _villager.islanderFavorite,
                ),
                Separator.spacer(),
                RowItem.textRow(
                  context,
                  'Islander Allergic',
                  _villager.islanderAllergic,
                ),
                Separator.spacer(),
                RowItem.textRow(
                  context,
                  'Skill',
                  _villager.skill,
                ),
                Separator.spacer(),
                RowItem.textRow(
                  context,
                  'Goal',
                  _villager.goal,
                ),
                Separator.spacer(),
                RowItem.textRow(
                  context,
                  'Fear',
                  _villager.fear,
                ),
                Separator.spacer(),
                RowItem.textRow(
                  context,
                  'Favorite Clothing',
                  _villager.favClothing,
                ),
                Separator.spacer(),
                RowItem.textRow(
                  context,
                  'Least Favorite Clothing',
                  _villager.leastFavClothing,
                ),
                Separator.spacer(),
                RowItem.textRow(
                  context,
                  'Favorite Colour',
                  _villager.favColor,
                ),
                Separator.spacer(),
                RowItem.dateRow(
                  context,
                  'Last Updated',
                  _villager.updated,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
