import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:wlt3/libs/ApiaccessAbstract.dart';
import 'package:wlt3/models/Division.dart';
import 'package:wlt3/models/Game.dart';
import 'package:wlt3/models/League.dart';
import 'package:wlt3/models/Matchdates.dart';
import 'package:wlt3/models/Season.dart';
import 'package:wlt3/models/Standing.dart';
import 'package:wlt3/models/Team.dart';
import 'package:wlt3/models/Teamdata.dart';
import 'package:wlt3/models/Tiers.dart';

class ApiaccessWlt extends ApiaccessAbstract {
  String baseurl = 'https://us-central1-wlt3-66c9a.cloudfunctions.net/';
  //String baseurl = 'http://10.0.2.2:5001/wlt3-66c9a/us-central1/';

  ///
  ///
  ///
  log(String msg)
  {
    // print('===----------- ${msg} ------------===');
  }

  ///
  ///
  ///
  Future<List<League>> getLeagues() async {
    String fullurl = baseurl + 'league';
    this.log(fullurl);
    final response = await http.get(fullurl);
    if (response.statusCode == 200) {
      List<dynamic> djson = json.decode(response.body);
      return djson.map<League>((json) => (League.fromJson(json))).toList();
    } else {
      throw Exception('Failed to load response.body');
    }
  }

  ///
  ///
  ///
  Future<List<Season>> getSeasons(int leagueId) async {
    String fullurl = baseurl + 'season?leagueId=' + leagueId.toString();
    this.log(fullurl);
    final response = await http.get(fullurl);
    if (response.statusCode == 200) {
      List<dynamic> djson = json.decode(response.body);
      return djson.map<Season>((json) => (Season.fromJson(json))).toList();
    } else {
      throw Exception('Failed to load response.body');
    }
  }

  ///
  ///
  ///
  Future<List<Division>> getDivisions(int seasonId) async {
    String fullurl = baseurl + 'division?seasonId=' + seasonId.toString();
    this.log(fullurl);
    final response = await http.get(fullurl);
    if (response.statusCode == 200) {
      List<dynamic> djson = json.decode(response.body);
      return djson.map<Division>((json) => (Division.fromJson(json))).toList();
    } else {
      throw Exception('Failed to load response.body');
    }
  }

  ///
  ///
  ///
  Future<List<Game>> getGames(String date, int seasonId, int divisionId) async {
    String fullurl = baseurl +
        'gametoday/?date=' +
        date +
        '&seasonId=' +
        seasonId.toString() +
        '&divisionId=' +
        divisionId.toString();
    this.log(fullurl);
    final response = await http.get(fullurl);
    if (response.statusCode == 200) {
      List<dynamic> djson = json.decode(response.body);
      return djson.map<Game>((json) => (Game.fromJson(json))).toList();
    } else {
      throw Exception('Failed to load response.body');
    }
  }

  ///
  /// Get one game by Id
  ///
  Future<Game> getGame(int gameId) async {
    String fullurl = baseurl + 'game/?gameId=' + gameId.toString();
    this.log(fullurl);
    final response = await http.get(fullurl);
    if (response.statusCode == 200) {
      dynamic djson = json.decode(response.body);
      return Game.fromJson(djson);
    } else {
      throw Exception('Failed to load response.body');
    }
  }

  ///
  ///
  ///
  Future<List<Tiers>> getTiers(int divisionId) async {
    String fullurl = baseurl + 'tier/?divisionId=' + divisionId.toString();
    this.log(fullurl);
    final response = await http.get(fullurl);
    if (response.statusCode == 200) {
      List<dynamic> djson = json.decode(response.body);
      return djson.map<Tiers>((json) => (Tiers.fromJson(json))).toList();
    } else {
      throw Exception('Failed to load response.body');
    }
  }

  ///
  ///
  ///
  Future<List<Standing>> getTeamstandingLocalTierGroupGeneric(
      int divisionId, int tierId) async {
    String fullurl = baseurl +
        'teamstandingLocalTierGroupGeneric/?divisionId=' +
        divisionId.toString() +
        '&tierId=' +
        tierId.toString();
    this.log(fullurl);
    final response = await http.get(fullurl);
    if (response.statusCode == 200) {
      List<dynamic> djson = json.decode(response.body);
      return djson.map<Standing>((json) => (Standing.fromJson(json))).toList();
    } else {
      throw Exception('Failed to load response.body');
    }
  }


  ///
  ///
  ///
  Future<List<Standing>> getTeamstandingLocalTierGroupGenericNormalized(int divisionId, int tierId) async 
  {
    String fullurl = baseurl + 'teamstandingLocalTierGroupGenericNormalized/?divisionId=' + divisionId.toString();
    if (tierId > 0) fullurl += '&tierId=' + tierId.toString();
    this.log(fullurl);
    final response = await http.get(fullurl);
    if (response.statusCode == 200 && response?.body != '') {
      List<dynamic> djson = json.decode(response.body);
      return djson.map<Standing>((json) => (Standing.fromJson(json))).toList();
    } else {
      throw Exception('Failed to load response.body');
    }
  }

  ///
  ///
  ///
  Future<List<Standing>> getTeamstandingLocalTierGroupGenericHeader(int divisionId, int tierId) async {
    String fullurl = baseurl +
        'teamstandingLocalTierGroupGenericHeader/?divisionId=' +
        divisionId.toString() +
        '&tierId=' +
        tierId.toString();
    this.log(fullurl);
    final response = await http.get(fullurl);
    if (response.statusCode == 200) {
      List<dynamic> djson = json.decode(response.body);
      return djson.map<Standing>((json) => (Standing.fromJson(json))).toList();
    } else {
      throw Exception('Failed to load response.body');
    }
  }


  ///
  /// Fetches the list of dates where we can find games
  ///
  Future<List<Matchdates>> getGameall(int seasonId, int divisionId) async {
    String fullurl = baseurl +
        'gameall/?' +
        "seasonId=" +
        seasonId.toString() +
        "&divisionId=" +
        divisionId.toString();
    this.log(fullurl);
    final response = await http.get(fullurl);
    if (response.statusCode == 200) {
      List<dynamic> djson = json.decode(response.body);
      return djson.map<Matchdates>((json) => (Matchdates.fromJson(json))).toList();
    } else {
      throw Exception('Failed to load response.body');
    }
  }

  ///
  ///
  ///
  Future<List<Game>> getGametoday(
      String date, int seasonId, int divisionId) async {
    return this.getGames(date, seasonId, divisionId);
  }

  ///
  ///
  ///
  Future<Team> getTeamInfo(int teamId) async {
    String fullurl = baseurl + "teamInfo/?teamId=" + teamId.toString();
    this.log(fullurl);
    final response = await http.get(fullurl);
    if (response.statusCode == 200) {
      return Team.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load response.body');
    }
  }

  ///
  ///
  ///
  Future<Teamdata> getTeamInfoFull(int teamId) async {
    String fullurl = baseurl + "teamInfoFull/?teamId=" + teamId.toString();
    this.log(fullurl);
    final response = await http.get(fullurl);
    if (response.statusCode == 200) {
      return Teamdata.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load response.body');
    }
  }

}
