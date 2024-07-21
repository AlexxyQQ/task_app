import 'package:task_app/core/common/exports.dart';

class PhotoEntity {
  final int? albumId;
  final int? id;
  final String? title;
  final String? url;
  final String? thumbnailUrl;
  PhotoEntity({
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  });
  PhotoEntity copyWith({
    ValueGetter<int?>? albumId,
    ValueGetter<int?>? id,
    ValueGetter<String?>? title,
    ValueGetter<String?>? url,
    ValueGetter<String?>? thumbnailUrl,
  }) {
    return PhotoEntity(
      albumId: albumId != null ? albumId() : this.albumId,
      id: id != null ? id() : this.id,
      title: title != null ? title() : this.title,
      url: url != null ? url() : this.url,
      thumbnailUrl: thumbnailUrl != null ? thumbnailUrl() : this.thumbnailUrl,
    );
  }

  @override
  String toString() {
    return 'PotoEntity {"albumId": $albumId, "id": $id, "title": $title, "url": $url, "thumbnailUrl": $thumbnailUrl, }';
  }

  Map<String, dynamic> toMap() {
    return {
      'albumId': albumId,
      'id': id,
      'title': title,
      'url': url,
      'thumbnail_url': thumbnailUrl,
    };
  }

  factory PhotoEntity.fromMap(Map<String, dynamic> map) {
    return PhotoEntity(
      albumId: map['albumId'] != null ? int.parse("${map['albumId']}") : null,
      id: map['id'] != null ? int.parse("${map['id']}") : null,
      title: map['title'],
      url: map['url'],
      thumbnailUrl: map['thumbnail_url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PhotoEntity.fromJson(String source) =>
      PhotoEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant PhotoEntity other) {
    if (identical(this, other)) return true;
    return albumId == other.albumId &&
        id == other.id &&
        title == other.title &&
        url == other.url &&
        thumbnailUrl == other.thumbnailUrl;
  }

  @override
  int get hashCode {
    return albumId.hashCode ^
        id.hashCode ^
        title.hashCode ^
        url.hashCode ^
        thumbnailUrl.hashCode;
  }
}
