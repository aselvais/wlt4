class Arena {
  final String? name;
  final num? longitude;
  final num? latitude;
  final String? address;

  Arena({this.name, this.longitude, this.latitude, this.address});

  ///
  ///
  ///
  factory Arena.fromJson(Map<String, dynamic> json) {
    return Arena(
      name: json['name'],
      longitude: json['longitude'],
      latitude: json['latitude'],
      address: json['address'],
    );
  }

  ///
  ///
  ///
  Map<String, dynamic> toJson() => {
        'name': name,
        'longitude': longitude,
        'latitude': latitude,
        'address': address,
      };
}
