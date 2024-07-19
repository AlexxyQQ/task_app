import 'package:task_app/core/common/exports.dart';

    
    class GeoEntity {
  final String? lat;
  final String? lng;
GeoEntity({
    this.lat,
    this.lng,
  });
  GeoEntity copyWith({
    ValueGetter<String?>? lat,
    ValueGetter<String?>? lng,
  }) {
    return GeoEntity(
      lat: lat != null ? lat(): this.lat,
      lng: lng != null ? lng(): this.lng,
    );
  }
  @override
  String toString() {
    return 'GeoEntity {"lat": $lat, "lng": $lng, }';
  }
  Map<String, dynamic> toMap() {
    return {
      'lat': lat,
      'lng': lng,
    };
  }
  factory GeoEntity.fromMap(Map<String, dynamic> map) {
    return GeoEntity(
      lat: map['lat'],
      lng: map['lng'],
    );
  }
  

String toJson() => json.encode(toMap());

  factory GeoEntity.fromJson(String source) =>
    GeoEntity.fromMap(json.decode(source) as Map<String, dynamic>);


  @override
  bool operator ==(covariant GeoEntity other) {
    if (identical(this, other)) return true;
    return   lat == other.lat &&
   lng == other.lng;
  }
  @override
  int get hashCode {
    return lat.hashCode ^
lng.hashCode;
  }
}

