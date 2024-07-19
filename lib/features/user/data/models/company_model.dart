import 'package:task_app/core/common/exports.dart';
import '../../domain/entities/company_entity.dart';
class CompanyModel extends CompanyEntity{
CompanyModel({
    super.name,
    super.catchPhrase,
    super.bs,
  });
  @override
  String toString() {
    return 'CompanyModel {"name": $name, "catchPhrase": $catchPhrase, "bs": $bs, }';
  }
  @override
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'catch_phrase': catchPhrase,
      'bs': bs,
    };
  }
  factory CompanyModel.fromMap(Map<String, dynamic> map) {
    return CompanyModel(
      name: map['name'],
      catchPhrase: map['catch_phrase'],
      bs: map['bs'],
    );
  }
}

