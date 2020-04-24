class Fossils {
  final List<dynamic> fossils;

  const Fossils({this.fossils});

  factory Fossils.fromJson(Map<String, dynamic> json) {
    return Fossils(fossils: json['query']['categorymembers']);
  }
}

class Fossil {
  final String name, image, period, length, price, link;

  const Fossil({
    this.name,
    this.image,
    this.period,
    this.price,
    this.length,
    this.link,
  });

  factory Fossil.fromJson(Map<String, dynamic> json) {
    return Fossil(
      name: json['name'],
      image: json['image'],
      period: json['period'],
      price: json['price'],
      length: json['lenght'],
      link: json['link'],
    );
  }
}
