import 'package:ACApp/ui/widgets/row_item.dart';
import 'package:ACApp/ui/widgets/separator.dart';
import 'package:flutter/material.dart';

Widget displayWidgets(List<dynamic> strings, context) {
    return new Column(children: strings.map<dynamic>((item) => (item is String) ? new RowItem.textRow(context, 'Hola', item) : item).toList());
  }
/*
  Column(
              children: <Widget>[
                _critter.timeYear != null
                    ? RowItem.textRow(
                        context,
                        'Time Year',
                        _critter.timeYear,
                      )
                    : Separator.none(),
                Separator.spacer(),
                _critter.timeYear != null
                    ? RowItem.iconRowSet(
                        'Available',
                        getAvailableCritter(date, _critter.timeYear,
                                    _critter.timeDay) ||
                                _critter.timeYear == 'All year'
                            ? Icon(FontAwesome.check_circle,
                                color: Colors.greenAccent)
                            : Icon(Entypo.circle_with_cross,
                                color: Colors.redAccent),
                      )
                    : Separator.none(),
                Separator.spacer(),
                _critter.timeDay != null
                    ? RowItem.textRow(
                        context,
                        'Time Day',
                        _critter.timeDay != null ? _critter.timeDay : '',
                      )
                    : Separator.none(),
                Separator.spacer(),
                _critter.location != null
                    ? RowItem.textRow(
                        context,
                        'Location',
                        _critter.location != null ? _critter.location : '',
                      )
                    : Separator.none(),
                Separator.spacer(),
                _critter.size != null
                    ? RowItem.textRow(
                        context,
                        'Size',
                        _critter.size != null ? _critter.size : '',
                      )
                    : Separator.none(),
                Separator.spacer(),
                _critter.rarity != null
                    ? RowItem.textRowColored(
                        context,
                        'Rarity',
                        _critter.rarity != null ? _critter.rarity : '',
                        getRarityColor(_critter.rarity))
                    : Separator.none(),
                Separator.spacer(),
                _critter.price != null
                    ? RowItem.textRow(
                        context,
                        'Price',
                        _critter.price != null ? _critter.price : '',
                      )
                    : Separator.none(),
              ],
            ),
            */