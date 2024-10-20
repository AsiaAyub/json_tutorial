class Comment {
  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;

  Comment({required this.postId, required this.id, this.email, this.name, required this.body });

  Comment.fromJson(Map<String, dynamic> json){
    postId = json['postId'];
    id = json['id'];
    name = json['name'];
    email = json['email'];
    body = json['body'];
  }
}