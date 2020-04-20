import 'dart:ffi';

import 'package:ACApp/models/index.dart';
import 'package:ACApp/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:dio/dio.dart';

class Villagers {
  final List<dynamic> villagers;

  const Villagers({
    this.villagers
  });

  factory Villagers.fromJson(Map<String, dynamic> json) {
    return Villagers(
      villagers: json['query']['categorymembers']
    );
  }

  String getName(villager) {
    return villager['name'];
  }
}

class Villager {
  final String name,
      image,
      quote,
      gender,
      personality,
      species,
      birthday,
      islanderFavorite,
      islanderAllergic,
      skill,
      goal,
      fear,
      favClothing,
      leastFavClothing,
      favColor,
      link;
  //final DateTime updated;

  const Villager(
      {this.name,
      this.image,
      this.quote,
      this.gender,
      this.personality,
      this.species,
      this.birthday,
      this.islanderFavorite,
      this.islanderAllergic,
      this.skill,
      this.goal,
      this.fear,
      this.favClothing,
      this.leastFavClothing,
      this.favColor,
      this.link,
      //this.updated
      });

  factory Villager.fromJson(Map<String, dynamic> json) {
    return Villager(
      name: json['name'],
      image: json['image'],
      quote: json['quote'],
      gender: json['gender'],
      personality: json['personality'],
      species: json['species'],
      birthday: json['birthday'],
      islanderFavorite: json['islander-favorite'],
      islanderAllergic: json['islander-allergic'],
      skill: json['skill'],
      goal: json['goal'],
      fear: json['fear'],
      favClothing: json['favclothing'],
      leastFavClothing: json['leastfavclothing'],
      favColor: json['favcolor'],
      link: json['link'],
      //updated: DateTime.parse(json['updated']).toLocal(),
    );
  }
}
