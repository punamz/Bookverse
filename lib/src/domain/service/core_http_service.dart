abstract class CoreHttpService {
  Future<dynamic> get(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
  });

  Future<dynamic> post(
    String url,
    Map<String, dynamic> data, {
    Map<String, String>? headers,
  });

  Future<dynamic> patch(
    String url,
    Map<String, dynamic> data, {
    Map<String, String>? headers,
  });
  void cancelRequest([dynamic reason]);
}
