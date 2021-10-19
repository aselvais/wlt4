import 'package:wlt3/models/Team.dart';

class Gameinfo {
  final Team? team1;
  final Team? team2;

  ///
  ///
  ///
  Gameinfo({this.team1, this.team2});

  ///
  ///
  ///
  factory Gameinfo.fromJson(Map<String, dynamic> json) {
    return Gameinfo(
        team1: Team.fromJson(json['team1']),
        team2: Team.fromJson(json['team2']));
  }

  ///
  ///
  ///
  Map<String, dynamic> toJson() =>
      {'team1': team1?.toJson(), 'team2': team2?.toJson()};
}
