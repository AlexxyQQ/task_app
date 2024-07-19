class ApiEndpoints {
  static const Duration receiveTimeout = Duration(seconds: 3);

  static const String baseDomain = "https://jsonplaceholder.typicode.com";
  static const String baseAPIURL = "https://jsonplaceholder.typicode.com";
  static const Map<String, dynamic> defaultHeaders = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };

  // Endpoints
  static const String initialURL = "/";

  // Example
  static const String exampleURL = "/example";
  // Posts
  static const String postURL = "/posts";
}
