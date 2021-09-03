class NewsApiModel {
  //
  //
  String title, descripton, imageUrl, content;

  NewsApiModel({
    required this.title,
    required this.descripton,
    required this.imageUrl,
    required this.content,
  });

  factory NewsApiModel.fromJson(Map<String, dynamic> map) {
    return NewsApiModel(
        title: map['title'] ?? "",
        descripton: map['description'] ?? "",
        imageUrl: map['urlToImage'] ?? "",
        content: map['content'] ?? "");
  }
}
