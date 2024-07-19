import 'package:task_app/core/common/exports.dart';


class CommentEntity {
  final int? postId;
  final int? id;
  final String? name;
  final String? email;
  final String? body;

  CommentEntity({
    this.postId,
    this.id,
    this.name,
    this.email,
    this.body,
  });

  CommentEntity copyWith({
    ValueGetter<int?>? postId,
    ValueGetter<int?>? id,
    ValueGetter<String?>? name,
    ValueGetter<String?>? email,
    ValueGetter<String?>? body,
  }) {
    return CommentEntity(
      postId: postId != null ? postId() : this.postId,
      id: id != null ? id() : this.id,
      name: name != null ? name() : this.name,
      email: email != null ? email() : this.email,
      body: body != null ? body() : this.body,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'post_id': postId,
      'id': id,
      'name': name,
      'email': email,
      'body': body,
    };
  }

  factory CommentEntity.fromMap(Map<String, dynamic> map) {
    return CommentEntity(
      postId: map['post_id']?.toInt(),
      id: map['id']?.toInt(),
      name: map['name'],
      email: map['email'],
      body: map['body'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CommentEntity.fromJson(String source) =>
      CommentEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CommentEntity(postId: $postId, id: $id, name: $name, email: $email, body: $body)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CommentEntity &&
        other.postId == postId &&
        other.id == id &&
        other.name == name &&
        other.email == email &&
        other.body == body;
  }

  @override
  int get hashCode {
    return postId.hashCode ^
        id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        body.hashCode;
  }
}
