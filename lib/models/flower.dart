class Flower {
  final String name;
  final List<dynamic> data, buyable;
  final int x, y;

  const Flower({
    this.name,
    this.buyable,
    this.data,
    this.x,
    this.y,
  });

  factory Flower.fromJson(Map<String, dynamic> json) {
    return Flower(
      name: json['name'],
      buyable: json['buyable'].cast<String>(),
      data: json['crossbreeding']['data'].cast<String>(),
      x: json['crossbreeding']['layout']['x'],
      y: json['crossbreeding']['layout']['y'],
    );
  }
}