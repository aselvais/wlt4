class Team {
  final int? teamId;
  final String? teamName;
  final String? imageUrl;
  final int? score;
  final bool? news;
  final bool? tweets;
  final bool? home;
  final int? win;
  final int? lose;
  final int? draw;
  final int? shootoutLoss;
  final bool? enableSol;
  final String? streak;
  final String? positionElementInStandings;
  final int? divisionId;
  final String? divisionName;
  final int? tierId;
  final String? tierName;
  final int? groupId;
  final String? groupName;
  final bool? hasNews;
  final bool? hasTweets;
  final bool? playOff;

  ///
  ///
  ///
  Team({
    this.teamId,
    this.teamName,
    this.imageUrl,
    this.score,
    this.news,
    this.tweets,
    this.home,
    this.win,
    this.lose,
    this.draw,
    this.shootoutLoss,
    this.enableSol,
    this.streak,
    this.positionElementInStandings,
    this.divisionId,
    this.divisionName,
    this.tierId,
    this.tierName,
    this.groupId,
    this.groupName,
    this.hasNews,
    this.hasTweets,
    this.playOff,
  });

  ///
  ///
  ///
  factory Team.fromJson(Map<String, dynamic> json) {
    int? teamId;
    if (json.containsKey('teamId')) teamId = json['teamId'];
    if (json.containsKey('id')) teamId = json['id'];

    String? teamName;
    if (json.containsKey('teamName')) teamName = json['teamName'];
    if (json.containsKey('name')) teamName = json['name'];

    var _score = json.containsKey('score')
        ? ((json['score'] is String)
            ? int.tryParse(json['score']) ?? null
            : json['score'])
        : null;

    return Team(
      teamId: teamId,
      teamName: teamName,
      imageUrl: json.containsKey('imageUrl') ? json['imageUrl'] : null,
      score: _score, //json['score'],
      news: json.containsKey('news') ? json['news'] : null, //json['news'],
      tweets:
          json.containsKey('tweets') ? json['tweets'] : null, //json['tweets'],
      home: json.containsKey('home') ? json['home'] : null, //json['home'],
      win: json.containsKey('win') ? json['win'] : null, //json['win'],
      lose: json.containsKey('lose') ? json['lose'] : null, //json['lose'],
      draw: json.containsKey('draw') ? json['draw'] : null, //json['draw'],
      shootoutLoss: json.containsKey('shootoutLoss')
          ? json['shootoutLoss']
          : null, //json['shootoutLoss'],
      enableSol: json.containsKey('enableSol')
          ? json['enableSol']
          : null, //json['enableSol'],
      streak:
          json.containsKey('streak') ? json['streak'] : null, //json['streak'],
      positionElementInStandings: json.containsKey('positionElementInStandings')
          ? json['positionElementInStandings']
          : null, //json['positionElementInStandings'],
      divisionId: json.containsKey('divisionId') ? json['divisionId'] : null,
      divisionName:
          json.containsKey('divisionName') ? json['divisionName'] : null,
      tierId: json.containsKey('tierId') ? json['tierId'] : null,
      tierName: json.containsKey('tierName') ? json['tierName'] : null,
      groupId: json.containsKey('groupId') ? json['groupId'] : null,
      groupName: json.containsKey('groupName') ? json['groupName'] : null,
      hasNews: json.containsKey('hasNews') ? json['hasNews'] : null,
      hasTweets: json.containsKey('hasTweets') ? json['hasTweets'] : null,
      playOff: json.containsKey('playOff') ? json['playOff'] : null,
    );
  }

  ///
  ///
  ///
  Map<String, dynamic> toJson() => {
        'teamId': teamId,
        'teamName': teamName,
        'imageUrl': imageUrl,
        'score': score,
        'news': news,
        'tweets': tweets,
        'home': home,
        'win': win,
        'lose': lose,
        'draw': draw,
        'shootoutLoss': shootoutLoss,
        'enableSol': enableSol,
        'streak': streak,
        'positionElementInStandings': positionElementInStandings,
        'divisionId': divisionId,
        'divisionName': divisionName,
        'tierId': tierId,
        'tierName': tierName,
        'groupId': groupId,
        'groupName': groupName,
        'hasNews': hasNews,
        'hasTweets': hasTweets,
        'playOff': playOff,
      };
}
