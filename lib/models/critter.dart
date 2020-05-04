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
      name: json['name'] ?? 'Not filled',
      image: json['image'] ?? 'Not filled',
      scientificName: json['scientific-name'] ?? 'Not filled',
      family: json['family'] ?? 'Not filled',
      timeYear: json['time-year'] ?? 'Not filled',
      timeDay: json['time-day'] ?? 'Not filled',
      location: json['location'] ?? 'Not filled',
      size: json['size'] ?? 'Not filled',
      rarity: json['rarity'] ?? 'Not filled',
      price: json['price'] ?? 'Not filled',
      caughtQuote: json['caught'] ?? 'Not filled',
      link: json['link'] ?? 'Not filled',
      //updated: DateTime.parse(json['updated']).toLocal(),
    );
  }
}
