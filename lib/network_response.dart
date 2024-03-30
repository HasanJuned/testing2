class NetworkResponse {
  final int statusCode;
  final bool isSuccess;
  final Map<String, dynamic>? responseJson;

  NetworkResponse(this.isSuccess, this.statusCode, this.responseJson);
}