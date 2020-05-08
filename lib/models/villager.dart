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
      name: json['name'] == null ? 'Not filled' : json['name'],
      image: json['image'] == null ? 'Not filled' : json['image'] ,
      quote: json['quote'] == null ? 'Not filled' : json['quote'] ,
      gender: json['gender'] == null ? 'Not filled' : json['gender'] ,
      personality: json['personality'] == null ? 'Not filled' : json['personality'] ,
      species: json['species'] == null ? 'Not filled' : json['species'] ,
      birthday: json['birthday'] == null ? 'Not filled' : json['birthday'] ,
      islanderFavorite: json['islander-favorite'] == null ? 'Not filled' : json['islander-favorite'] ,
      islanderAllergic: json['islander-allergic'] == null ? 'Not filled' : json['islander-allergic'] ,
      skill: json['skill'] == null ? 'Not filled' : json['skill'] ,
      goal: json['goal'] == null ? 'Not filled' : json['goal'] ,
      fear: json['fear'] == null ? 'Not filled' : json['fear'] ,
      favClothing: json['favclothing'] == null ? 'Not filled' : json['favclothing'] ,
      leastFavClothing: json['leastfavclothing'] == null ? 'Not filled' : json['leastfavclothing'] ,
      favColor: json['favcolor'] == null ? 'Not filled' : json['favcolor'] ,
      link: json['link'] == null ? 'Not filled' : json['link'] ,
    );
  }
}
