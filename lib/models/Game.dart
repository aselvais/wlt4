import 'package:wlt3/models/Arena.dart';
import 'package:wlt3/models/Gameinfo.dart';

class Game {
  final int? id;
  final String? type;
  final Arena? arena;
  final String? time;
  final Gameinfo? info;
  final int? divisionId;
  final String? divisionName;
  final String? dateTime;
  final DateTime? dateTimeReal;
  final String? leagueName;
  final String? leagueTimezone;
  final String? leagueShortName;
  final String? status;
  final String? seasonName;
  final bool? seasonPlayOff;
  final String? shareUrl;
  final String? linkStreamVideo;

  Game(
      {this.id,
      this.type,
      this.arena,
      this.time,
      this.info,
      this.divisionId,
      this.divisionName,
      this.dateTime,
      this.dateTimeReal,
      this.leagueName,
      this.leagueTimezone,
      this.leagueShortName,
      this.status,
      this.seasonName,
      this.seasonPlayOff,
      this.shareUrl,
      this.linkStreamVideo});

  ///
  ///
  ///
  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      id: json['id'],
      type: json['type'],
      arena: Arena.fromJson(json['arena']),
      time: json['time'],
      info: json.containsKey('info') ? Gameinfo.fromJson(json['info']) : null,
      divisionId: json['divisionId'],
      divisionName: json['divisionName'],
      dateTime: json['dateTime'],
      dateTimeReal: DateTime.parse(json['dateTime']),
      leagueName: json['leagueName'],
      leagueTimezone: json['leagueTimezone'],
      leagueShortName: json['leagueShortName'],
      status: json['status'],
      seasonName: json['seasonName'],
      seasonPlayOff: json['seasonPlayOff'],
      shareUrl: json['shareUrl'],
      linkStreamVideo: json['linkStreamVideo'],
    );
  }

  ///
  ///
  ///
  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
        'arena': arena?.toJson(),
        'time': time,
        'info': info?.toJson(),
        'divisionId': divisionId,
        'divisionName': divisionName,
        'dateTime': dateTime,
        'leagueName': leagueName,
        'leagueTimezone': leagueTimezone,
        'leagueShortName': leagueShortName,
        'status': status,
        'seasonName': seasonName,
        'seasonPlayOff': seasonPlayOff,
        'shareUrl': shareUrl,
        'linkStreamVideo': linkStreamVideo,
      };
}
