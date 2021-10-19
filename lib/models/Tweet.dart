class Tweet {
  final String? date;
  final String? text;
  final String? profileImageUrl;
  final String? screenName;
  final String? url;

  ///
  ///
  ///
  Tweet(
      {this.date, this.text, this.profileImageUrl, this.screenName, this.url});

  ///
  ///
  ///
  factory Tweet.fromJson(Map<String, dynamic> json) {
    return Tweet(
      date: json['date'],
      text: json['text'],
      profileImageUrl: json['profileImageUrl'],
      screenName: json['screenName'],
      url: json['url'],
    );
  }
}
