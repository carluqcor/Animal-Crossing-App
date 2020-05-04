class Villagers {
  final List<dynamic> villagers;

  const Villagers({this.villagers});

  factory Villagers.fromJson(Map<String, dynamic> json) {
    return Villagers(villagers: json['query']['categorymembers']);
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
  final List<String> fallos;

  const Villager({
    this.name,
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
    this.fallos,
  });

  factory Villager.fromJson(Map<String, dynamic> json) {
    return Villager(
      name: json['name'] ?? 'Not filled' ,
      image: json['image'] ?? 'Not filled' ,
      quote: json['quote'] ?? 'Not filled' ,
      gender: json['gender'] ?? 'Not filled' ,
      personality: json['personality'] ?? 'Not filled' ,
      species: json['species'] ?? 'Not filled' ,
      birthday: json['birthday'] ?? 'Not filled' ,
      islanderFavorite: json['islander-favorite'] ?? 'Not filled' ,
      islanderAllergic: json['islander-allergic'] ?? 'Not filled' ,
      skill: json['skill'] ?? 'Not filled' ,
      goal: json['goal'] ?? 'Not filled' ,
      fear: json['fear'] ?? 'Not filled' ,
      favClothing: json['favclothing'] ?? 'Not filled' ,
      leastFavClothing: json['leastfavclothing'] ?? 'Not filled' ,
      favColor: json['favcolor'] ?? 'Not filled' ,
      link: json['link'] ?? 'Not filled' ,
    );
  }
}
