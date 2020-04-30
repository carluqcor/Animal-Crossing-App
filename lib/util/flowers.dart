import 'package:flutter/material.dart';

List<Image> getCrossBreeding(String flowerName, List<String> crossBreeding){
  List<Image> flowersImages = [];
  flowersImages = [
        for (final colorFlower in crossBreeding) Image(image: AssetImage('flowers/Flw'+flowerName+colorFlower+'.png'))
      ];

  return flowersImages;
}