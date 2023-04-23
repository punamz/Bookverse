import 'dart:developer';
import 'dart:io';

import 'package:bookverse/core/api_endpoint.dart';
import 'package:bookverse/src/domain/service/core_http_service.dart';
import 'package:dio/dio.dart';

class CoreHttpImplement implements CoreHttpService {
  CancelToken cancelToken = CancelToken();
  final Dio _dio = Dio(BaseOptions(
    baseUrl: ApiEndpoint.baseUrl,
    contentType: ContentType.json.value,
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
    responseType: ResponseType.plain,
  ));

  @override
  Future get(String url,
      {Map<String, String>? headers, Map<String, dynamic>? queryParameters}) async {
    final response = await _dio.get(
      url,
      options: Options(headers: headers),
      queryParameters: queryParameters,
      cancelToken: cancelToken,
    );
    log(response.data);
    return response;
  }

  @override
  Future post(String url, Map<String, dynamic> data, {Map<String, String>? headers}) async {
    final Response response = await _dio.post(
      url,
      data: data,
      options: Options(headers: headers),
      cancelToken: cancelToken,
    );

    log(response.data);
    return response;
  }

  @override
  Future patch(String url, Map<String, dynamic> data, {Map<String, String>? headers}) async {
    final Response response = await _dio.patch(
      url,
      data: data,
      options: Options(headers: headers),
      cancelToken: cancelToken,
    );

    log(response.data);
    return response;
  }

  @override
  void cancelRequest([dynamic reason]) {
    cancelToken.cancel(reason);
    cancelToken = CancelToken();
  }
}
