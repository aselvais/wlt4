class News {
  final String? date;
  final String? title;
  final String? description;
  final String? url;

  ///
  ///
  ///
  News({
    this.date,
    this.title,
    this.description,
    this.url,
  });

  ///
  ///
  ///
  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      date: json['date'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
    );
  }
}
