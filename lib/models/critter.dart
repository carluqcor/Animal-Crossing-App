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
      });

  factory Critter.fromJson(Map<String, dynamic> json) {
    return Critter(
      name: json['name'] == null ? 'Not filled' : json['name'],
      image: json['image'] == null ? 'Not filled' : json['image'],
      scientificName: json['scientific-name'] == null ? 'Not filled' : json['scientific-name'],
      family: json['family'] == null ? 'Not filled' : json['family'],
      timeYear: json['time-year'] == null ? 'Not filled' : json['time-year'],
      timeDay: json['time-day'] == null ? 'Not filled' : json['time-day'],
      location: json['location'] == null ? 'Not filled' : json['location'],
      size: json['size'] == null ? 'Not filled' : json['size'],
      rarity: json['rarity'] == null ? 'Not filled' : json['rarity'],
      price: json['price'] == null ? 'Not filled' : json['price'],
      caughtQuote: json['caught'] == null ? 'Not filled' : json['caught'],
      link: json['link'] == null ? 'Not filled' : json['link'],
    );
  }
}
