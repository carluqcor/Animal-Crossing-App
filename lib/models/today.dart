class Today {
  final String message;
  final List<dynamic> events, villagerImages;

  const Today({
    this.message,
    this.events,
    this.villagerImages,
  });

  factory Today.fromJson(Map<String, dynamic> json) {
    return Today(
      message: json['message'],
      events: json['events'],
      villagerImages: json['villager_images'],
    );
  }
}