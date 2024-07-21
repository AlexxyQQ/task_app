import 'package:task_app/core/common/exports.dart';
import '../../domain/entities/photo_entity.dart';

class PhotoModel extends PhotoEntity {
  PhotoModel({
    super.albumId,
    super.id,
    super.title,
    super.url,
    super.thumbnailUrl,
  });
  @override
  String toString() {
    return 'PhotoModel {"albumId": $albumId, "id": $id, "title": $title, "url": $url, "thumbnailUrl": $thumbnailUrl, }';
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'albumId': albumId,
      'id': id,
      'title': title,
      'url': url,
      'thumbnail_url': thumbnailUrl,
    };
  }

  factory PhotoModel.fromMap(Map<String, dynamic> map) {
    return PhotoModel(
      albumId: map['albumId'] != null ? int.parse("${map['albumId']}") : null,
      id: map['id'] != null ? int.parse("${map['id']}") : null,
      title: map['title'],
      url: map['url'],
      thumbnailUrl: map['thumbnail_url'],
    );
  }
}
