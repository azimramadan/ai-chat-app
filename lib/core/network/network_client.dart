abstract class INetworkClient {
  Future<Map<String, dynamic>> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  });
  Future<Map<String, dynamic>> post(
    String endpoint, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  });
  // Future<Map<String, dynamic>> put(
  //   String endpoint , {
  //   Map<String, dynamic>? data,
  //   Map<String, dynamic>? queryParameters,
  // });
  // Future<Map<String, dynamic>> patch(
  //   String endpoint , {
  //   Map<String, dynamic>? data,
  //   Map<String, dynamic>? queryParameters,
  // });
  // Future<Map<String, dynamic>> delete(
  //   String endpoint , {
  //   Map<String, dynamic>? queryParameters,
  // });
}
