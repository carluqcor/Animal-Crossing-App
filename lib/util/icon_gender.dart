import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

Icon getIconGender(String gender) {
  if ('Male' == gender)
    return Icon(MaterialCommunityIcons.gender_male, color: Colors.blueAccent);
  else
    return Icon(MaterialCommunityIcons.gender_female, color: Colors.pinkAccent);
}
