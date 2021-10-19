class Tiers {
  final int? id;
  final String? name;

  ///
  ///
  ///
  Tiers({this.id, this.name});

  ///
  ///
  ///
  factory Tiers.fromJson(Map<String, dynamic> json) {
    return Tiers(
      id: json['id'],
      name: json['name'],
    );
  }
}
