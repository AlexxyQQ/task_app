import 'package:task_app/core/common/exports.dart';
import '../../domain/entities/geo_entity.dart';
class GeoModel extends GeoEntity{
GeoModel({
    super.lat,
    super.lng,
  });
  @override
  String toString() {
    return 'GeoModel {"lat": $lat, "lng": $lng, }';
  }
  @override
  Map<String, dynamic> toMap() {
    return {
      'lat': lat,
      'lng': lng,
    };
  }
  factory GeoModel.fromMap(Map<String, dynamic> map) {
    return GeoModel(
      lat: map['lat'],
      lng: map['lng'],
    );
  }
}

