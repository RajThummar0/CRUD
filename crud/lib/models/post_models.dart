class PostModel {
  final int id;
  final String title;
  final String name;
  final String body;

  PostModel({
    required this.title,
    required this.id,
    required this.name,
    required this.body,
});

  factory PostModel.fromjson(Map<String, dynamic> json){
    return PostModel(
      title: json['title'],
    id: json['id'],
    name: json['title'],
    body: json['body'],
    );
  }
}