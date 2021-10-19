class Season {
  final int? id;
  final String? name;
  final bool? playOff;
  final bool? visible;
  final bool? bracketsVisibleInSeason;

  ///
  ///
  ///
  Season(
      {this.id,
      this.name,
      this.playOff,
      this.visible,
      this.bracketsVisibleInSeason});

  ///
  ///
  ///
  factory Season.fromJson(Map<String, dynamic> json) {
    return Season(
      id: json['id'],
      name: json['name'],
      playOff: json['playOff'],
      visible: json['visible'],
      bracketsVisibleInSeason: json['bracketsVisibleInSeason'],
    );
  }

  ///
  ///
  ///
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'playOff': playOff,
        'visible': visible,
        'bracketsVisibleInSeason': bracketsVisibleInSeason
      };
}
