import 'package:flutter/material.dart';

import '../../models/index.dart';
import '../widgets/index.dart';

/// COCKTAIL PAGE VIEW
/// It shows detailed information of cocktails like
/// instructions, ingredients and measure
class CritterPage extends StatelessWidget {
  final Critter _critter;

  CritterPage(this._critter);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_critter.name), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          HeadCardPage(
            title: _critter.name,
            imageUrl: _critter.image,
            subtitle: Text(
              _critter.caughtQuote != null ? _critter.caughtQuote : '',
              style: Theme.of(context).textTheme.subhead.copyWith(
                    color: Theme.of(context).textTheme.caption.color,
                  ),
            ),
            body: Text(
              _critter.caughtQuote != null ? _critter.caughtQuote : '',
            ),
          ),
          Separator.cardSpacer(),
          CardPage(
            title: 'DETAILS',
            body: Column(
              children: <Widget>[
                RowItem.textRow(
                  context,
                  'Scientific Name',
                  _critter.scientificName != null ? _critter.scientificName : '',
                ),
                Separator.spacer(),
                RowItem.textRow(
                  context,
                  'Family',
                  _critter.family != null ? _critter.family : '',
                ),
                Separator.spacer(),
                RowItem.textRow(
                  context,
                  'Time Year',
                  _critter.timeYear != null ? _critter.timeYear : '',
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
                RowItem.textRow(
                  context,
                  'Rarity',
                  _critter.rarity != null ? _critter.rarity : '',
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