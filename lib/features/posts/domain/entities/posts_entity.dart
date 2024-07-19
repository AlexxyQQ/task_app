import 'package:task_app/core/common/exports.dart';

class PostsEntity {
  final int? userId;
  final int? id;
  final String? title;
  final String? body;
  PostsEntity({
    this.userId,
    this.id,
    this.title,
    this.body,
  });
  PostsEntity copyWith({
    ValueGetter<int?>? userId,
    ValueGetter<int?>? id,
    ValueGetter<String?>? title,
    ValueGetter<String?>? body,
  }) {
    return PostsEntity(
      userId: userId != null ? userId() : this.userId,
      id: id != null ? id() : this.id,
      title: title != null ? title() : this.title,
      body: body != null ? body() : this.body,
    );
  }

  @override
  String toString() {
    return 'PostsEntity {"userId": $userId, "id": $id, "title": $title, "body": $body, }';
  }

  Map<String, dynamic> toMap() {
    return {
      'user_id': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }

  factory PostsEntity.fromMap(Map<String, dynamic> map) {
    return PostsEntity(
      userId: map['user_id'] != null ? int.parse("${map['user_id']}") : null,
      id: map['id'] != null ? int.parse("${map['id']}") : null,
      title: map['title'],
      body: map['body'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PostsEntity.fromJson(String source) =>
      PostsEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant PostsEntity other) {
    if (identical(this, other)) return true;
    return userId == other.userId &&
        id == other.id &&
        title == other.title &&
        body == other.body;
  }

  @override
  int get hashCode {
    return userId.hashCode ^ id.hashCode ^ title.hashCode ^ body.hashCode;
  }
}
