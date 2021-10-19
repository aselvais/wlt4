class Matchdates {
  final int? id;
  final String? dateTime;
  final DateTime? dateTimeReal;

  ///
  ///
  ///
  Matchdates({this.id, this.dateTime, this.dateTimeReal});

  ///
  ///
  ///
  factory Matchdates.fromJson(Map<String, dynamic> json) {
    return Matchdates(
      id: json['id'],
      dateTime: json['dateTime'],
      dateTimeReal: DateTime.parse(json['dateTime']),
    );
  }
}
