class Standingdata {
  final String? imgurl;
  final String? team;
  final int? teamId;
  final int? gp;
  final int? w;
  final int? l;
  final int? t;
  final int? so;
  final int? pts;
  final int? gf;
  final int? ga;
  final int? pim; // variable
  final num? gfavg;
  final num? plusminus; // variable
  final num? rfavg; // variable
  final String? strk;

  ///
  ///
  ///
  Standingdata({
    this.imgurl,
    this.team,
    this.teamId,
    this.gp,
    this.w,
    this.l,
    this.t,
    this.so,
    this.pts,
    this.gf,
    this.ga,
    this.pim, // variable
    this.gfavg,
    this.plusminus, // variable
    this.rfavg, // variable
    this.strk,
  });

  ///
  ///
  ///
  factory Standingdata.fromJson(Map<String, dynamic> json) {
    return Standingdata(
      imgurl: json.containsKey('imgurl') ? json['imgurl'] : null,
      team: json.containsKey('team') ? json['team'] : null,
      teamId: json.containsKey('teamId') ? json['teamId'] : null,
      gp: json.containsKey('gp') ? json['gp'] : null,
      w: json.containsKey('w') ? json['w'] : null,
      l: json.containsKey('l') ? json['l'] : null,
      t: json.containsKey('t') ? json['t'] : null,
      so: json.containsKey('so') ? json['so'] : null,
      pts: json.containsKey('pts') ? json['pts'].toInt() : null,
      gf: json.containsKey('gf') ? json['gf'] : null,
      ga: json.containsKey('ga') ? json['ga'] : null,
      pim: json.containsKey('pim') ? json['pim'] : null, // variable
      gfavg: json.containsKey('gfavg') ? json['gfavg'] : null,
      plusminus:
          json.containsKey('plusminus') ? json['plusminus'] : null, // variable
      rfavg: json.containsKey('rfavg') ? json['rfavg'] : null, // variable
      strk: json.containsKey('strk') ? json['strk'] : null,
    );
  }
}
