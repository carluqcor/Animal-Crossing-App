import 'package:flutter/cupertino.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_icons/flutter_icons.dart';

dynamic getFlowerIcon(dynamic item, String specie) {
  switch (item) {
    case 'plus':
      return Icon(MaterialCommunityIcons.plus);
    case 'equal':
      return Icon(MaterialCommunityIcons.equal);
    default:
      return Image(
          image: AssetImage('assets/flowers/Flw' + specie + item + '.png'));
  }
}

String getFlowerName(String name, BuildContext context) {
  switch (name) {
    case 'Pansy':
      return FlutterI18n.translate(
        context,
        'ac.flowers.subtype.pansy',
      );
    case 'Rose':
      return FlutterI18n.translate(
        context,
        'ac.flowers.subtype.rose',
      );
    case 'Yuri':
      return FlutterI18n.translate(
        context,
        'ac.flowers.subtype.lily',
      );
    case 'Mum':
      return FlutterI18n.translate(
        context,
        'ac.flowers.subtype.mum',
      );
    case 'Hyacinth':
      return FlutterI18n.translate(
        context,
        'ac.flowers.subtype.hyacinth',
      );
    case 'Anemones':
      return FlutterI18n.translate(
        context,
        'ac.flowers.subtype.windflower',
      );
    case 'Tulip':
      return FlutterI18n.translate(
        context,
        'ac.flowers.subtype.tulip',
      );
    case 'Cosmos':
      return FlutterI18n.translate(
        context,
        'ac.flowers.subtype.cosmo',
      );
  }
  return '';
}
