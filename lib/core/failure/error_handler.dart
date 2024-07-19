import 'package:task_app/core/common/exports.dart';



class AppErrorHandler {
  final String message;
  final String? code;
  final String? data;
  AppErrorHandler({
    required this.message,
    this.code,
    this.data,
  });

  AppErrorHandler copyWith({
    String? message,
    ValueGetter<String?>? code,
    ValueGetter<String?>? data,
  }) {
    return AppErrorHandler(
      message: message ?? this.message,
      code: code != null ? code() : this.code,
      data: data != null ? data() : this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'code': code,
      'data': data,
    };
  }

  factory AppErrorHandler.fromMap(Map<String, dynamic> map) {
    return AppErrorHandler(
      message: map['message'] ?? '',
      code: map['code'],
      data: map['data'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AppErrorHandler.fromJson(String source) =>
      AppErrorHandler.fromMap(json.decode(source));

  @override
  String toString() =>
      'AppErrorHandler(message: $message, code: $code, data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppErrorHandler &&
        other.message == message &&
        other.code == code &&
        other.data == data;
  }

  @override
  int get hashCode => message.hashCode ^ code.hashCode ^ data.hashCode;

  static AppErrorHandler fromDioException(DioException e) {
    return AppErrorHandler(
      message: e.message ?? i10n.error_somethingWentWrong,
      code: e.response?.statusCode.toString(),
      data: e.response?.data.toString(),
    );
  }
}
