import 'package:task_app/core/common/exports.dart';

class CompanyEntity {
  final String? name;
  final String? catchPhrase;
  final String? bs;
  CompanyEntity({
    this.name,
    this.catchPhrase,
    this.bs,
  });
  CompanyEntity copyWith({
    ValueGetter<String?>? name,
    ValueGetter<String?>? catchPhrase,
    ValueGetter<String?>? bs,
  }) {
    return CompanyEntity(
      name: name != null ? name() : this.name,
      catchPhrase: catchPhrase != null ? catchPhrase() : this.catchPhrase,
      bs: bs != null ? bs() : this.bs,
    );
  }

  @override
  String toString() {
    return 'CompanyEntity {"name": $name, "catchPhrase": $catchPhrase, "bs": $bs, }';
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'catch_phrase': catchPhrase,
      'bs': bs,
    };
  }

  factory CompanyEntity.fromMap(Map<String, dynamic> map) {
    return CompanyEntity(
      name: map['name'],
      catchPhrase: map['catch_phrase'],
      bs: map['bs'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CompanyEntity.fromJson(String source) =>
      CompanyEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant CompanyEntity other) {
    if (identical(this, other)) return true;
    return name == other.name &&
        catchPhrase == other.catchPhrase &&
        bs == other.bs;
  }

  @override
  int get hashCode {
    return name.hashCode ^ catchPhrase.hashCode ^ bs.hashCode;
  }
}
