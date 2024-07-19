import 'package:task_app/core/common/exports.dart';

class UserEntity {
  final int? id;
  final String? name;
  final String? username;
  final String? email;
  final AddressEntity? address;
  final String? phone;
  final String? website;
  final CompanyEntity? company;
  UserEntity({
    this.id,
    this.name,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
  });
  UserEntity copyWith({
    ValueGetter<int?>? id,
    ValueGetter<String?>? name,
    ValueGetter<String?>? username,
    ValueGetter<String?>? email,
    ValueGetter<AddressEntity?>? address,
    ValueGetter<String?>? phone,
    ValueGetter<String?>? website,
    ValueGetter<CompanyEntity?>? company,
  }) {
    return UserEntity(
      id: id != null ? id() : this.id,
      name: name != null ? name() : this.name,
      username: username != null ? username() : this.username,
      email: email != null ? email() : this.email,
      address: address != null ? address() : this.address,
      phone: phone != null ? phone() : this.phone,
      website: website != null ? website() : this.website,
      company: company != null ? company() : this.company,
    );
  }

  @override
  String toString() {
    return 'UserEntity {"id": $id, "name": $name, "username": $username, "email": $email, "address": $address, "phone": $phone, "website": $website, "company": $company, }';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'address': address?.toMap(),
      'phone': phone,
      'website': website,
      'company': company?.toMap(),
    };
  }

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      id: map['id'] != null ? int.parse("${map['id']}") : null,
      name: map['name'],
      username: map['username'],
      email: map['email'],
      address:
          map['address'] != null ? AddressEntity.fromMap(map['address']) : null,
      phone: map['phone'],
      website: map['website'],
      company:
          map['company'] != null ? CompanyEntity.fromMap(map['company']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserEntity.fromJson(String source) =>
      UserEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant UserEntity other) {
    if (identical(this, other)) return true;
    return id == other.id &&
        name == other.name &&
        username == other.username &&
        email == other.email &&
        address == other.address &&
        phone == other.phone &&
        website == other.website &&
        company == other.company;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        username.hashCode ^
        email.hashCode ^
        address.hashCode ^
        phone.hashCode ^
        website.hashCode ^
        company.hashCode;
  }
}
