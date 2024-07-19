import 'package:task_app/core/common/exports.dart';

class CommentModel extends CommentEntity {
  CommentModel({
    super.postId,
    super.id,
    super.name,
    super.email,
    super.body,
  });

  @override
  CommentModel copyWith({
    ValueGetter<int?>? postId,
    ValueGetter<int?>? id,
    ValueGetter<String?>? name,
    ValueGetter<String?>? email,
    ValueGetter<String?>? body,
  }) {
    return CommentModel(
      postId: postId != null ? postId() : this.postId,
      id: id != null ? id() : this.id,
      name: name != null ? name() : this.name,
      email: email != null ? email() : this.email,
      body: body != null ? body() : this.body,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'post_id': postId,
      'id': id,
      'name': name,
      'email': email,
      'body': body,
    };
  }

  factory CommentModel.fromMap(Map<String, dynamic> map) {
    return CommentModel(
      postId: map['post_id']?.toInt(),
      id: map['id']?.toInt(),
      name: map['name'],
      email: map['email'],
      body: map['body'],
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory CommentModel.fromJson(String source) =>
      CommentModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CommentModel(postId: $postId, id: $id, name: $name, email: $email, body: $body)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CommentModel &&
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
