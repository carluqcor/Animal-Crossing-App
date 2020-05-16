import 'package:ACApp/util/get_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../../models/index.dart';
import '../../util/index.dart';
import '../widgets/index.dart';

/// COCKTAIL PAGE VIEW
/// It shows detailed information of cocktails like
/// instructions, ingredients and measure
class CritterPage extends StatelessWidget {
  final Critter _critter;
  final date = new DateTime.now();
  CritterPage(this._critter);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_critter.nameEn), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          HeadCardPage(
            title: '',
            imageUrl: _critter.link,
            body: Text(
              _critter.caughtQuote,
            ),
            separator: true,
          ),
          Separator.cardSpacer(),
          CardPage(
            title: 'DETAILS',
            body: Column(
              children: <Widget>[
                RowItem.textRow(
                  context,
                  'Time Year',
                  _critter.time,
                ),
                Separator.spacer(),
                RowItem.iconRowSet(
                  'Available',
                  Icon(Entypo.circle_with_cross, color: Colors.redAccent),
                ),
                Separator.spacer(),
                RowItem.textRow(context, 'Time Day', _critter.time),
                Separator.spacer(),
                RowItem.textRow(
                  context,
                  'Location',
                  _critter.location,
                ),
                Separator.spacer(),
                RowItem.textRowColored(context, 'Rarity', _critter.rarity,
                    getRarityColor(_critter.rarity)),
                Separator.spacer(),
                RowItem.textRow(
                  context,
                  'Price',
                  _critter.price.toString(),
                ),
                Separator.spacer(),
                RowItem.textRow(
                  context,
                  'Price Flick',
                  _critter.priceFlick.toString(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
