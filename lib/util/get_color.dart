import 'dart:ui';
import 'package:flutter/material.dart';

import 'index.dart';

Color getRarityColor(String rarity) {
  switch (rarity) {
    case 'Very Common':
      return very_common;

    case 'Common':
      return common;

    case 'Uncommon':
      return uncommon;

    case 'Rare':
      return rare;

    case 'Very Rare':
      return very_rare;

    default:
      return very_common;
  }
}

/**Color getColorVillager(String color){
  
  return Colors};
}*/