import 'package:task_app/core/common/exports.dart';
// ! DO NOT MODIFY THIS FILE


class DioErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response != null) {
      // Handle server errors
      if (err.response!.statusCode! >= 300) {
        err = DioException(
          requestOptions: err.requestOptions,
          response: err.response,
          error: i10n.error_serverError,
          type: err.type,
        );
      } else {
        err = DioException(
          requestOptions: err.requestOptions,
          response: err.response,
          error: i10n.error_somethingWentWrong,
          type: err.type,
        );
      }
    } else {
      // Handle connection errors
      err = DioException(
        requestOptions: err.requestOptions,
        error: i10n.error_connectionError,
        type: err.type,
      );
    }
    super.onError(err, handler);
  }
}
