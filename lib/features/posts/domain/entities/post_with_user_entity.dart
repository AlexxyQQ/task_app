import 'package:task_app/core/common/exports.dart';


class PostWithUserEntity {
  final PostEntity? post;
  final UserEntity? user;
  PostWithUserEntity({
    this.post,
    this.user,
  });

  PostWithUserEntity copyWith({
    ValueGetter<PostEntity?>? post,
    ValueGetter<UserEntity?>? user,
  }) {
    return PostWithUserEntity(
      post: post != null ? post() : this.post,
      user: user != null ? user() : this.user,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'post': post?.toMap(),
      'user': user?.toMap(),
    };
  }

  factory PostWithUserEntity.fromMap(Map<String, dynamic> map) {
    return PostWithUserEntity(
      post: map['post'] != null ? PostEntity.fromMap(map['post']) : null,
      user: map['user'] != null ? UserEntity.fromMap(map['user']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostWithUserEntity.fromJson(String source) =>
      PostWithUserEntity.fromMap(json.decode(source));

  @override
  String toString() => 'PostWithUserEntity(post: $post, user: $user)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PostWithUserEntity &&
        other.post == post &&
        other.user == user;
  }

  @override
  int get hashCode => post.hashCode ^ user.hashCode;
}
