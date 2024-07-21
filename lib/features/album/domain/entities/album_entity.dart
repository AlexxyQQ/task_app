import 'package:task_app/core/common/exports.dart';

class AlbumEntity {
  final int? userId;
  final int? id;
  final String? title;
  AlbumEntity({
    this.userId,
    this.id,
    this.title,
  });
  AlbumEntity copyWith({
    ValueGetter<int?>? userId,
    ValueGetter<int?>? id,
    ValueGetter<String?>? title,
  }) {
    return AlbumEntity(
      userId: userId != null ? userId() : this.userId,
      id: id != null ? id() : this.id,
      title: title != null ? title() : this.title,
    );
  }

  @override
  String toString() {
    return 'AlbumEntity {"userId": $userId, "id": $id, "title": $title, }';
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
    };
  }

  factory AlbumEntity.fromMap(Map<String, dynamic> map) {
    return AlbumEntity(
      userId: map['userId'] != null ? int.parse("${map['userId']}") : null,
      id: map['id'] != null ? int.parse("${map['id']}") : null,
      title: map['title'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AlbumEntity.fromJson(String source) =>
      AlbumEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant AlbumEntity other) {
    if (identical(this, other)) return true;
    return userId == other.userId && id == other.id && title == other.title;
  }

  @override
  int get hashCode {
    return userId.hashCode ^ id.hashCode ^ title.hashCode;
  }
}
