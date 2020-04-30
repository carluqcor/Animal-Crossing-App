class Flower {
  final String nameEs, nameEn, buyable;
  final List<String> data;
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
    print(json['nameEs']);
    print('000000');
    return Flower(
      nameEs: json['nameEs'],
      nameEn: json['nameEn'],
      buyable: json['buyable'],
      data: json['crossbreeding']['data'],
      x: json['crossbreeding']['layout']['x'],
      y: json['crossbreeding']['layout']['y'],
    );
  }
}