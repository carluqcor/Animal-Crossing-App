import 'package:ACApp/util/get_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../../models/index.dart';
import '../../util/index.dart';
import '../widgets/index.dart';

/// COCKTAIL PAGE VIEW
/// It shows detailed information of cocktails like
/// instructions, ingredients and measure
class FossilPage extends StatelessWidget {
  final Fossil _fossil;
  var date = new DateTime.now();
  FossilPage(this._fossil);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_fossil.name), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          HeadCardPage(
            title: '',
            imageUrl: _fossil.image,
            body: Separator.none(),
            separator: false,
          ),
          Separator.cardSpacer(),
          CardPage(
            title: 'DETAILS',
            body: Column(
              children: <Widget>[
                RowItem.textRow(
                  context,
                  'Period',
                  _fossil.period != null ? _fossil.period : '',
                ),
                Separator.spacer(),
                RowItem.textRow(
                  context,
                  'Lenght',
                  _fossil.length!= null ? _fossil.length : '',
                ),
                Separator.spacer(),
                RowItem.textRow(
                  context,
                  'Price',
                  _fossil.price != null ? _fossil.price: '',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
