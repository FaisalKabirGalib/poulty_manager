import 'package:dio/dio.dart';

abstract interface class RequestStrategy {
  Future<Response<T>> request<T>(RequestOptions request);
}

class RequestClient implements RequestStrategy {
  final Dio _dio;

  RequestClient(this._dio);

  @override
  Future<Response<T>> request<T>(RequestOptions request) async {
    return await _dio.request<T>(
      request.path,
      data: request.data,
      options: Options(
        method: request.method,
        headers: request.headers,
        contentType: request.contentType,
      ),
    );
  }
}

class HandleErrorStrategy implements RequestStrategy {
  final RequestStrategy _strategy;

  HandleErrorStrategy(this._strategy);

  @override
  Future<Response<T>> request<T>(RequestOptions request) async {
    try {
      return await _strategy.request(request).then((res) {
        T? finalData;

        if (res.data
            case {
              'success': bool success,
              'message': String message,
              'data': T data,
            }) {
          if (success) {
            finalData = data;
          } else {
            throw Exception(message);
          }
        } else {
          throw Exception("Invalid response");
        }
        return Response(requestOptions: res.requestOptions, data: finalData);
      });
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(e.response!.data['message']);
      } else {
        throw Exception(e.message);
      }
    }
  }
}

class AddBearerTokenStrategy implements RequestStrategy {
  final RequestStrategy _strategy;
  final String? token;

  AddBearerTokenStrategy(this._strategy, this.token);

  @override
  Future<Response<T>> request<T>(RequestOptions request) async {
    request.headers["Authorization"] = "Bearer ${token ?? ""}";
    return await _strategy.request<T>(request);
  }
}
