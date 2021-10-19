import 'package:wlt3/models/Gamesdata.dart';
import 'package:wlt3/models/Team.dart';
import 'package:wlt3/models/News.dart';
import 'package:wlt3/models/Tweet.dart';

class Teamdata {
  Team? teaminfo;
  final Gamesdata? games;
  final List<News>? news;
  final List<Tweet>? tweets;

  ///
  ///
  ///
  Teamdata({this.teaminfo, this.games, this.news, this.tweets});

  ///
  ///
  ///
  factory Teamdata.fromJson(Map<String, dynamic> json) {
    return Teamdata(
      teaminfo: Team.fromJson(json['teaminfo']),
      games: Gamesdata.fromJson(json['games']),
      news: json['news'].map<News>((json) => (News.fromJson(json))).toList(),
      tweets:
          json['tweets'].map<Tweet>((json) => (Tweet.fromJson(json))).toList(),
    );
  }
}
