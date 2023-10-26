class DioExceptions implements Exception {
  // static late String message;
  // // static int statusCode = -1;

  // DioExceptions.fromDioError(
  //     {int? statusCode, DioError? dioError, required String? errorFrom}) {
  //   if (statusCode != null) {
  //     message = _handleError(
  //       statusCode,
  //       '',
  //     );
  //   } else {
  //     switch (dioError!.type) {
  //       case DioErrorType.cancel:
  //         message = "Request to API server was cancelled";
  //         break;
  //       case DioErrorType.connectTimeout:
  //         message = "Connection timeout with API server";
  //         break;
  //       case DioErrorType.receiveTimeout:
  //         message = "Receive timeout in connection with API server";
  //         break;
  //       case DioErrorType.response:
  //         message = _handleError(
  //           dioError.response?.statusCode,
  //           dioError.response?.data,
  //         );
  //         statusCode = dioError.response?.statusCode ?? -1;
  //         break;
  //       case DioErrorType.sendTimeout:
  //         message = "Send timeout in connection with API server";
  //         break;
  //       case DioErrorType.other:
  //         if (dioError.message.contains("SocketException")) {
  //           message = 'No Internet';
  //           break;
  //         }
  //         message = "Unexpected error occurred";
  //         break;
  //       default:
  //         message = "Something went wrong";
  //         break;
  //     }
  //   }
  // }

  // String _handleError(int? statusCode, dynamic error) {
  //   switch (statusCode) {
  //     case 400:
  //       return 'Bad Request';
  //     case 401:
  //       return 'Unauthorized';
  //     case 403:
  //       return 'Forbidden';
  //     case 404:
  //       return 'Not Found';
  //     case 413:
  //       return 'Request Entity Too Large';
  //     case 426:
  //       return 'Update Required';
  //     case 429:
  //       return 'Too Many Requests';
  //     case 500:
  //       return 'Internal Server Error';
  //     case 502:
  //       return 'Bad gateway';
  //     default:
  //       return 'Oops something went wrong';
  //   }
  // }

  // String errorMessage() => message;

  // int errorStatusCode() => statusCode;
}
