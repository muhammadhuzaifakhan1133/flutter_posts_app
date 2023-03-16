class PostModel {
  int? userId;
  int? id;
  String? title;
  String? body;
  bool isOwn = false;

  PostModel({this.userId, this.id, this.title, this.body});

  PostModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }
}
