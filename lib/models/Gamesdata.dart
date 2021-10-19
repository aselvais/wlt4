import 'package:wlt3/models/Game.dart';

class Gamesdata {
  final List<Game>? today;
  final List<Game>? past;
  final List<Game>? upcoming;

  ///
  ///
  ///
  Gamesdata({this.today, this.past, this.upcoming});

  ///
  ///
  ///
  factory Gamesdata.fromJson(Map<String, dynamic> json) {
    return Gamesdata(
      today: json['today'].map<Game>((json) => (Game.fromJson(json))).toList(),
      past: json['past'].map<Game>((json) => (Game.fromJson(json))).toList(),
      upcoming:
          json['upcoming'].map<Game>((json) => (Game.fromJson(json))).toList(),
    );
  }
}
