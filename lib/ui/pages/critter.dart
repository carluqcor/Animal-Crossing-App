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
  var date = new DateTime.now();
  CritterPage(this._critter);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_critter.name), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          HeadCardPage(
            title: '',
            imageUrl: _critter.image,
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
                  _critter.timeYear != null ? _critter.timeYear : '',
                ),
                Separator.spacer(),
                RowItem.iconRowSet(
                  'Available',
                  getAvailableCritter(date, _critter.timeYear, _critter.timeDay) || _critter.timeYear == 'All year' ? Icon(FontAwesome.check_circle, color: Colors.greenAccent) : Icon(Entypo.circle_with_cross, color: Colors.redAccent),
                ),
                Separator.spacer(),
                RowItem.textRow(
                  context,
                  'Time Day',
                  _critter.timeDay != null ? _critter.timeDay : '',
                ),
                Separator.spacer(),
                RowItem.textRow(
                  context,
                  'Location',
                  _critter.location != null ? _critter.location : '',
                ),
                Separator.spacer(),
                RowItem.textRow(
                  context,
                  'Size',
                  _critter.size!= null ? _critter.size : '',
                ),
                Separator.spacer(),
                RowItem.textRowColored(
                  context,
                  'Rarity',
                  _critter.rarity != null ? _critter.rarity : '',
                  getRarityColor(_critter.rarity)
                ),
                Separator.spacer(),
                RowItem.textRow(
                  context,
                  'Price',
                  _critter.price != null ? _critter.price: '',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
