import 'package:task_app/core/common/exports.dart';



class PostEntity {
  final int? userId;
  final int? id;
  final String? title;
  final String? body;
  PostEntity({
    this.userId,
    this.id,
    this.title,
    this.body,
  });
  PostEntity copyWith({
    ValueGetter<int?>? userId,
    ValueGetter<int?>? id,
    ValueGetter<String?>? title,
    ValueGetter<String?>? body,
  }) {
    return PostEntity(
      userId: userId != null ? userId() : this.userId,
      id: id != null ? id() : this.id,
      title: title != null ? title() : this.title,
      body: body != null ? body() : this.body,
    );
  }

  @override
  String toString() {
    return 'PostsEntity(userId: $userId, id: $id, title: $title, body: $body,)';
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }

  factory PostEntity.fromMap(Map<String, dynamic> map) {
    return PostEntity(
      userId: map['userId']?.toInt(),
      id: map['id']?.toInt(),
      title: map['title'],
      body: map['body'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PostEntity.fromJson(String source) =>
      PostEntity.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PostEntity &&
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
