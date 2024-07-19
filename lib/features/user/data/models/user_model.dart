import 'package:task_app/core/common/exports.dart';
class UserModel extends UserEntity{
UserModel({
    super.id,
    super.name,
    super.username,
    super.email,
    super.address,
    super.phone,
    super.website,
    super.company,
  });
  @override
  String toString() {
    return 'UserModel {"id": $id, "name": $name, "username": $username, "email": $email, "address": $address, "phone": $phone, "website": $website, "company": $company, }';
  }
  @override
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
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id:map['id'] != null ? int.parse("${map['id']}") : null,
      name: map['name'],
      username: map['username'],
      email: map['email'],
      address:map['address'] !=null ? AddressModel.fromMap(map['address']): null,
      phone: map['phone'],
      website: map['website'],
      company:map['company'] !=null ? CompanyModel.fromMap(map['company']): null,
    );
  }
}

