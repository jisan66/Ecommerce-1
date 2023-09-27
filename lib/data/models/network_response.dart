class NetworkResponse{
  final int statusCode;
  final bool isSuccess;
  final Map<String, dynamic>? responseBody;

  NetworkResponse(this.statusCode, this.isSuccess, this.responseBody);
}