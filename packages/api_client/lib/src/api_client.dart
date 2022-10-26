import 'package:api_client/src/resources/accounts_resource.dart';
import 'package:http/http.dart' as http;

/// {@template api_client}
/// API client
/// {@endtemplate}
class ApiClient {
  /// {@macro api_client}
  const ApiClient({http.Client? httpClient})
          : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;

  /// access property for [AccountsResource]
  late final AccountsResource accountsResource = 
          AccountsResource(httpClient: _httpClient);
}

