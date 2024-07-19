import 'package:task_app/core/common/exports.dart';


    class AddressEntity {
  final String? street;
  final String? suite;
  final String? city;
  final String? zipcode;
  final GeoEntity? geo;
AddressEntity({
    this.street,
    this.suite,
    this.city,
    this.zipcode,
    this.geo,
  });
  AddressEntity copyWith({
    ValueGetter<String?>? street,
    ValueGetter<String?>? suite,
    ValueGetter<String?>? city,
    ValueGetter<String?>? zipcode,
    ValueGetter<GeoEntity?>? geo,
  }) {
    return AddressEntity(
      street: street != null ? street(): this.street,
      suite: suite != null ? suite(): this.suite,
      city: city != null ? city(): this.city,
      zipcode: zipcode != null ? zipcode(): this.zipcode,
      geo: geo != null ? geo(): this.geo,
    );
  }
  @override
  String toString() {
    return 'AddressEntity {"street": $street, "suite": $suite, "city": $city, "zipcode": $zipcode, "geo": $geo, }';
  }
  Map<String, dynamic> toMap() {
    return {
      'street': street,
      'suite': suite,
      'city': city,
      'zipcode': zipcode,
      'geo': geo?.toMap(),
    };
  }
  factory AddressEntity.fromMap(Map<String, dynamic> map) {
    return AddressEntity(
      street: map['street'],
      suite: map['suite'],
      city: map['city'],
      zipcode: map['zipcode'],
      geo:map['geo'] !=null ? GeoEntity.fromMap(map['geo']): null,
    );
  }
  

String toJson() => json.encode(toMap());

  factory AddressEntity.fromJson(String source) =>
    AddressEntity.fromMap(json.decode(source) as Map<String, dynamic>);


  @override
  bool operator ==(covariant AddressEntity other) {
    if (identical(this, other)) return true;
    return   street == other.street &&
   suite == other.suite &&
   city == other.city &&
   zipcode == other.zipcode &&
   geo == other.geo;
  }
  @override
  int get hashCode {
    return street.hashCode ^
suite.hashCode ^
city.hashCode ^
zipcode.hashCode ^
geo.hashCode;
  }
}

