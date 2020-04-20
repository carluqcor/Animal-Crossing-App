import 'dart:ffi';

import 'package:ACApp/models/index.dart';
import 'package:ACApp/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:dio/dio.dart';

class Critters {
  final List<dynamic> critters;

  const Critters({
    this.critters
  });

  factory Critters.fromJson(Map<String, dynamic> json) {
    return Critters(
      critters: json['query']['categorymembers']
    );
  }
}

class Critter {
  final String name,
      image,
      scientificName,
      family,
      timeYear,
      timeDay,
      location,
      size,
      rarity,
      price,
      caughtQuote,
      link;
  //final DateTime updated;

  const Critter(
      {this.name,
      this.image,
      this.scientificName,
      this.family,
      this.timeYear,
      this.timeDay,
      this.location,
      this.size,
      this.rarity,
      this.price,
      this.caughtQuote,
      this.link,
      //this.updated
      });

  factory Critter.fromJson(Map<String, dynamic> json) {
    return Critter(
      name: json['name'],
      image: json['image'],
      scientificName: json['scientific-name'],
      family: json['family'],
      timeYear: json['time-year'],
      timeDay: json['time-day'],
      location: json['location'],
      size: json['size'],
      rarity: json['rarity'],
      price: json['price'],
      caughtQuote: json['caught'],
      link: json['link'],
      //updated: DateTime.parse(json['updated']).toLocal(),
    );
  }
}
