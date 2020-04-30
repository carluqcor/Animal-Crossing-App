class Flower {
  final String nameEs, nameEn;
  final List<String> data, buyable;
  final int x, y;

  const Flower({
    this.nameEs,
    this.nameEn,
    this.buyable,
    this.data,
    this.x,
    this.y,
  });

  factory Flower.fromJson(Map<String, dynamic> json) {
    print(json);
    return Flower(
      nameEs: json['nameEs'],
      nameEn: json['nameEn'],
      buyable: json['buyable'].cast<String>(),
      data: json['crossbreeding']['data'].cast<String>(),
      x: json['crossbreeding']['layout']['x'],
      y: json['crossbreeding']['layout']['y'],
    );
  }
}