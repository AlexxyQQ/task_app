import 'package:task_app/core/common/exports.dart';
import '../../domain/entities/album_entity.dart';
class AlbumModel extends AlbumEntity{
AlbumModel({
    super.userId,
    super.id,
    super.title,
  });
  @override
  String toString() {
    return 'AlbumModel {"userId": $userId, "id": $id, "title": $title, }';
  }
  @override
  Map<String, dynamic> toMap() {
    return {
      'user_id': userId,
      'id': id,
      'title': title,
    };
  }
  factory AlbumModel.fromMap(Map<String, dynamic> map) {
    return AlbumModel(
      userId:map['user_id'] != null ? int.parse("${map['user_id']}") : null,
      id:map['id'] != null ? int.parse("${map['id']}") : null,
      title: map['title'],
    );
  }
}

