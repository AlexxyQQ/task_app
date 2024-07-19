import 'package:task_app/core/common/exports.dart';
class AddressModel extends AddressEntity{
AddressModel({
    super.street,
    super.suite,
    super.city,
    super.zipcode,
    super.geo,
  });
  @override
  String toString() {
    return 'AddressModel {"street": $street, "suite": $suite, "city": $city, "zipcode": $zipcode, "geo": $geo, }';
  }
  @override
  Map<String, dynamic> toMap() {
    return {
      'street': street,
      'suite': suite,
      'city': city,
      'zipcode': zipcode,
      'geo': geo?.toMap(),
    };
  }
  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      street: map['street'],
      suite: map['suite'],
      city: map['city'],
      zipcode: map['zipcode'],
      geo:map['geo'] !=null ? GeoModel.fromMap(map['geo']): null,
    );
  }
}

