import 'package:task_app/core/common/exports.dart';

class PostModel extends PostEntity {
  PostModel({
    super.userId,
    super.id,
    super.title,
    super.body,
  });

  @override
  String toString() {
    return 'PostModel(userId: $userId, id: $id, title: $title, body: $body,)';
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      userId: map['userId']?.toInt(),
      id: map['id']?.toInt(),
      title: map['title'],
      body: map['body'],
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(String source) =>
      PostModel.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PostModel &&
        other.userId == userId &&
        other.id == id &&
        other.title == title &&
        other.body == body;
  }

  @override
  int get hashCode {
    return userId.hashCode ^ id.hashCode ^ title.hashCode ^ body.hashCode;
  }
}
