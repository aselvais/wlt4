import 'package:wlt3/models/Standingdata.dart';

class Standing {
  final String? title;
  final int? metaLeagueid;
  final List<Standingdata>? data;

  ///
  ///
  ///
  Standing({this.title, this.metaLeagueid, this.data});

  ///
  ///
  ///
  factory Standing.fromJson(Map<String, dynamic> json) {
    return Standing(
      title: json['title'],
      metaLeagueid: json['meta_leagueid'],
      data: json['data']
          .map<Standingdata>((json) => (Standingdata.fromJson(json)))
          .toList(),
    );
  }
}
