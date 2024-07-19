import 'package:task_app/core/common/exports.dart';
import '../../domain/entities/posts_entity.dart';
class PostsModel extends PostsEntity{
PostsModel({
    super.userId,
    super.id,
    super.title,
    super.body,
  });
  @override
  String toString() {
    return 'PostsModel {"userId": $userId, "id": $id, "title": $title, "body": $body, }';
  }
  @override
  Map<String, dynamic> toMap() {
    return {
      'user_id': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }
  factory PostsModel.fromMap(Map<String, dynamic> map) {
    return PostsModel(
      userId:map['user_id'] != null ? int.parse("${map['user_id']}") : null,
      id:map['id'] != null ? int.parse("${map['id']}") : null,
      title: map['title'],
      body: map['body'],
    );
  }
}

