class League {
  final int? id;
  final String? name;
  final String? imageUrl;
  final String? androidAppURL;
  final String? iosAppURL;

  ///
  ///
  ///
  League(
      {this.id, this.name, this.imageUrl, this.androidAppURL, this.iosAppURL});

  ///
  ///
  ///
  factory League.fromJson(Map<String, dynamic> json) {
    return League(
      id: json['id'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      androidAppURL: json['androidAppURL'],
      iosAppURL: json['iosAppURL'],
    );
  }

  ///
  ///
  ///
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'imageUrl': imageUrl,
        'androidAppURL': androidAppURL,
        'iosAppURL': iosAppURL
      };
}
